.PHONY: test
test: test-heroku-24

test-heroku-24:
	@echo "Running tests in docker (heroku-24)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it -e "STACK=heroku-24" heroku/heroku:24 bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; tests/run;'
	@echo ""

shell:
	@echo "Opening heroku-24 shell..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it heroku/heroku:24 bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; bash'
	@echo ""
