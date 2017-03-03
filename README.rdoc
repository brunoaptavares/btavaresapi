BTAVARESAPI
Esta aplicação foi desenvolvida para listar em formato JSON os tweets do Twitter com menção ao usuário da Locaweb conforme usuários mais relevantes e também os tweets mais retweetados. Os dados são ordenados de forma decrescente pelos seguintes dados:

•	Número de seguidores;
•	Número de retweets;
•	Número de likes.

A aplicação foi escrita em Ruby e está no diretório "app" com os testes automatizados no diretório "spec". Foi utilizado o framework rails e rspec-rails para os testes automatizados.

Execução

Para instalá-la, entre em "app" e execute "bundle install" para instalar as dependências.

Esta aplicação deve responder em quatro URL's:

/most_relevants - Exibe uma página HTML com os dados dos tweets mais relevantes de forma amigável ao usuário.
/most_relevants.json - Retorna um JSON com os dados dos tweets mais relevantes.
/most_mentions - Exibe uma página HTML com os dados dos tweets com mais menções de forma amigável ao usuário.
/most_mentions.json - Retorna um JSON com os dados dos tweets com mais menções.

Testes Automatizados

Para executar os testes automatizados, executar os seguintes comandos no terminal no diretório de origem do workspace:

rspec spec/controllers/api_controller_spec.rb
rspec spec/controllers/most_mentions_controller_spec.rb
rspec spec/controllers/most_relevants_controller_spec.rb
rspec spec/models/tweet_spec.rb
rspec spec/models/user_twitter_spec.rb

Estrutura da aplicação

Pacote /app/controllers
api_controller.rb – Classe responsável por realizar a comunicação com a API http://tweeps.locaweb.com.br/tweeps e realizar as operações de filtro, ordenação e agrupamento dos dados.

most_mentions_controller.rb – Classe responsável por pegar os dados e disponibilizar a visão HTML e JSON dos dados referente aos tweets com mais menções.

most_relevants_controller.rb – Classe responsável por pegar os dados e disponibilizar a visão HTML e JSON dos dados referente aos tweets dos usuários mais relevantes.

Pacote /app/models
tweet.rb – Classe que representa um tweet.

user_twitter.rb – Classe que representa um usuário do Twitter.

Pacote /app/views/most_mentions
index.html.erb – Arquivo contendo a implementação da exibição HTML dos dados dos tweets com mais menções.

Pacote /app/views/most_relevants
index.html.erb – Arquivo contendo a implementação da exibição HTML dos dados dos usuários mais relevantes.

Pacote /spec/ - Contem os arquivos com os testes automatizados de cada uma das classes criadas no projeto.


