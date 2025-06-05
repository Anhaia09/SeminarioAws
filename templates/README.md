## Problema no Grafana

Ao tentar subir a aplicação por meio de TaskDefinition, o Grafana redirecionava ao tentar entrar na tela de dashboard. O problema era na configuração incorreta do GF_SERVER_ROOT_URL - quando o Grafana não sabe qual é sua URL pública real, ele não consegue gerar os redirecionamentos corretamente, causando aqueles erros de redirect loop.

Agora com o !Sub "http://${ALB.DNSName}" ele consegue pegar o DNS real do ALB e configurar tudo certinho.

    