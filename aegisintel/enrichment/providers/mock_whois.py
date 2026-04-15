from aegisintel.enrichment.providers.base import EnrichmentProvider
from aegisintel.models.ioc import IOCResult, IOCType


class MockWhoisProvider(EnrichmentProvider):
    name = "mock_whois"

    def enrich(self, result: IOCResult) -> IOCResult:
        if result.ioc_type == IOCType.IP:
            result.whois_org = "Mock Network Registry"
            result.reputation = "low"
            result.sources.append(self.name)
        elif result.ioc_type == IOCType.DOMAIN:
            result.whois_org = "Mock Domain Registrar"
            result.reputation = "medium"
            result.sources.append(self.name)
        elif result.ioc_type == IOCType.HASH:
            result.whois_org = None
            result.reputation = "unknown"
            result.sources.append(self.name)
        return result
