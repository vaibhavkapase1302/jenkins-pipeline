# Cloud-Native-Monitoring-Application

<!--<img src="https://github.com/vaibhavkapase1302/Cloud-Native-Monitoring-Application/blob/main/Project%20Architecture.jpg" width="1000" height="400" alt="Example Image">-->

<img src="https://github.com/vaibhavkapase1302/Cloud-Native-Monitoring-Application/blob/main/App%20Monitoring%20System%20Project%20Architecture%20Diag..png" width="1000" height="400" alt="Example Image">


<!--<img src="https://github.com/vaibhavkapase1302/Cloud-Native-Monitoring-Application/blob/main/GitOps%20Architecture.jpg" width="800" height="300" alt="Example Image">-->


This project guides you through the process of creating a cloud-native monitoring application using Python, Flask, Docker, and Kubernetes. The goal of this project is to build a robust monitoring solution that can track and manage various metrics within a cloud environment.

Through a series of structured phases, you'll learn how to develop the application, containerize it using Docker, and deploy it on an Elastic Kubernetes Cluster (EKS) on AWS. By following these steps, you'll gain valuable insights into creating, packaging, and orchestrating a modern cloud-native application.

Whether you're new to cloud-native development or looking to enhance your skills, this project provides hands-on experience with key concepts and tools, allowing you to monitor and manage your applications effectively in a cloud environment.


## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)


## Features

List the key features and functionalities of your project.

## Installation


# Cloud-Native Monitoring Application with Flask, Docker, and Kubernetes

Throughout this project, we will learn how to create a monitoring application in Python using Flask. We will start by building the application and containerize it using Docker. Once we have our app containerized and running locally, we will then create an Elastic Container Registry (ECR) in AWS using the Python `boto3` module. We will push the Docker image of our app to ECR to store, retrieve, or use the docker image. Next, we will move to the deployment phase where we will create an Elastic Kubernetes Cluster on Elastic Kubernetes Service (EKS) with nodes and deploy the application on Kubernetes. This project is divided into three phases.

## Phases

### Phase 1: Building the App

In this phase, we will focus on building the monitoring application using Python and Flask. We'll cover the following steps:

1. Set up prerequisites, including Python and Flask installation.
2. Create the Flask application and define its endpoints.
3. Implement monitoring functionality using relevant libraries (e.g., `psutil`).
4. Test the Flask app locally to ensure it's functioning correctly.

### Phase 2: Containerizing the App

In this phase, we will containerize the Flask application using Docker. We'll cover the following steps:

1. Install Docker and Docker Compose on your local machine.
2. Write a Dockerfile to define the app's containerization process.
3. Build the Docker image of the monitoring app.
4. Run the Docker container locally to verify its behavior.

### Phase 3: Deploying the App on Kubernetes

In this final phase, we will deploy the Dockerized monitoring application to a Kubernetes cluster on AWS EKS. We'll cover the following steps:

1. Create an Elastic Kubernetes Cluster (EKS) on AWS.
2. Set up nodes within the EKS cluster to ensure scalability.
3. Use `boto3` to interact with AWS services and create an Elastic Container Registry (ECR).
4. Push the Docker image of our app to ECR for storage and retrieval.
5. Deploy the Flask application on the EKS cluster using Kubernetes manifests.
6. Monitor the application's behavior on the Kubernetes cluster.

## Prerequisites

Before you start this project, make sure you have the following:

- An AWS account with programmatic access and AWS CLI configured.
- Python 3 installed on your machine.
- Docker and Docker Compose installed.
- A code editor (e.g., VS Code) for writing and editing code.


## Phase 1- Build the app:

## Run Application on Local Machine:
1. Run the application
```py
python3 app.py
```

2. Install Dependencies: python3, flask, psutil
```py
install python3
```

3. Check Version:
```py
python -V
```

4. Install utilities:
```py
pip --version
```

```py
pip install flask
```

```py
pip install psutil
```

5. Testing the App Locally
- Run the App: In the terminal, run your Flask app:
```py
python3 app.py
```

- Open Browser: Open a web browser and navigate to http://localhost:5000 to see your running Flask app.
```http
http://localhost:5000
```


<img src="https://github.com/vaibhavkapase1302/Cloud-Native-Monitoring-Application/blob/main/System%20Monitoring%20img.png" width="1000" height="400" alt="Example Image">

## Conclusion

The code is running on my local machine.
We can’t run a server 24/7, so we shift to the cloud.


## Cloud Migration
We are using the Lift and Shift migration strategy.

### Launching EC2 Instance on AWS: 
 Create AWS EC2 Instance on AWS

### Clone the entire project using Git:
```c
git clone git@github.com:vaibhavkapase1302/Cloud-Native-Monitoring-Application.git
```

Go to 
```c
cd Cloud-Native-Monitoring-Application
```

### Installation:

1. Update the package list:
```c
sudo apt update
```

2. Upgrade the package list:
```c
sudo apt upgrade 
```

3. Install Python and python3-pip:
```c
sudo apt install python3 python3-pip
```

4. Verify the installation:
```c
pip3 --version
```

5. Create a new virtual environment for Python dependencies:
```bash
sudo apt install virtualenv
```

6. Activate the virtual environment:
```bash
source env/bin/activate
```

7. Install Flask:
```bash
pip install flask
```

8. Install psutil module:
```bash
pip install psutil
```

9. In your ```app.py``` file, specify the port number (e.g., 5000):
```bash
port = 5000
```

10. To avoid displaying Flask app logs on the terminal, use nohup to store logs in ```nohup.out```:
```bash 
nohup python3 app.py
```



Now, our cloud-native web monitoring application can run on our local machine’s localhost and remote server.

## Phase 2- Containerize the app:

Write a Dockerfile:

```.dockerfile
# Use the official Python 3.12.0b4 image as the base image
FROM python:3.12.0b4-slim-bullseye

# Set the working directory within the container to /app
WORKDIR /app

# Copy the entire current directory into the container's /app directory
COPY . .

# Install the dependencies from requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Set an environment variable to specify the host when running the Flask app
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 from the container to the host
EXPOSE 5000

# Specify the command to run when the container starts
CMD ["flask", "run"]
```

Install Docker on Linux Ubuntu:
- a. Add the Docker repository:
```c
sudo apt-get install -y \
   apt-transport-https \
   ca-certificates \
   curl \
   software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

- b. Install Docker:
```c
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
```


1. Create a Docker Image
```c
docker build -t my-flask-app <image name> .
```

2. Check Docker images
```c
docker images
```

```c
docker run -p 5000:5000 eeccc15c8a3b <image id>
```



## Phase 3- Deploy the App on Kubernetes

## Phase 4- 

## License

This project is licensed under the [MIT License](LICENSE).
