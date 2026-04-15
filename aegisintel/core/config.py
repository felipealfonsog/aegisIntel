from pydantic import BaseModel, Field


class Settings(BaseModel):
    app_name: str = Field(default="AegisIntel")
    app_version: str = Field(default="0.1.0")
    debug: bool = Field(default=True)


settings = Settings()
