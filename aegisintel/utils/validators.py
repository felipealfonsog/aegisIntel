import ipaddress
import re

from aegisintel.models.ioc import IOCType

DOMAIN_REGEX = re.compile(
    r"^(?!-)(?:[a-zA-Z0-9-]{1,63}\.)+[A-Za-z]{2,63}$"
)

HASH_REGEX = re.compile(r"^[A-Fa-f0-9]{32}$|^[A-Fa-f0-9]{40}$|^[A-Fa-f0-9]{64}$")


def is_ip(value: str) -> bool:
    try:
        ipaddress.ip_address(value)
        return True
    except ValueError:
        return False


def is_domain(value: str) -> bool:
    return bool(DOMAIN_REGEX.fullmatch(value.strip()))


def is_hash(value: str) -> bool:
    return bool(HASH_REGEX.fullmatch(value.strip()))


def detect_ioc_type(value: str) -> IOCType:
    cleaned = value.strip()

    if is_ip(cleaned):
        return IOCType.IP
    if is_domain(cleaned):
        return IOCType.DOMAIN
    if is_hash(cleaned):
        return IOCType.HASH
    return IOCType.UNKNOWN
