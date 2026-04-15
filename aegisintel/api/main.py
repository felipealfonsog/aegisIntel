from fastapi import FastAPI, HTTPException

from aegisintel.core.config import settings
from aegisintel.core.exceptions import ValidationError
from aegisintel.enrichment.engine import EnrichmentEngine

app = FastAPI(title=settings.app_name, version=settings.app_version)
engine = EnrichmentEngine()


@app.get("/health")
def health() -> dict:
    return {
        "status": "ok",
        "service": settings.app_name,
        "version": settings.app_version,
    }


@app.get("/ioc/enrich")
def enrich_ioc(value: str) -> dict:
    try:
        result = engine.enrich(value)
        return result.model_dump()
    except ValidationError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
