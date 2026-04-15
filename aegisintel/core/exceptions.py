class AegisIntelError(Exception):
    """Base exception for the project."""


class ValidationError(AegisIntelError):
    """Raised when an IOC is invalid or unsupported."""
