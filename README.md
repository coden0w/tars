# T.A.R.S.
- **T** Tactical.
- **A** Architecture.
- **R** Robust.
- **S** Scalability.

> ## 🧑‍🚀 **Description**

Designed for SwiftUI applications that integrates `MVVM`, `Coordinators` for navigation, `Dependency Injection`, and clearly defined `Domain` and `Data` layers.

Inspired by the reliability, adaptability, and rigor of the marine robots from the movie Interstellar, **T.A.R.S.** aims to provide a solid, maintainable, and scalable foundation, ensuring a more organized and effective development process even in complex and ever-changing environments.

> ## 🚀 Project Structure

Inside of your project, you'll see the following folders and files:

```text
/
├── tars.xcproject
│ 
├── TARS/
│   ├── Application/
│   │   ├── TARSApp.swift
│   │   ├── AppDelegate.swift
│   │   ├── DependencyInjector.swift
│   │   ├── Base/
│   │   │   ├── Coordinator.swift
│   │   │   ├── Errorable.swift
│   │   │   ├── LifeCycle.swift
│   │   │   ├── Navigable.swift
│   │   │   ├── ViewModel.swift
│   │   │   └── Loadable/
│   │   │       └── Loading.swift
│   │   ├── Configuration/
│   │   │   ├── Environment.swift
│   │   │   ├── Info.plist
│   │   │   ├── PRE.xconfig
│   │   │   └── PRO.xconfig
│   │   └── Managers/
│   │       └── *
│   │── Presentation/
│   │   ├── Coordinators/
│   │   └── Modules/
│   │       └── *
├── Domain/
│   ├── Repository/
│   │   ├── ApiRepository.swift
│   │   └── *
│   ├── UseCase/
│   │   ├── Protocol/
│   │   │   └── UseCase.swift
│   │   └── FooUseCase.swift
│   └── *
├── Data/
│   ├── Repository/
│   │   ├── ApiRepositoryImpl.swift
│   │   └── *
│   ├── Constants/
│   │   ├── RepositoryConstants.swift
│   │   └── *
│   └── *
├── Products/
│   └── *
└── FrameWorks/
    └── *

```
