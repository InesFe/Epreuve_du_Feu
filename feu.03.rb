#Sudoku

#Parsing
sudoku = ARGV[0]

#Fonctions
def convertir_sudoku_en_matrice(fichier)

fichier_mat = []

fichier_ouvert = File.open(fichier) #ouvrir le fichier

fichier_lu = fichier_ouvert.read #lire le fichier

	for i in 0..fichier_lu.length - 1 do #remplacer les . par des 0

		if fichier_lu[i] == "."
			
			fichier_lu[i] = fichier_lu[i].gsub(".", "0")

		end

	end
	
	for i in 0..fichier_lu.length - 1  do #faire les lignes de 9 chiffres

		if i % 9 == 0
			
			fichier_mat << (fichier_lu[i...i + 9].split("")).map(&:to_i) #convertir les string en int
		end
	end
	
	return fichier_mat
end

def trouver_les_cases_vides(tab) #trouver les index des cases vides

cases_vides = []

	for ligne in 0...tab.length

		for colonne in 0...tab[ligne].length

			if tab[ligne][colonne] == 0

				cases_vides << [ligne, colonne]
			end
		end
	end

	return cases_vides
end

#Appel des fonctions
tableau = convertir_sudoku_en_matrice(sudoku)
print tableau
p trouver_les_cases_vides(tableau)


