import pytest

from aegisintel.core.exceptions import ValidationError
from aegisintel.enrichment.engine import EnrichmentEngine
from aegisintel.models.ioc import IOCType


def test_enrich_ip() -> None:
    engine = EnrichmentEngine()
    result = engine.enrich("8.8.8.8")

    assert result.ioc_type == IOCType.IP
    assert result.country == "US"
    assert result.reputation == "low"
    assert "mock_geoip" in result.sources
    assert "mock_whois" in result.sources


def test_enrich_domain() -> None:
    engine = EnrichmentEngine()
    result = engine.enrich("example.com")

    assert result.ioc_type == IOCType.DOMAIN
    assert result.reputation == "medium"


def test_enrich_invalid() -> None:
    engine = EnrichmentEngine()

    with pytest.raises(ValidationError):
        engine.enrich("%%%")
