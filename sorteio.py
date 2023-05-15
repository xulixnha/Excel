import random


def sorteio(criar_grupos):
    nomes = ["Julia", "Joao", "Luis", "Luisa", "Pedro", "Flavio", "Bianca", "Bia", "Eduarda", "Giovana", "Allana",
             "Nathan", "David", "Millena", "Vitor", "Roberta"]
    random.shuffle(nomes)
    grupos = [ []for g in range(criar_grupos)]
    indice_nome = 0

    for n in range(16):
        grupo = n % criar_grupos
        grupos[grupo].append(nomes[indice_nome])
        indice_nome += 1
    return grupos


def main():
    g = input("Quantos grupos você deseja (2, 4 ou 8)? ")

    if g not in ["2", "4", "8"]:
        print("Opção inválida. Por favor, escolha 2, 4 ou 8.")
        g = input("Quantos grupos você deseja (2, 4 ou 8)? ")

    g = int(g)
    grupos = sorteio(g)

    for i, grupo in enumerate(grupos):
        print(f"Grupo {i + 1}: {grupo}")


if __name__ == '__main__':
    main()











