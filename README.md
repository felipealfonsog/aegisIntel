🛡️📡 AegisIntel

Defensive threat intelligence platform that aggregates, normalizes, and correlates indicators of compromise (IOCs) to produce actionable insights.
#

🇬🇧

AegisIntel is a defensive cyber threat intelligence platform designed for the ingestion, enrichment, and correlation of indicators of compromise (IOCs) from multiple OSINT sources.

The system transforms fragmented data into structured intelligence, enabling pattern identification, threat prioritization, and the generation of actionable insights for security environments.

AegisIntel is built as a modular and extensible core, integrating ingestion pipelines, enrichment engines, and correlation capabilities, aiming to simulate real-world Threat Intelligence and Security Operations Center (SOC) systems.

🇨🇱

AegisIntel es una plataforma de ciberinteligencia orientada a la defensa, diseñada para la recolección, enriquecimiento y correlación de indicadores de compromiso (IOCs) provenientes de múltiples fuentes OSINT.

El sistema permite transformar datos dispersos en inteligencia estructurada, facilitando la identificación de patrones, priorización de amenazas y generación de insights accionables para entornos de seguridad.

AegisIntel está pensado como un núcleo modular extensible, integrando pipelines de ingestión, motores de enriquecimiento, y capacidades de correlación, con el objetivo de simular y aproximarse a sistemas utilizados en operaciones reales de Threat Intelligence y Security Operations Centers (SOC).

#

#### Setup Helper Scripts

AegisIntel provides helper scripts to simplify environment setup, dependency installation, and basic project execution.

---

#### How to use

#### Linux / Kali / Arch / BlackArch / macOS

Download the script:
```
https://raw.githubusercontent.com/felipealfonsog/aegisintel/refs/heads/main/install-essentials.sh
```
Make it executable and run it:

```bash
chmod +x install-essentials.sh
./install-essentials.sh
```
#### Windows

Download the script:
```
https://raw.githubusercontent.com/felipealfonsog/aegisintel/refs/heads/main/install-essentials.bat
```
Run it by double-clicking the file, or from CMD / PowerShell:
```
install-essentials.bat
```
or:
```
.\install-essentials.bat
```
What these scripts do

install-essentials.sh

#### Provides an interactive menu to:

* install Python and required system dependencies
* create a virtual environment (venv)
* install project dependencies from requirements.txt
* run a CLI demo
* start the API server

⸻

install-essentials.bat

#### Provides equivalent functionality for Windows environments, compatible with CMD / PowerShell.

⸻

#### Notes

* These scripts are intended to simplify onboarding and reduce setup friction.
* Manual setup is still supported if preferred.
* Designed for consistency across development environments.


#

RUN THE PROJECT

Cómo ejecutar el proyecto
Crear entorno e instalar

```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```
Probar CLI
```
python -m aegisintel.cli.main ioc enrich 8.8.8.8
```
Probar API
```
uvicorn aegisintel.api.main:app --reload
```


Luego:
```
	•	http://127.0.0.1:8000/health
	•	http://127.0.0.1:8000/ioc/enrich?value=8.8.8.8
```

	Correr tests
```
pytest
```
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

Made with love ❤️ from Chile 🇨🇱

BSD-3-Clause license 


#


⚠️ Disclaimer

This project is intended for defensive security and research purposes only.
Any misuse of this software is not the responsibility of the authors.





















