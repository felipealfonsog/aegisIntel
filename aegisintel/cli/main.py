import json

import typer

from aegisintel.core.exceptions import ValidationError
from aegisintel.enrichment.engine import EnrichmentEngine

app = typer.Typer(help="AegisIntel CLI")
ioc_app = typer.Typer(help="IOC operations")

app.add_typer(ioc_app, name="ioc")

engine = EnrichmentEngine()


@ioc_app.command("enrich")
def enrich_ioc(
    value: str = typer.Argument(..., help="IOC value to enrich"),
    pretty: bool = typer.Option(True, "--pretty/--compact", help="Pretty-print JSON"),
) -> None:
    try:
        result = engine.enrich(value)
        if pretty:
            typer.echo(json.dumps(result.model_dump(), indent=2))
        else:
            typer.echo(json.dumps(result.model_dump()))
    except ValidationError as exc:
        typer.echo(f"Error: {exc}", err=True)
        raise typer.Exit(code=1) from exc


@app.command("version")
def version() -> None:
    typer.echo("AegisIntel 0.1.0")


if __name__ == "__main__":
    app()
