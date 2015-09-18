.PHONY: test test-csbrancid test-csblogin

test: test-csbrancid test-csblogin

test-csbrancid: src/csbrancid
	perl -c $<

test-csblogin: src/csblogin
	perl -c $<
