from aegisintel.models.ioc import IOCResult


class CorrelationEngine:
    def correlate(self, results: list[IOCResult]) -> dict:
        if not results:
            return {
                "count": 0,
                "ioc_types": {},
                "reputation_summary": {},
            }

        ioc_types: dict[str, int] = {}
        reputation_summary: dict[str, int] = {}

        for item in results:
            ioc_types[item.ioc_type.value] = ioc_types.get(item.ioc_type.value, 0) + 1
            if item.reputation:
                reputation_summary[item.reputation] = (
                    reputation_summary.get(item.reputation, 0) + 1
                )

        return {
            "count": len(results),
            "ioc_types": ioc_types,
            "reputation_summary": reputation_summary,
        }
