from fastapi import FastAPI

from app.routes import user_routes
from app.routes import auth_routes
from app.routes import biometric_routes
from app.routes import admin_routes

app = FastAPI()

app.include_router(user_routes.router)
app.include_router(auth_routes.router)
app.include_router(biometric_routes.router)
app.include_router(admin_routes.router)