# Agenda Arretada — Etapa 1 (protótipo funcional)

## Instalação (Windows)
1. Instale o Python 3.10+ em python.org (marque "Add Python to PATH").
2. No PowerShell, dentro da pasta do projeto:

    python -m venv .venv
    .venv\Scripts\activate
    pip install -r requirements.txt
    python main.py

## Testes (não precisam do PySide6)
    python -m unittest discover -s testes -t . -v

## Onde ficam os dados
`%APPDATA%\AgendaArretada\agenda.db` (no Windows).

## Arquitetura
- `modulos/banco.py` — conexão SQLite e migrações (PRAGMA user_version).
- `modulos/compromissos.py` — modelo, validação e repositório (SQL parametrizado).
- `interfaces/` — só visual; chama o repositório, nunca escreve SQL.
- Próximas etapas plugam em `main.py`: personalidade/voz/lembretes serão módulos
  novos em `modulos/`, e o agendador de lembretes rodará separado da interface.

## Limitações da Etapa 1
Ainda não há lembretes, voz, personalidade, calendário, repetição nem área jurídica.
Horários são salvos como hora local, sem fuso (será tratado na Etapa 3).

## Execução direta (Windows)
- **Iniciar_Agenda.bat** — duplo clique. Na primeira vez prepara o ambiente
  (precisa de internet e Python); depois abre o app direto, sem janela de console.
- **Gerar_EXE.bat** — duplo clique. Gera `dist\AgendaArretada.exe`, um arquivo único
  que roda em qualquer Windows sem precisar de Python instalado.
