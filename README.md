# aegisIntel
AegisIntel - Defensive threat intelligence platform that aggregates, normalizes, and correlates indicators of compromise (IOCs) to produce actionable insights.

#

AegisIntel is a defensive cyber threat intelligence platform designed for the ingestion, enrichment, and correlation of indicators of compromise (IOCs) from multiple OSINT sources.

The system transforms fragmented data into structured intelligence, enabling pattern identification, threat prioritization, and the generation of actionable insights for security environments.

AegisIntel is built as a modular and extensible core, integrating ingestion pipelines, enrichment engines, and correlation capabilities, aiming to simulate real-world Threat Intelligence and Security Operations Center (SOC) systems.


AegisIntel es una plataforma de ciberinteligencia orientada a la defensa, diseñada para la recolección, enriquecimiento y correlación de indicadores de compromiso (IOCs) provenientes de múltiples fuentes OSINT.

El sistema permite transformar datos dispersos en inteligencia estructurada, facilitando la identificación de patrones, priorización de amenazas y generación de insights accionables para entornos de seguridad.

AegisIntel está pensado como un núcleo modular extensible, integrando pipelines de ingestión, motores de enriquecimiento, y capacidades de correlación, con el objetivo de simular y aproximarse a sistemas utilizados en operaciones reales de Threat Intelligence y Security Operations Centers (SOC).

#

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

  #

  aegisintel/
│
├── core/           # lógica central
├── ingestion/      # recolección de datos OSINT
├── enrichment/     # enriquecimiento de IOCs
├── correlation/    # análisis y correlación
├── api/            # FastAPI
├── cli/            # herramienta CLI
├── models/         # esquemas de datos (Pydantic)
├── storage/        # DB / persistencia
├── utils/
├── tests/
└── README.md

#

