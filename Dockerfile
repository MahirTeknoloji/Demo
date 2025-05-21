# Build aşaması: Maven ile uygulamayı derlemek için
FROM maven:3.9-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Çalıştırma aşaması: Sadece JRE ile final imajı oluşturma
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Build aşamasından JAR dosyasını kopyala
COPY --from=build /app/target/*.jar app.jar

# Uygulama portunu aç
EXPOSE 8080

# Uygulamayı çalıştır
ENTRYPOINT ["java", "-jar", "app.jar"]