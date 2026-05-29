RELATÓRIO DE APRESENTAÇÃO : STEAMJAVA

Este relatório apresenta o modelo de negócio da SteamJava, uma plataforma criada para centralizar a venda, o download e o gerenciamento de jogos digitais. O objetivo do projeto é resolver um problema comum hoje em dia: a divisão dos jogos em vários aplicativos diferentes, unificando a experiência do jogador em um só lugar. 


A SteamJava opera no setor de tecnologia e entretenimento. Mais do que uma simples loja virtual, a plataforma funciona como um sistema completo onde o usuário compra seus jogos, organiza sua biblioteca e joga com segurança, sem complicações técnicas. 



O crescimento da SteamJava baseiam-se em três pilares operacionais que direcionam o desenvolvimento técnico e as decisões comerciais da plataforma: 

Foco em desenvolvimento: Desenvolver um aplicativo rápido, seguro, que não trave e que garanta downloads velozes.

Preço e Acesso Justos: Facilitar a compra de jogos adaptando os preços à realidade de cada país e aceitando meios de pagamentos locais. 

Parceria Real: Oferecer um ambiente vantajoso tanto para que joga quanto para os criadores de jogos(desde estúdios independentes até grandes empresas).



A SteamJava entrega as seguintes ferramentas essenciais para os usuários: 

Loja e Downloads: Sistema seguro para comprar jogos e baixar arquivos de forma otimizada em segundo plano.

Organização de biblioteca: Salvamento automático do progresso do jogo na nuvem(cloud save) e organização personalizada dos títulos. 

Recomendações Inteligentes: Sugestões de jogos baseadas no gosto real do usuário, evitando anúncios chatos e irrelevantes. 

Suporte Práticos: Atendimento direto para resolver problemas técnicos e sistema de reembolso simplificado. 



O foco da empresa está dividido em duas frentes: 

Jogadores: Pessoas de todos os perfis(casuais ou competitivos), com foco especial mais baixas do que as cobradas pelas lojas atuais e ferramentas mais simples para publicar seus jogos. 

Desenvolvedores: Estúdios de games que procuram taxas de comissão mais baixas do que as cobradas pelas lojas atuais e ferramentas mais simples para publicar seus jogos. 

Para garantir a segurança, velocidade e organização dos dados da SteamJava, o sistema foi modelado seguindo uma estrutura relacional que interliga as seguintes entidades centrais:

Gestão de Usuários (Cliente e Administrador): O sistema separa as contas de usuários comuns dos perfis administrativos. O Administrador gerencia o catálogo de Jogos e cria campanhas na tabela de Promoção.

Fluxo de Vendas (Pedido, Item_pedido e Pagamento): Quando um Cliente faz uma compra, um Pedido é gerado com os valores totais. Como um cliente pode comprar vários jogos de uma vez, a tabela Item_pedido detalha a quantidade e quais Jogos específicos estão naquele carrinho.
Cada pedido gera um registro de Pagamento que acompanha o método utilizado e o status da transação.

Pós-Venda e Interação (Download e Avaliação): Após a confirmação do pagamento, o sistema libera o registro na tabela de Download, vinculando o Cliente ao Jogo adquirido com a data da descarga. O usuário também ganha a permissão de criar uma Avaliação, registrando sua nota e comentário sobre o título.



O sistema foi projetado para guiar o usuário de forma intuitiva através de quatro etapas principais, mapeadas no fluxo operacional da plataforma:

Etapa 1: Descoberta e Filtro: Ao acessar a Página Inicial, o usuário visualiza destaques, promoções e novos lançamentos. Ele possui total autonomia para buscar jogos usando filtros de pesquisa ou navegando por categorias específicas (Ação, Aventura, RPG, Esportes, Estratégia), além de acessar seções exclusivas de Pré-Vendas, Promoções ou gerenciar a sua Conta.

Etapa 2: Decisão de Compra: Ao selecionar um título, a plataforma exibe a Página do Jogo com detalhes técnicos, imagens, vídeos, requisitos de sistema e avaliações. O usuário decide se deseja adicionar o item ao carrinho de compras ou continuar navegando pela loja.

Etapa 3: Checkout e Identificação: Ao optar por finalizar a compra dentro do Carrinho de Compras, o sistema exige a identificação do usuário (login ou cadastro rápido). Em seguida, ele escolhe o método de pagamento ideal e avança para a revisão final do pedido.

Etapa 4: Entrega do Software: Uma vez confirmado o pagamento com sucesso, o pedido é processado e o sistema realiza a entrega do jogo. O título é vinculado de forma permanente à biblioteca do usuário, e o download é liberado imediatamente para início da jogabilidade.



A SteamJava nasce como uma alternativa prática e economicamente viável no mercado de games. Ao resolver problemas antigos que irritam os jogadores como a burocracia para pagar, a fragmentação de bibliotecas e aplicativos pesados, a empresa constrói uma base sólida e estruturada para crescer de forma sustentável e realista.



FLUXOGRAMA:

<img width="561" height="842" alt="image" src="https://github.com/user-attachments/assets/3b64e60a-1fdd-4cf3-bcfd-e7934242f483" />

DER:
<img width="1098" height="648" alt="image" src="https://github.com/user-attachments/assets/1782ec85-bf12-4181-bf25-e4efe5aa542c" />
 🚀 Plano de Negócios: SteamJava
1. Introdução e Visão de Mercado
O projeto SteamJava surge com a proposta de se consolidar como uma das principais forças do mercado global de games. A indústria de jogos eletrônicos movimenta bilhões de dólares anualmente e possui um público extremamente diversificado, abrangendo diferentes faixas etárias e perfis de consumidores.
Diante desse cenário, a SteamJava adota uma estratégia baseada em expansão agressiva, alta escalabilidade e acessibilidade global, visando conquistar uma posição dominante no setor de distribuição digital de jogos.
2. Objetivo Principal e Diferencial Competitivo
O principal objetivo da SteamJava é liderar o mercado por meio de inovação e foco total na experiência do usuário.

2.1 Meta de Liderança
A empresa busca se consolidar como a maior plataforma de distribuição de jogos do mundo, centralizando o comércio de entretenimento digital em um único ecossistema.

2.2 Experiência do Usuário
A SteamJava terá como prioridade oferecer uma experiência fluida, intuitiva e acessível, reduzindo barreiras e facilitando o acesso aos jogos.
3. Estratégia Multiplataforma
Um dos principais diferenciais da SteamJava é sua presença em múltiplas plataformas, permitindo alcance global e maior conveniência para os usuários.
A plataforma estará disponível em:

Computadores (PC)
Consoles (PlayStation, Xbox, Nintendo)
Dispositivos móveis (Android e iOS)
Essa abordagem garante que os usuários possam acessar seus jogos em qualquer lugar e dispositivo.
4. Estratégia de Pagamento e Acessibilidade
Para maximizar o alcance global, a SteamJava adotará uma estratégia focada na eliminação de barreiras financeiras, oferecendo suporte a diversas formas de pagamento.

4.1 Métodos Tradicionais
Cartões de crédito internacionais
Boletos bancários
Transferências bancárias
4.2 Pagamentos Instantâneos
Pix
Carteiras digitais (PayPal, Mercado Pago, entre outras)
4.3 Tecnologias Futuras
A SteamJava também se prepara para integrar novas tecnologias financeiras que venham a surgir, garantindo constante atualização e competitividade.
5. Modelo de Crescimento
O crescimento da SteamJava será baseado em:

Expansão global contínua
Parcerias estratégicas com desenvolvedores
Ampliação constante do catálogo de jogos
Investimento em tecnologia e infraestrutura
6. Conclusão
O modelo de negócios da SteamJava apresenta uma visão clara de crescimento e domínio de mercado. Ao investir em acessibilidade, presença multiplataforma e diversidade de meios de pagamento, a empresa se posiciona não apenas como uma loja digital, mas como um ecossistema global de entretenimento.
Com essa abordagem, a SteamJava tem potencial para liderar a próxima geração do comércio de videogames, redefinindo a forma como jogadores acessam e consomem conteúdo digital.
