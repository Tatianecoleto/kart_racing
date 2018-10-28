# Kart racing

## Configurações necessárias:
É necessário a instalação de docker e docker-compose.

`Docker 18.06.1-ce`
`docker-compose 1.22.0`
## Como executar a aplicação

Clone este repositório:

```bash
git clone https://github.com/Tatianecoleto/kart_racing.git
```

Entre na pasta do projeto:
```bash
cd kart_racing
```

Para buildar o container, execute:
```bash
docker-compose build
```
Para startar o projeto, execute:
```bash
docker-compose up -d
```
Entre na url:
`http://localhost:3000`

## Logs
Para visualizar os logs execute o comando:
```bash
docker-compose logs -f
```
## Tests
Para rodar os testes execute o comando:
```bash
docker-compose run bundle exec rspec -fdoc
```