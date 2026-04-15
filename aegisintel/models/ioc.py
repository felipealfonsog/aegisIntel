from enum import Enum
from typing import Any

from pydantic import BaseModel, Field


class IOCType(str, Enum):
    IP = "ip"
    DOMAIN = "domain"
    HASH = "hash"
    UNKNOWN = "unknown"


class IOCInput(BaseModel):
    value: str = Field(..., min_length=1)


class IOCResult(BaseModel):
    value: str
    ioc_type: IOCType
    country: str | None = None
    asn: str | None = None
    whois_org: str | None = None
    reputation: str | None = None
    sources: list[str] = Field(default_factory=list)
    metadata: dict[str, Any] = Field(default_factory=dict)
