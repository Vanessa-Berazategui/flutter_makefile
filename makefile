.PHONY: clean
clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@fvm flutter clean

.PHONY: get
get: ## Get project dependencies
	@echo "╠ Get dependencies"
	@fvm flutter pub get

.PHONY: generate
generate: ## Generates autogenerated code
	@echo "╠ Generating code"
	@fvm flutter pub run build_runner build

.PHONY: regenerate
regenerate: ## Regenerates autogenerated code
	@echo "╠ Re-generating code"
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: generate-watch
generate-watch: ## Generates autogenerated code
	@echo "╠ Generating code"
	@fvm flutter pub run build_runner watch

.PHONY: format
format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format .

.PHONY: lint
lint: ## Lints the code
	@echo "╠ Verifying code..."
	@fvm flutter analyze . || (echo "Error in project"; exit 1)fvm 

.PHONY: fix
fix: ## Fixing the code
	@echo "╠ Fixing code..."
	dart fix --apply

.PHONY: icon
icon: ## Generates launcher icon
	@echo "╠ Making launcher icon"
	@fvm flutter pub run flutter_launcher_icons

.PHONY: splash
splash: ## Generates native splash
	@echo "╠ Making native splash"
	@fvm flutter pub run flutter_native_splash:create

.PHONY: build_apk
build_apk: ## Build Android mobile application form mode
	@echo "╠ Building Android mobile application for mode $(mode)"
	@fvm flutter build apk --$(mode) -t lib/main.dart --obfuscate --split-debug-info=./obfuscatation/debug

.PHONY: build_ipa
build_ipa:  ## Build iOS mobile application for mode
	@echo "╠ Building iOS mobile application for mode $(mode)"
	@fvm flutter build ipa --$(mode) -t lib/main.dart

.PHONY: build_web
build_web: ## Build web application for mode
	@echo "╠ Building web application for mode $(mode)"
	@fvm flutter build web --$(mode) -t lib/main.dart --web-renderer canvaskit --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_CANVASKIT_URL=canvaskit/

.PHONY: build_win
build_win: ## Build win application for mode
	@echo "╠ Building windows application for $(mode).."
	@fvm flutter build windows --$(mode) -t lib/main.dart 

.PHONY: build_macos
build_macos: ## Build macos application for mode
	@echo "╠ Building macos application for $(mode).."
	@fvm flutter build macos --$(mode) -t lib/main.dart 

.PHONY: run
run:
	@echo "╠ Running the application for device $(device)"
	@fvm flutter run -d $(device)

