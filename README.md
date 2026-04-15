🛡️ AegisIntel

Defensive threat intelligence platform that aggregates, normalizes, and correlates indicators of compromise (IOCs) to produce actionable insights.
#

AegisIntel is a defensive cyber threat intelligence platform designed for the ingestion, enrichment, and correlation of indicators of compromise (IOCs) from multiple OSINT sources.

The system transforms fragmented data into structured intelligence, enabling pattern identification, threat prioritization, and the generation of actionable insights for security environments.

AegisIntel is built as a modular and extensible core, integrating ingestion pipelines, enrichment engines, and correlation capabilities, aiming to simulate real-world Threat Intelligence and Security Operations Center (SOC) systems.


AegisIntel es una plataforma de ciberinteligencia orientada a la defensa, diseñada para la recolección, enriquecimiento y correlación de indicadores de compromiso (IOCs) provenientes de múltiples fuentes OSINT.

El sistema permite transformar datos dispersos en inteligencia estructurada, facilitando la identificación de patrones, priorización de amenazas y generación de insights accionables para entornos de seguridad.

AegisIntel está pensado como un núcleo modular extensible, integrando pipelines de ingestión, motores de enriquecimiento, y capacidades de correlación, con el objetivo de simular y aproximarse a sistemas utilizados en operaciones reales de Threat Intelligence y Security Operations Centers (SOC).
#
Estructura inicial del proyecto
```
aegisintel/
├── .gitignore
├── LICENSE
├── README.md
├── requirements.txt
├── aegisintel/
│   ├── __init__.py
│   ├── api/
│   │   ├── __init__.py
│   │   └── main.py
│   ├── cli/
│   │   ├── __init__.py
│   │   └── main.py
│   ├── core/
│   │   ├── __init__.py
│   │   ├── config.py
│   │   └── exceptions.py
│   ├── correlation/
│   │   ├── __init__.py
│   │   └── engine.py
│   ├── enrichment/
│   │   ├── __init__.py
│   │   ├── engine.py
│   │   └── providers/
│   │       ├── __init__.py
│   │       ├── base.py
│   │       ├── mock_geoip.py
│   │       └── mock_whois.py
│   ├── ingestion/
│   │   ├── __init__.py
│   │   └── parsers.py
│   ├── models/
│   │   ├── __init__.py
│   │   └── ioc.py
│   ├── storage/
│   │   ├── __init__.py
│   │   └── memory.py
│   └── utils/
│       ├── __init__.py
│       └── validators.py
└── tests/
    ├── test_engine.py
    └── test_validators.py
```
	
#
```
🎯 Core Capabilities
	•	🔍 IOC ingestion from OSINT sources
	•	🧬 IOC enrichment (IP, domain, hash intelligence)
	•	🔗 Correlation and pattern detection
	•	📊 Threat scoring and prioritization
	•	🧠 Structured intelligence generation
```
#

```
Core
	•	Python 3.11+
	•	FastAPI (API moderna)
	•	asyncio (procesamiento concurrente)

Data
	•	PostgreSQL (persistencia)
	•	Redis (cache / colas ligeras)

Enriquecimiento / OSINT
	•	Requests / httpx
	•	Integración futura con:
	•	AbuseIPDB
	•	AlienVault OTX
	•	VirusTotal (opcional)

CLI
	•	Typer (elegante, moderno)

Otros
	•	Docker (opcional pero recomendado)
	•	Pydantic (validación de datos)
```
  #
  🧱 Architecture
  
```
aegisintel/
│
├── core/           # Core logic
├── ingestion/      # OSINT data ingestion
├── enrichment/     # IOC enrichment engine
├── correlation/    # Correlation and analysis
├── api/            # FastAPI service
├── cli/            # CLI interface
├── models/         # Data schemas (Pydantic)
├── storage/        # Database layer
├── utils/
├── tests/
└── README.md
```
#
Getting Started

1. Clone the repository
```
git clone https://github.com/your-username/aegisintel.git
cd aegisintel
```

2. Create virtual environment
```
python3 -m venv venv
source venv/bin/activate
```

3. Install dependencies
```
pip install -r requirements.txt

```

🧪 Example Usage (CLI)
```
aegisintel ioc enrich 8.8.8.8
```

Output:
```
{
  "ip": "8.8.8.8",
  "country": "US",
  "asn": "AS15169",
  "reputation": "low",
  "sources": ["geoip", "whois"]
}
```


🔄 Development Workflow

Branching model
```
main
dev
feature/*
```


Flow
```

	1.	Create a feature branch
	2.	Develop and commit
	3.	Open Pull Request → dev
	4.	Merge into main when stable

```


🧭 Roadmap

```
Phase 1 — MVP
	•	Basic IOC ingestion
	•	Enrichment (GeoIP, WHOIS)
	•	CLI interface

Phase 2
	•	Database integration
	•	Data normalization
	•	Threat scoring

Phase 3
	•	Correlation engine
	•	Pattern detection
	•	REST API

Phase 4
	•	Dashboard (optional)
	•	Automated pipelines
	•	Reporting

⸻

🧠 Design Principles
	•	Modular architecture
	•	Extensibility by design
	•	Clear separation of concerns
	•	Real-world applicability
	•	Defensive-first approach

```

🤝 Contributing

Contributions, ideas, and discussions are welcome.



📄 License

BSD-3-Clause license 


#


⚠️ Disclaimer

This project is intended for defensive security and research purposes only.
Any misuse of this software is not the responsibility of the authors.





















