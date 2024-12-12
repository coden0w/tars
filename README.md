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
│   │   ├── TARSApp
│   │   ├── AppDelegate
│   │   ├── DependencyInjector
│   │   ├── Base/
│   │   │   ├── Coordinator
│   │   │   ├── Errors
│   │   │   ├── LifeCycle
│   │   │   ├── Navigable
│   │   │   ├── ViewModel
│   │   │   └── Loadable/
│   │   │       ├── Loading
│   │   │       └── LoadingDelegate
│   │   ├── Configuration/
│   │   │   └── *
│   │   └── Managers/
│   │       └── *
│   └── Presentation/
├── Domain/
│   └── *
├── Data/
│   └── *
├── Products/
│   └── *
└── FrameWorks/
    └── *

```