from dependency_injector import providers, containers

class Container(containers.DeclarativeContainer):
    config = providers.Configuration()
