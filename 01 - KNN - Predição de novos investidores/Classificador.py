class KNN():
    
    def __init__(self, no_class, data, k):
        self.no_class = no_class
        self.data = data
        self.k = k
    
    def distancia_investimentos(self, carteira_no_class, carteira_data):
    
        distancia = 0 # criamos está variável para calcular a distancia euclidiana.
        for investimento_no_class, investimento_data in zip(carteira_no_class, carteira_data):

            distancia += (investimento_no_class - investimento_data) ** 2

        # No for acima criamos duas variáveis para percorrer juntas as listas, e usamos as 2 atríbuições da função investimento
        # para isso
        # Criamos o calculo de distancia dentro do for para que

        distancia = distancia ** 0.5
        return distancia
    
    # Para cada elemento de no_class, quero comparar e encontrar a distancia para TODOS os elementos de data

    def classificando_no_class(self):

        distancias_no_class = []

        lista_ordem = []


        for elemento_no_class in self.no_class:
            distancias = []

            for elemento_data in self.data:
                carteira_nc = elemento_no_class[2]
                carteira_d = elemento_data[2]
                distancias.append((self.distancia_investimentos(carteira_nc, carteira_d), elemento_data[1]))
            distancias_no_class.append(distancias)


        for elemento_distancias_no_class in distancias_no_class:
            lista_prototipo = []
            elemento_distancias_no_class.sort()


            for item_elemento in elemento_distancias_no_class:
                lista_prototipo.append(item_elemento)
            lista_ordem.append(lista_prototipo)


        conservador = 0
        moderado = 0
        agressivo = 0


        lista_novos_perfis = []

        for linha in lista_ordem:
            
            for perfil in range(len(linha)):
                if perfil == self.k:
                    break

                if linha[perfil][1] == 'Conservador':
                    conservador += 1
                if linha[perfil][1] == 'Moderado':
                    moderado += 1
                if linha[perfil][1] == 'Agressivo':
                    agressivo += 1

            if conservador > moderado and conservador > agressivo:
                lista_novos_perfis.append('Conservador')
            if moderado > agressivo and moderado > conservador:
                lista_novos_perfis.append('Moderado')
            if agressivo > moderado and agressivo > conservador:
                lista_novos_perfis.append('Agressivo')

            conservador = 0
            moderado = 0
            agressivo = 0

        dicionario_novos_clientes = {}

        for item, item1 in zip(self.no_class, lista_novos_perfis):


            dicionario_novos_clientes[item[0]] = item1


        return dicionario_novos_clientes
