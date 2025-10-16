# Brasileirão Tabela 2025

Aplicativo Flutter para acompanhamento do Campeonato Brasileiro de Futebol, com tabela, estatísticas, artilheiros e detalhes dos times.
## Demonstração
https://youtube.com/shorts/b5KzdXXEyNo?si=LeERIpx1hL0VZ_jd

---

## 📱 Funcionalidades

- **Tabela dos times:**  
  Visualização dos clubes do Brasileirão, ordenados por pontuação, com escudo, posição e estatísticas principais.

- **Busca de times:**  
  Pesquisa rápida pelo nome do clube na tabela.

- **Indicadores de classificação:**  
  Cores e ícones indicam zona de Libertadores, Sul-Americana e rebaixamento.

- **Detalhes do time:**  
  Ao clicar em um clube, exibe escudo ampliado, títulos brasileiros e estatísticas detalhadas da temporada.

- **Estatísticas de jogadores:**  
  Aba exclusiva para artilheiros, mostrando líderes em gols e assistências, com escudo do time.

- **Interface moderna:**  
  Layout responsivo, Material Design, cards personalizados e navegação intuitiva por abas.

---

## 🎯 Objetivos de Aprendizagem

- Navegação entre telas com passagem de parâmetros
- Gerenciamento de estado com setState
- Consumo de dados locais (JSON/assets)
- Princípios de UI/UX design e responsividade
- Programação assíncrona com FutureBuilder

---

## 🛠 Estrutura do Projeto

```
lib/
├── main.dart                # Ponto de entrada do app
├── tabela_brasileirao.dart  # Tela principal com tabela e estatísticas
├── detalhe_time_page.dart   # Tela de detalhes do time
├── time.dart                # Modelo de dados do time
├── artilheiro_page.dart     # Modelo e tela de artilheiros
assets/
└── images/                  # Escudos dos times
└── times.json               # Dados dos times em JSON
```

---

## ⚡ Como rodar o projeto

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/JoaoAndreBSantana/BrasileiraoTabela2025.git
   cd BrasileiraoTabela2025
   ```

2. **Instale as dependências:**
   ```sh
   flutter pub get
   ```

3. **Execute o app:**
   ```sh
   flutter run
   ```

---

## 📂 Dados e Assets

- Os dados dos times estão em `assets/times.json`.
- Os escudos dos clubes devem estar em `assets/images/` e declarados no `pubspec.yaml`.

---

## ✨ Diferenciais

- Interface intuitiva e responsiva
- Indicadores visuais para classificação
- Pesquisa rápida de clubes
- Estatísticas de jogadores com escudo do time

---

## 📦 Dependências principais

- [Flutter](https://flutter.dev/)
- [Material Design](https://m3.material.io/)

---

## 📄 Licença

Projeto acadêmico sem fins lucrativos.  
© 2025 João André B Santana
