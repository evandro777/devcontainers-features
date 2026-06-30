# AGENTS for this repository

## Project context
This repository contains a collection of Dev Container Features. Each feature lives in its own folder under [src](src), with a feature definition in [src/<feature>/devcontainer-feature.json](src) and an install entrypoint in [src/<feature>/install.sh](src).

## What to change
- Keep edits scoped to one feature unless the change is clearly repository-wide.
- For feature work, update the relevant files in [src](src) rather than introducing a new structure.
- Preserve the existing Dev Container Feature contract: options must be declared in the feature JSON and are exposed to the install script as environment variables.

## Alpine/OpenJDK-specific guidance
- The [src/alpine-openjdk](src/alpine-openjdk) feature is the current Alpine-based Java feature.
- Its install logic should remain POSIX-shell friendly and use Alpine package management via `apk` when adding packages.
- The feature currently expects an option such as `VERSION` and may need to create profile scripts or update environment variables for Java discovery.

## Conventions to follow
- Prefer small, focused edits that match the existing layout in [README.md](README.md) and the feature-specific docs under [src](src).
- Reuse the existing examples in [src/alpine-openjdk/README.md](src/alpine-openjdk/README.md) and [src/hello/README.md](src/hello/README.md) rather than inventing new patterns.
- Keep feature metadata consistent with the repo’s convention: `name`, `id`, `version`, `description`, `options`, and `installsAfter`.

## Validation
- Check shell syntax with `sh -n src/<feature>/install.sh`.
- Check JSON syntax with `python -m json.tool src/<feature>/devcontainer-feature.json > /dev/null`.
- If adding a new feature, keep the folder structure consistent with the existing examples under [src](src).
