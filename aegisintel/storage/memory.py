from aegisintel.models.ioc import IOCResult


class InMemoryStore:
    def __init__(self) -> None:
        self._items: list[IOCResult] = []

    def save(self, result: IOCResult) -> None:
        self._items.append(result)

    def list_all(self) -> list[IOCResult]:
        return list(self._items)

    def clear(self) -> None:
        self._items.clear()
