PY ?= python3
CARGO ?= cargo

.PHONY: test lint rust-test all

all: lint test

lint:
	$(PY) -m ruff check src/ tests/
	$(CARGO) fmt --manifest-path watcher-rs/Cargo.toml --check
	$(CARGO) clippy --manifest-path watcher-rs/Cargo.toml -- -D warnings

test:
	$(PY) -m pytest tests/ -q

rust-test:
	$(CARGO) test --manifest-path watcher-rs/Cargo.toml
