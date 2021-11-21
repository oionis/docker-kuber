In this work, will create a simple service with a html page, its docker image, as well as configured kubernetes. 

The first thing to do is to build the application and push it to Docker Hub. To do this, run the bash script inside the "info-service" folder. The project will be built, and using the Palantir dependency, the image will be sent to the repository. 

Then, run the bash script from the "Kuber" folder. This script will execute the deployment of the entire application. Namely the database and the service. With all the necessary checks and timeouts.

What would clean up after himself, run the script again.