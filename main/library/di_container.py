from dependency_injector import providers, containers

class Container(containers.DeclarativeContainer):
    config = providers.Configuration()

    # Use cases
    create_user = providers.Factory(
        CreateUser,
        users_repository=users_repository,
    )
