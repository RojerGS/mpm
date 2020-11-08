publish:
	jb build .
	ghp-import -npf _build/html -m "Update online book."