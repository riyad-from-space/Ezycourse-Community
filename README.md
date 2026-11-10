# EzyCourse Community

A Flutter client for EzyCourse student communities: sign in, browse the communities you're enrolled in, read channel feeds, and post, react and comment with images and video.

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-00B4AB)
![GoRouter](https://img.shields.io/badge/GoRouter-02569B)
![Freezed](https://img.shields.io/badge/Freezed-3E7BFA)
![Clean Architecture](https://img.shields.io/badge/Clean%20Architecture-555555)

<!-- Screenshots: add 3–4 phone screenshots here, e.g. <img src="screenshots/feed.png" width="220"> -->

## Features

- **Email/password sign-in** against the EzyCourse API, with form validation and an optional "Remember me". The auth token is kept in secure storage, so a returning user skips the login screen.
- **Enrolled communities list** showing each community's cover, status, member count and post count, with infinite scroll (10 per page), pull-to-refresh, shimmer loading, and empty and error states.
- **Channels**: each community's channels are listed in a side drawer; the feed opens on the first channel and switches when you pick another.
- **Channel feed** of posts with author, relative timestamps ("5m ago"), expandable long text, and like, comment and share counts.
- **Media in posts**: a single image at full width or a 2×2 grid with a "+N" overlay, a full-screen viewer with swipe and pinch-to-zoom, and an inline video player with play/pause and a seek bar.
- **Reactions**: six reaction types (Like, Love, Haha, Wow, Sad, Angry) from a bottom sheet. The UI updates immediately and the request is sent in the background.
- **Comments**: a bottom sheet that loads a post's comments and lets you add a new one.
- **Create post**: write text and attach images or videos, then the channel feed refreshes.
- **Media library picker**: browse your existing EzyCourse photo or video gallery, select several items at once, or upload a new file from the phone (via `image_picker`) and pick it straight away.
- **Profile** screen with name, avatar and user type, plus logout behind a confirmation dialog.

## Architecture

The code is organised by feature, and each feature has three Clean Architecture layers:

- **data**: remote datasources make HTTP calls through a shared `NetworkService`, and Freezed/JSON models parse the responses and map them to entities (`toEntity()`). Repository implementations build endpoint URLs and request bodies.
- **domain**: immutable Freezed entities, abstract repository interfaces, and one use case class per action (e.g. `GetCommunityFeedsUseCase`, `CreatePostReactUseCase`).
- **presentation**: screens and widgets, plus Riverpod `StateNotifier` view models that each hold a small immutable state object (loading, data, error).

State flows one way: **Widget → ViewModel (Riverpod) → UseCase → Repository → Datasource → `NetworkService` (http)**. Results come back as entities, and the view model updates its state for the widget to rebuild. GetIt (`lib/app/di/injection.dart`) registers the services, datasources, repositories and use cases as lazy singletons, and Riverpod providers pull use cases from it. GoRouter picks the start route (sign-in or communities) from whether a token is stored.

```text
lib/
├── main.dart                 # bootstraps DI, checks the stored token, starts the router
├── app/
│   ├── di/                   # GetIt service locator setup
│   └── router/               # GoRouter config and route paths
├── core/
│   ├── constants/            # API base URL and endpoint builders
│   ├── errors/               # AppException
│   ├── services/             # NetworkService (http) and TokenStorageService (secure storage)
│   ├── shared/               # pagination meta model/entity
│   ├── theme/                # colors, text styles, light theme
│   └── widgets/              # shared button, text field, shimmer
└── features/
    ├── auth/                 # login
    │   ├── data/             # datasource, model, repository impl
    │   ├── domain/           # entity, repository contract, LoginUseCase
    │   └── presentation/     # login screen, auth view model
    ├── community/            # communities, channels, feeds, posts, reactions, comments, gallery
    │   ├── data/
    │   ├── domain/
    │   └── presentation/     # screens, view models, widgets, utils
    └── user_profile/         # current user's profile
        ├── data/
        ├── domain/
        └── presentation/
```

## Tech stack

| Package | Used for |
| --- | --- |
| `flutter_riverpod` | State management (`StateNotifierProvider` view models) |
| `go_router` | Declarative routing, with the start route based on auth |
| `get_it` | Dependency injection (service locator) |
| `freezed` / `freezed_annotation` | Immutable models and entities with `copyWith` |
| `json_serializable` | JSON parsing for the models (generated `*.g.dart`) |
| `http` | REST calls (JSON GET/POST and multipart upload) |
| `flutter_secure_storage` | Storing the auth token and remembered login |
| `image_picker` | Picking photos and videos from the device to upload |
| `video_player` | Inline playback of video attachments |
| `build_runner` | Code generation for Freezed and JSON |

## Getting started

**Prerequisites:** Flutter (stable) with Dart SDK `^3.9.2`, i.e. Flutter 3.35 or newer, and an EzyCourse account on the target school to sign in with.

```bash
git clone https://github.com/riyad-from-space/Ezycourse-Community.git
cd Ezycourse-Community
flutter pub get

# Generated files (*.freezed.dart, *.g.dart) are git-ignored, so generate them first
dart run build_runner build --delete-conflicting-outputs

flutter run
```

**API configuration:** the backend base URL and every endpoint path are defined in `lib/core/constants/api.dart` (`ApiEndpoints.baseUrl`). No API keys are needed; users sign in with their own EzyCourse credentials.

## Author

Riyad Ahmed Sagor · [Portfolio](https://riyad-portfolio-f18db.web.app) · [LinkedIn](https://www.linkedin.com/in/riyadfromspace/)
