"""Ponto de entrada da Agenda Arretada."""
import sys

from PySide6.QtWidgets import QApplication, QMessageBox

from interfaces.estilo import FOLHA_DE_ESTILO
from interfaces.janela_principal import JanelaPrincipal
from modulos import banco
from modulos.compromissos import RepositorioCompromissos


def main() -> int:
    app = QApplication(sys.argv)
    app.setApplicationName("Agenda Arretada")
    app.setStyleSheet(FOLHA_DE_ESTILO)
    try:
        conn = banco.conectar()
    except Exception as erro:  # banco corrompido, sem permissão, etc.
        QMessageBox.critical(None, "Erro", f"Não foi possível abrir o banco de dados:\n{erro}")
        return 1
    janela = JanelaPrincipal(RepositorioCompromissos(conn))
    janela.show()
    codigo = app.exec()
    conn.close()
    return codigo


if __name__ == "__main__":
    sys.exit(main())
