all: index.html

index.html: README.md index.template.html
	markdown -S "$<" > "$@"
	sh ./scripts/create_html.sh "$<" "$@" index.template.html

serve: index.html
	caddy file-server --root . -l :8000 -b

serve_watch:
	printf "README.md\nindex.template.html" | entr -r make serve

clean:
	rm -f index.html
