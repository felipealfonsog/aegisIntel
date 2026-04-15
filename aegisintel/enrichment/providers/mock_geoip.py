from aegisintel.enrichment.providers.base import EnrichmentProvider
from aegisintel.models.ioc import IOCResult, IOCType


class MockGeoIPProvider(EnrichmentProvider):
    name = "mock_geoip"

    def enrich(self, result: IOCResult) -> IOCResult:
        if result.ioc_type == IOCType.IP:
            result.country = "US"
            result.asn = "AS15169"
            result.sources.append(self.name)
            result.metadata["geo_confidence"] = "mock"
        elif result.ioc_type == IOCType.DOMAIN:
            result.country = "Unknown"
            result.asn = "N/A"
            result.sources.append(self.name)
            result.metadata["geo_confidence"] = "mock"
        return result
