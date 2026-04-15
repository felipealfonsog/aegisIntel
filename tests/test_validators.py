from aegisintel.models.ioc import IOCType
from aegisintel.utils.validators import detect_ioc_type, is_domain, is_hash, is_ip


def test_is_ip() -> None:
    assert is_ip("8.8.8.8") is True
    assert is_ip("999.999.999.999") is False


def test_is_domain() -> None:
    assert is_domain("example.com") is True
    assert is_domain("bad_domain") is False


def test_is_hash() -> None:
    assert is_hash("d41d8cd98f00b204e9800998ecf8427e") is True
    assert is_hash("notahash") is False


def test_detect_ioc_type() -> None:
    assert detect_ioc_type("8.8.8.8") == IOCType.IP
    assert detect_ioc_type("example.com") == IOCType.DOMAIN
    assert detect_ioc_type("d41d8cd98f00b204e9800998ecf8427e") == IOCType.HASH
    assert detect_ioc_type("???") == IOCType.UNKNOWN
