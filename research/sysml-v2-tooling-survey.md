# SysML v2 Tooling Survey (Open-Source Focus)

## Scope
This note focuses on tools that can **build, parse, validate, execute, or serve SysML v2 artifacts**, and distinguishes those with **visualization/UI** from **headless/non-visual** tooling. Preference is given to repositories that are open-source and can be inspected/edited directly.

## Quick shortlist

| Tool / Project | Primary role | Visualization | Build/Compile capability | Open source + editable? |
|---|---|---|---|---|
| Systems-Modeling / SysML-v2-Pilot-Implementation | Reference/pilot implementation and editors | Yes (Eclipse-based editors; optional PlantUML visualization) | Yes (Eclipse/Java build, textual parsing/processing) | Yes (LGPL in repo) |
| eclipse-syson / syson (Eclipse SysON) | Web-based SysML v2 modeling workbench | Yes (graphical, textual, form-based, table editors) | Yes (toolchain builds full modeling app) | Yes (EPL 2.0) |
| Systems-Modeling / SysML-v2-API-Services | REST API + backend services for SysML v2 models | Limited (Swagger/OpenAPI docs), mostly headless | Yes (`sbt clean`, `sbt run`; backend service compile/run) | Yes (public repo; source available) |
| Systems-Modeling / SysML-v2-API-{Java,Python}-Client | Programmatic clients for SysML v2 API | No | Supports automation/integration (not modeling UI) | Yes (public repos; source available) |
| sensmetry / sysml-2ls (SysIDE Legacy) | Textual parser + language server tooling | Mostly textual editor UX (VS Code), no rich diagram canvas | Yes (language services/parser toolchain) | Yes, but deprecated legacy codebase |

## What each gives you

### 1) SysML-v2-Pilot-Implementation (Systems-Modeling)
- The pilot implementation is positioned as a reference implementation with installation and development instructions for Eclipse-based environments.
- The README explicitly documents optional **PlantUML visualization** support via GraphViz setup.
- Strong choice if you want to inspect the language implementation internals and contribute close to OMG reference artifacts.

**Good for:** language-focused development, reference behavior, Eclipse ecosystem.

## 2) Eclipse SysON (eclipse-syson)
- SysON describes itself as an open-source web-based SysML v2 tool.
- It explicitly includes **graphical, textual, form-based and table editors**, making it one of the most UI-rich open-source options.
- It is designed for interoperability and MBSE workflows, including integration ambitions with other Eclipse modeling tools.

**Good for:** teams needing a modern browser-based collaborative modeling UX with visual editors.

## 3) SysML-v2-API-Services (Systems-Modeling)
- Headless server-side implementation of SysML v2 API/services.
- Setup instructions indicate concrete local build/run flow (`sbt`, PostgreSQL, Java 11).
- Provides Swagger docs at runtime, but this is mainly API exploration rather than model diagramming.

**Good for:** backend integration, automation, model exchange pipelines, custom portals around a service core.

## 4) SysML-v2 API Clients (Java/Python)
- Companion client libraries for interacting with SysML v2 API endpoints.
- Useful as open-source integration layers in CI/CD, analysis scripts, or custom applications.

**Good for:** embedding SysML v2 access into apps and workflows without building a full editor.

## 5) SysIDE Legacy (sensmetry/sysml-2ls)
- Provides open-source textual SysML v2/KerML language tooling (parser + language server features).
- The repository flags itself as **deprecated** and recommends a new editor lineage, so adoption should be deliberate.

**Good for:** understanding language-server architecture and parser integration; less ideal for greenfield production adoption due to deprecation notice.

## Practical recommendation matrix

- If you need **open-source + rich visual modeling now**: start with **Eclipse SysON**.
- If you need **reference semantics/tooling close to OMG working artifacts**: use **SysML-v2-Pilot-Implementation**.
- If you need **headless compile/serve/integration pipeline**: use **SysML-v2-API-Services** plus Java/Python API clients.
- If you need **text-first language tooling internals**: review **sysml-2ls** for patterns, but treat as legacy.

## Repositories (entry points)
- https://github.com/Systems-Modeling/SysML-v2-Release
- https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation
- https://github.com/Systems-Modeling/SysML-v2-API-Services
- https://github.com/Systems-Modeling/SysML-v2-API-Java-Client
- https://github.com/Systems-Modeling/SysML-v2-API-Python-Client
- https://github.com/eclipse-syson/syson
- https://github.com/sensmetry/sysml-2ls

