from fastapi import FastAPI, HTTPException  # Import FastAPI and error helper
from pydantic import BaseModel  # Base class for request/response models
from typing import Optional, List  # Optional and List type hints

app = FastAPI(title="Task Service")  # Main FastAPI application instance


# ----- Pydantic models (data shapes) ----- #

class TaskBase(BaseModel):  # Shared fields for creating/updating tasks
    title: str  # Short title for the task
    description: Optional[str] = None  # Optional longer description
    completed: bool = False  # Task status flag (false by default)


class Task(TaskBase):  # Full task model returned to clients
    id: int  # Unique identifier for this task


# ----- In-memory storage (simple "database") ----- #

tasks: List[Task] = []  # List to store tasks in memory only
next_id: int = 1  # Simple incremental ID counter


# ----- Health check endpoint ----- #

@app.get("/health")  # HTTP GET /health
def health_check():
    return {"status": "ok"}  # Used by monitoring / load balancers


# ----- Create a new task ----- #

@app.post("/tasks", response_model=Task, status_code=201)  # HTTP POST /tasks
def create_task(task_input: TaskBase):
    """
    Create a new task and store it in memory.
    """
    global next_id  # Use the global counter to assign IDs

    task = Task(id=next_id, **task_input.model_dump())  # Build Task object
    tasks.append(task)  # Save task in the in-memory list
    next_id += 1  # Increase counter for the next task

    return task  # FastAPI will return this as JSON


# ----- List all tasks ----- #

@app.get("/tasks", response_model=List[Task])  # HTTP GET /tasks
def list_tasks():
    """
    Return all tasks stored in memory.
    """
    return tasks  # Just return the in-memory list


# ----- Update an existing task ----- #

@app.put("/tasks/{task_id}", response_model=Task)  # HTTP PUT /tasks/{task_id}
def update_task(task_id: int, task_input: TaskBase):
    """
    Replace an existing task with new data.
    """
    for index, existing_task in enumerate(tasks):  # Loop over stored tasks
        if existing_task.id == task_id:  # Found the task to update
            updated_task = Task(id=task_id, **task_input.model_dump())
            tasks[index] = updated_task  # Replace old task with new one
            return updated_task

    # If we reach here, task was not found
    raise HTTPException(status_code=404, detail="Task not found")  # 404 error


# ----- Delete a task ----- #

@app.delete("/tasks/{task_id}", status_code=204)  # HTTP DELETE /tasks/{task_id}
def delete_task(task_id: int):
    """
    Delete a task by its ID.
    """
    for index, existing_task in enumerate(tasks):
        if existing_task.id == task_id:
            tasks.pop(index)  # Remove task from list
            return  # 204 No Content

    # Task does not exist
    raise HTTPException(status_code=404, detail="Task not found")
