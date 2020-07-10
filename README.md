# Gitbook Dokcer Image

![build status](https://github.com/leizhilong/gitbook/workflows/Docker/badge.svg)

- Reserved legacy gitbook image for future in case that it might not be available one day.

- Fixed issue https://github.com/GitbookIO/gitbook-cli/issues/55 on latest version 3.2.3

- See typical usage in the `Makefile` bellow:

    ```Makefile
    BOOK_TITLE?="my-awsome-book"
    GITBOOK_CMD=docker run -v `pwd`:/srv/gitbook --rm leizhilong/gitbook gitbook -d

    pdf:
        $(GITBOOK_CMD) pdf . _book/$(BOOK_TITLE).pdf

    epub:
        $(GITBOOK_CMD) epub . _book/$(BOOK_TITLE).epub

    site:
        $(GITBOOK_CMD) build

    clean:
        rm -rf _book && mkdir -p _book
        $(GITBOOK_CMD) ls
        $(GITBOOK_CMD) current

    all: clean site pdf epub

    .PHONY: clean pdf epub site all
    ```