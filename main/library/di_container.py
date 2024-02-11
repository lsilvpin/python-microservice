from dependency_injector import providers, containers
from fastapi import APIRouter
from main.entrypoint.controllers.main_controller import router as main_controller_router

class Container(containers.DeclarativeContainer):
    pass