from fastapi import APIRouter

router = APIRouter()

@router.post("/recognize")
def recognize():
    return {"message": "Reconocimiento facial"}