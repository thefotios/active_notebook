# ActiveNotebook

## Usage

1. Add to your `Gemfile` and install

    ```shell
    > cat <<EOM >> Gemfile
    gem 'active_notebook', github: 'thefotios/active_notebook', branch: 'main'
    EOM

    > bundle install
    > bundle binstubs active_notebook
    ```

1. Add `jupyter` (if you don't already have it installed)

    ```shell
    > pipenv --python 3.8 install jupyterlab
    ```

1. Run it

    ```shell
    > pipenv run bin/active_notebook
    ```

If you have `jupyter lab` installed some other way, you can omit the `pipenv` commands.

## Development

1. Clone the repo somewhere (eg, `~/src/active_notebook`)
1. Link into a project

    ```shell
    > bundle config local.active_notebook ~/src/active_notebook
    > bundle install
    ```
