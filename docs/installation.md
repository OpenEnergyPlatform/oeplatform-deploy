## Requirements
 * git
 * Python >= 3.5
 
## Docker Setup

### For Windows

1. [Install docker desktop](https://docs.docker.com/docker-for-windows/install/)
2. Open the Windows PowerShell
3. Run `docker pull ghcr.io/openenergyplatform/oeplatform-postgres:latest` to pull the latest docker image
4. Run `docker run -p "<port>:5432" ghcr.io/openenergyplatform/oeplatform-postgres:latest`
   run a postgres database with all necessary databases on port `<port>`

### For Ubuntu

1. [Install docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
2. Run `docker pull ghcr.io/openenergyplatform/oeplatform-postgres:latest` to pull the latest docker image
3. Run `docker run -p "<port>:5432" ghcr.io/openenergyplatform/oeplatform-postgres:latest`
   run a postgres database with all necessary databases on port `<port>`


## Connect your oep to docker 

1. Clone the [OEP source code](https://github.com/OpenEnergyPlatform/oeplatform)
  - We recommend the use of a [virtual python environment](https://docs.python.org/3/tutorial/venv.html) to avoid conflicts
2. Run `pip install -r requirements.txt` to install all requirements
2. Copy the file `oeplatform/securitysettings.py.default` to `oeplatform/securitysettings.py`. 
3. Run `python manage.py migrate` to setup the required tables used by django
4. Run `python manage.py runserver` to start the platform on port 8000
5. Your instance of the OEP is now available at localhost:8000