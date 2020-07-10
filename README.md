# Gitbook Dokcer Image

![build status](https://github.com/leizhilong/gitbook/workflows/docker-publish/badge.svg)

Reserved legacy gitbook image in case that it might not be available someday in the future.

- Runs as **Docker container** so you don't have to mess with node environment and gitbook versions.

- Super easy to install with docker, type `docker pull leizhilong/gitbook` and you're good to go.

- Fixed plugin-copy-confirm issue https://github.com/GitbookIO/gitbook-cli/issues/55 of the **newest version 3.2.3**.

- With support for **pdf** and **epub** generation and you never have to worry about **dependencies** anymore.

- See **typical usages** in the `Makefile` bellow:

    ```Makefile
    BOOK_TITLE?="my-awsome-book"
    GITBOOK_CMD=docker run -v `pwd`:/srv/gitbook --rm leizhilong/gitbook gitbook

    pdf:
        $(GITBOOK_CMD) pdf . _book/$(BOOK_TITLE).pdf

    epub:
        $(GITBOOK_CMD) epub . _book/$(BOOK_TITLE).epub

    site:
        $(GITBOOK_CMD) build

    serve:
        # use --init to enable ctrl-c response override, use -p to expose service.
        docker run -v `pwd`:/srv/gitbook -p 4000:4000 --rm --init leizhilong/gitbook gitbook serve

    clean:
        rm -rf _book && mkdir -p _book
        $(GITBOOK_CMD) ls
        $(GITBOOK_CMD) current

    all: clean site pdf epub

    .PHONY: clean pdf epub site all serve
    ```

- **[mdbook](https://github.com/rust-lang/mdBook)** by rust community is a **great alternative** to gitbook, but **pdf or epub generation remains unsupported** now.