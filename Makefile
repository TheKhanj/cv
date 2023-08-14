all: index.html

index.html: README.md index.template.html
	markdown -S "$<" > "$@"
	./scripts/create_html.sh "$<" "$@" index.template.html

serve: index.html
	python3 -m http.server 8080

serve_watch:
	printf "README.md\nindex.template.html" | entr -r make serve

clean:
	rm -f index.html
