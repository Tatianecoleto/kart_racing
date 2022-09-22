# Kaart racing
A partir de um input de um arquivo csv( exemplo: [import_kart_racing.csv](https://drive.google.com/file/d/1Jo3M7t0juzwkgNb_r7S7YbWtjMrdWB0i/view?usp=sharing "import_kart_racing.csv") ), monta o resultado de uma corrida com as seguintes informações: Posição Chegada, Código Piloto, Nome Piloto, Qtde Voltas Completadas, Tempo Total de Prova, Tempo melhor Volta Piloto, Velocidade Média e Melhor volta da corrida.

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

Para instalar as gems, execute:
```bash
docker-compose run web bundle install
```

Para startar o projeto, execute:
```bash
docker-compose up
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
docker-compose run web bundle exec rspec -fdoc
```
