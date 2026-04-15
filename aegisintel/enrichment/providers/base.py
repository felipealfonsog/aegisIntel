from abc import ABC, abstractmethod

from aegisintel.models.ioc import IOCResult


class EnrichmentProvider(ABC):
    name: str

    @abstractmethod
    def enrich(self, result: IOCResult) -> IOCResult:
        raise NotImplementedError
