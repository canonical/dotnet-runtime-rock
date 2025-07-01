.PHONY: sync-with-template

sync-with-template:
	@if ! git diff-index --quiet HEAD --; then \
		echo "ERROR: You have uncommitted changes. Please commit or stash them before syncing."; \
		exit 1; \
	fi
	@git remote get-url template >/dev/null 2>&1 || git remote add template https://github.com/canonical/rocks-template.git
	@git fetch template
	@git merge -X ours --allow-unrelated-histories --no-commit template/main
	@echo "Please review the results and commit the changes manually."
