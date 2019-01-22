# oeplatform-deploy

## Usage

In this folder:
`docker build -t oep_postgres .`
`docker run -p "5432:5432" oep_postgres`

In your project folder:
`python manage.py migrate`

## What does this?

This Dockerfile creates a container which is prepared for use with open_eGo. This means that all required dependencies for the database and the database schema are already included and the container is ready to use at the first start.

Only the migration of Django has to be executed before you can get started. If the migration has not yet been executed, Django also warns you.

```
You have 93 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, authtoken, axes, contenttypes, dataedit, login, modelview, sessions.
Run 'python manage.py migrate' to apply them.
```

## How does I tell Django to use this container?

All relevant settings are stored in `/oeplatform/securitysettings.py`, which is normally created by using the `securitysettings.py.default`. We included a `securitysettings.py` in this repository, which can be used for development purposes. You can copy this to your project to `/oeplatform/securitysettings.py`. If you use this container in production, you might need to change this.


## Which are the credentials for this container?

+ `POSTGRES_USER=postgres`
+ `POSTGRES_PASSWORD=postgres`

We created two databases:

+ django
	+ Contains the django tables, which are introduced by the migration.
+ dataedit
	+ Contains the custom tables, which are introduced by the `*.dump` files.


## How does this work?

1. We inherit from the Postgres container in version 9.6.
2. In addition we install the packages `postgresql-contrib-9.6 postgresql-9.6-postgis-2.3 postgresql-plpython3-9.6 postgresql-plpython-9.6 `.
3. We copy all files ending with `*.dump` to `/`.
4. We copy the init script to a place where Postgres finds it and executes it after starting the database. So all data in *.dump files will be executed.
5. The database is ready to use.