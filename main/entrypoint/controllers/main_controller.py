import platform
from dependency_injector.wiring import inject, Provide
from main.library.di_container import Container
from main.library.tools.core.log_tool import LogTool
from fastapi import APIRouter, Depends

router = APIRouter()

@router.get(
    "/info",
    tags=["Info"],
    responses={
        200: {"description": "Success", "content": {"application/json": {}}},
        500: {
            "description": "Internal Server Error",
            "content": {"application/json": {}},
        },
    },
)
@inject
async def get_info(log_tool: LogTool = Depends(Provide[Container.log_tool])):
    """
    Retorna informações básicas deste micro-serviço.

    Retorna um objeto JSON com o nome, a versão e outras informações úteis do micro-serviço.

    Retorna:
        - 200: Sucesso com as informações básicas do micro-serviço.
        - 500: Erro interno do servidor com a mensagem de erro.
    """
    try:
        # Obtenha as informações básicas do micro-serviço
        name = "Meu Micro-serviço"
        version = "1.0.0"
        system = platform.system()
        machine = platform.machine()
        processor = platform.processor()
        python_version = platform.python_version()

        # Utilize a instância de log_tool para logar informações úteis
        log_tool.info("Informações sobre a API foram requisitadas e retornadas com sucesso.")

        # Retorne as informações com código de sucesso 200
        return {
            "name": name,
            "version": version,
            "system": system,
            "machine": machine,
            "processor": processor,
            "python_version": python_version,
        }
    except Exception as e:
        log_tool.error(f"Erro ao obter informações sobre a API: {str(e)}")
        # Em caso de erro inesperado, retorne código de erro 500 com a mensagem de erro
        return {"error": str(e)}, 500
