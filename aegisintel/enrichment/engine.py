from aegisintel.core.exceptions import ValidationError
from aegisintel.models.ioc import IOCResult
from aegisintel.utils.validators import detect_ioc_type

from .providers.mock_geoip import MockGeoIPProvider
from .providers.mock_whois import MockWhoisProvider


class EnrichmentEngine:
    def __init__(self) -> None:
        self.providers = [
            MockGeoIPProvider(),
            MockWhoisProvider(),
        ]

    def enrich(self, value: str) -> IOCResult:
        ioc_type = detect_ioc_type(value)

        if ioc_type.value == "unknown":
            raise ValidationError(f"Unsupported or invalid IOC: {value}")

        result = IOCResult(value=value, ioc_type=ioc_type)

        for provider in self.providers:
            result = provider.enrich(result)

        return result
