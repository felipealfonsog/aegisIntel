from aegisintel.models.ioc import IOCInput


def parse_ioc(raw_value: str) -> IOCInput:
    return IOCInput(value=raw_value.strip())
