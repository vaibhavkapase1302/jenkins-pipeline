# FROM python:3.9-buster AS build
# WORKDIR /app
# COPY . .  
# RUN pip3 install --no-cache-dir -r requirements.txt

# # Stage 2 
# FROM build AS final
# WORKDIR /app/
# COPY --from=build /app/ .
# CMD ["flask", "run"]



# Stage 1: Base
FROM python:3.9-slim-buster AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Build
FROM base AS build
COPY . .

# Stage 3: Final
FROM python:3.9-slim-buster AS final
WORKDIR /app
COPY --from=build /app /app
CMD ["flask", "run"]





1. How to create jobs in Jenkins

2. Groovy script to run application

3. Pipeline project: 
Plugins for Docker
Stages in  Pipeline
Checkout - clone - image build - image push - applicatiion deploy