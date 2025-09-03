FROM openjdk:21-jdk-slim

# Install Maven AND netcat-openbsd
RUN apt-get update && apt-get install -y maven netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy pom.xml first for dependency caching
COPY pom.xml .

# Download dependencies (this layer will be cached)
RUN mvn dependency:resolve

# Copy source code
# COPY src ./src

# Copy wait-for-it.sh from the current context (./backend)
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Expose port
EXPOSE 8080

CMD ["/wait-for-it.sh", "db-ws-solutions", "1433", "--", "mvn", "spring-boot:run"]