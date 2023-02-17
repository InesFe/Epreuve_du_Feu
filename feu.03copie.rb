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
	
	for i in 0...fichier_lu.length do #faire les lignes de 9 chiffres

		if i % 9 == 0
			
			fichier_mat << (fichier_lu[i...i + 9].split("")).map(&:to_i) #convertir les string en int
		end
	end
	
	return fichier_mat
end

#def trouver_les_cases_vides(tab) #trouver les index des cases vides

#cases_vides = []

	#for ligne in 0...tab.length

		#for colonne in 0...tab[ligne].length

			#if tab[ligne][colonne] == 0

				#cases_vides << [ligne, colonne]
			#end
		#end
	#end

	#return cases_vides
#end

def check_lignes(tab, ligne, chiffre) #chercher un chiffre dans les lignes

	for colonne in 0...tab[ligne].length
		
		if tab[ligne][colonne] == chiffre
			
			return false
		end

		true
	end
end

def check_colonnes(tab, colonne, chiffre) #chercher un chiffre dans les colonnes

	for ligne in 0...tab.length

		if tab[ligne][colonne] == chiffre
			
			return false
		end

		true
	end
end

def check_carrés(tab, ligne, colonne, chiffre) #chercher un chiffre dans les carrés

	ligne_début = (ligne / 3) * 3
	colonne_début = (colonne / 3) * 3
	ligne_fin = ligne_début + 3
	colonne_fin = colonne_début + 3

 	for l in ligne_début...ligne_fin

 		for c in colonne_début...colonne_fin
 			
 			if tab[l][c] == chiffre

 			return false
 			end
 		end
 	end

	true
end

def solve_sudoku(tab)
    ligne = 0
    while ligne < tab.count # i représente une ligne
      colonne = 0
      while colonne < tab[ligne].count # j représente une colonne
        if tab[ligne][colonne] == 0
          chiffre = 1
          while chiffre < 10
            tab[ligne][colonne] = chiffre # Remplace le point par new_value
            if check_lignes(tab, ligne, chiffre) && check_colonnes(tab, colonnes, chiffre) && check_carrés(tab, ligne, colonne, chiffre)
              tab = solve_sudoku(tab)
              return tab if tab == true
            end
            chiffre += 1
          end
          
        end
        colonne += 1
      end
      ligne += 1
    end
    p tab
  end

#Appel des fonctions
tableau = convertir_sudoku_en_matrice(sudoku)
p tableau
#cases_à_remplir = trouver_les_cases_vides(tableau)
#p cases_à_remplir
p solve_sudoku(tableau)

