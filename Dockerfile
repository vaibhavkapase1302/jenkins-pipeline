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
