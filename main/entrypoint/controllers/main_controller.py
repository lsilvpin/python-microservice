import platform
from fastapi import APIRouter

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
async def get_info():
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
        # Em caso de erro inesperado, retorne código de erro 500 com a mensagem de erro
        return {"error": str(e)}, 500
