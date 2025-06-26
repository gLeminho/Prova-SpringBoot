# --- ESTÁGIO 1: Construção (Build) ---
# Usamos uma imagem base que já vem com Maven e Java JDK (versão 21, como no seu projeto)
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de configuração do Maven primeiro para aproveitar o cache do Docker
COPY pom.xml .

# Copia todo o resto do código-fonte do seu projeto
COPY src ./src

# Executa o comando do Maven para compilar o projeto e empacotá-lo em um arquivo .jar
# -DskipTests pula a execução dos testes para acelerar o build
RUN mvn clean package -DskipTests


# --- ESTÁGIO 2: Execução (Run) ---
# Usamos uma imagem base muito menor, que só tem o Java para rodar (JRE), nada de Maven ou JDK
FROM eclipse-temurin:21-jre-jammy

# Define o diretório de trabalho
WORKDIR /app

# Copia APENAS o arquivo .jar que foi gerado no Estágio 1 (o "build") para a nossa imagem final
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta 8080, informando que nossa aplicação roda nela
EXPOSE 8080

# Comando final que será executado quando o contêiner iniciar
ENTRYPOINT ["java", "-jar", "app.jar"]