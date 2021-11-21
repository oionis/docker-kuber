In this work, a simple service with an html page, its docker image, and Kubernetes have been created and configured. 

The first thing was to build the application and send it to the Docker Hub. To do this, a bash script was run in the "info-service" folder. The project was built and using the Palantir dependency, the image was sent to the repository. 

What would raise the Kubernetes:
Run a bash script from the "Kuber" folder, and follow the directions of this script. This script will perform a deployment of the entire application. Specifically the database and services. With all the necessary checks and timeouts.

To clean up after yourself, run the script again.