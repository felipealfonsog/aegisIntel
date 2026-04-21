#!/usr/bin/env bash

set -euo pipefail

PROJECT_NAME="AegisIntel"
VENV_DIR="venv"
PYTHON_CMD=""
OS_FAMILY="unknown"

print_header() {
  echo
  echo "========================================"
  echo "  ${PROJECT_NAME} - Environment Helper"
  echo "========================================"
  echo
}

print_info() {
  echo "[INFO] $1"
}

print_warn() {
  echo "[WARN] $1"
}

print_error() {
  echo "[ERROR] $1" >&2
}

pause() {
  echo
  read -r -p "Press Enter to continue..." _
}

detect_os() {
  local uname_out
  uname_out="$(uname -s 2>/dev/null || true)"

  case "${uname_out}" in
    Linux*)
      if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        case "${ID:-}" in
          kali)
            OS_FAMILY="kali"
            ;;
          arch|blackarch)
            OS_FAMILY="arch"
            ;;
          *)
            if [[ "${ID_LIKE:-}" == *"arch"* ]]; then
              OS_FAMILY="arch"
            elif [[ "${ID_LIKE:-}" == *"debian"* ]]; then
              OS_FAMILY="kali"
            else
              OS_FAMILY="linux"
            fi
            ;;
        esac
      else
        OS_FAMILY="linux"
      fi
      ;;
    Darwin*)
      OS_FAMILY="macos"
      ;;
    *)
      OS_FAMILY="unknown"
      ;;
  esac
}

detect_python() {
  if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="python3"
  elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD="python"
  else
    PYTHON_CMD=""
  fi
}

show_detected_os() {
  print_info "Detected platform: ${OS_FAMILY}"
  if [[ -n "${PYTHON_CMD}" ]]; then
    print_info "Detected Python command: ${PYTHON_CMD}"
  else
    print_warn "Python was not detected in PATH"
  fi
}

install_python_dependencies() {
  detect_os
  detect_python

  case "${OS_FAMILY}" in
    kali)
      print_info "Installing system packages for Kali/Debian-like environment..."
      sudo apt update
      sudo apt install -y python3 python3-venv python3-pip
      ;;
    arch)
      print_info "Installing system packages for Arch/BlackArch..."
      sudo pacman -Sy --needed python python-pip
      ;;
    macos)
      print_info "Installing/checking Python for macOS..."
      if ! command -v brew >/dev/null 2>&1; then
        print_error "Homebrew is not installed. Install Homebrew first, then re-run this script."
        exit 1
      fi
      brew install python
      ;;
    linux)
      print_warn "Generic Linux detected. Please ensure Python 3, venv, and pip are installed."
      ;;
    *)
      print_error "Unsupported or unknown Unix-like platform."
      exit 1
      ;;
  esac

  detect_python
  if [[ -z "${PYTHON_CMD}" ]]; then
    print_error "Python is still not available after installation attempt."
    exit 1
  fi

  print_info "System dependency step completed."
}

create_venv() {
  detect_python
  if [[ -z "${PYTHON_CMD}" ]]; then
    print_error "Python not found. Run the system installation step first."
    exit 1
  fi

  if [[ -d "${VENV_DIR}" ]]; then
    print_info "Virtual environment already exists: ${VENV_DIR}"
  else
    print_info "Creating virtual environment..."
    "${PYTHON_CMD}" -m venv "${VENV_DIR}"
  fi
}

install_project_dependencies() {
  if [[ ! -d "${VENV_DIR}" ]]; then
    print_error "Virtual environment not found. Create it first."
    exit 1
  fi

  print_info "Installing Python dependencies from requirements.txt..."
  source "${VENV_DIR}/bin/activate"
  python -m pip install --upgrade pip
  python -m pip install -r requirements.txt
  print_info "Dependencies installed successfully."
}

activate_help() {
  echo
  echo "To activate the environment manually later, run:"
  echo
  echo "  source ${VENV_DIR}/bin/activate"
  echo
}

run_cli_demo() {
  if [[ ! -d "${VENV_DIR}" ]]; then
    print_error "Virtual environment not found."
    exit 1
  fi

  source "${VENV_DIR}/bin/activate"
  print_info "Running CLI demo..."
  python -m aegisintel.cli.main ioc enrich 8.8.8.8
}

run_api() {
  if [[ ! -d "${VENV_DIR}" ]]; then
    print_error "Virtual environment not found."
    exit 1
  fi

  source "${VENV_DIR}/bin/activate"
  echo
  print_info "Starting API server..."
  echo
  echo "Available endpoints:"
  echo "  http://127.0.0.1:8000/health"
  echo "  http://127.0.0.1:8000/ioc/enrich?value=8.8.8.8"
  echo "  http://127.0.0.1:8000/docs"
  echo
  echo "Press CTRL+C to stop the server."
  echo
  uvicorn aegisintel.api.main:app --reload
}

full_setup() {
  install_python_dependencies
  create_venv
  install_project_dependencies
  activate_help
}

menu() {
  while true; do
    clear || true
    print_header
    detect_os
    detect_python
    show_detected_os

    echo
    echo "Select an option:"
    echo
    echo "  1) Install system essentials (Kali / Arch / BlackArch / macOS)"
    echo "  2) Create virtual environment"
    echo "  3) Install Python dependencies (requirements.txt)"
    echo "  4) Full setup (1 + 2 + 3)"
    echo "  5) Run CLI demo"
    echo "  6) Start API server"
    echo "  7) Show manual activation command"
    echo "  0) Exit"
    echo

    read -r -p "Option: " choice

    case "${choice}" in
      1)
        install_python_dependencies
        pause
        ;;
      2)
        create_venv
        pause
        ;;
      3)
        install_project_dependencies
        pause
        ;;
      4)
        full_setup
        pause
        ;;
      5)
        run_cli_demo
        pause
        ;;
      6)
        run_api
        ;;
      7)
        activate_help
        pause
        ;;
      0)
        print_info "Goodbye."
        exit 0
        ;;
      *)
        print_warn "Invalid option."
        pause
        ;;
    esac
  done
}

menu
