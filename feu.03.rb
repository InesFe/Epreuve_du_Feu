#Sudoku

#Fonctions
def convertir_sudoku_en_matrice(fichier) 

fichier_mat = []

fichier_ouvert = File.open(fichier) #ouvrir le fichier

fichier_lu = fichier_ouvert.read #lire le fichier

	if fichier_lu.length != 81 #vérifier que la grille comporte 81 éléments

		puts "error : mauvaise taille de la grille"
		exit

	else

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
	end
	
	return fichier_mat
end

def trouver_les_cases_vides(tab) #trouver et stocker les index des cases vides

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

def résoudre_sudoku(tab, cases_vides) #résolution du sudoku

	i = 0
  
	while i < cases_vides.length #itérer dans le tableau des cases vides
    
    	ligne = cases_vides[i][0]
    	colonne = cases_vides[i][1]
    	chiffre = 1
   
   		trouvé = false

    	while !trouvé && chiffre <= 9
      
      		if check_lignes(tab, ligne, chiffre) &&  #faire les checks ligne colonne carré
      		check_colonnes(tab, colonne, chiffre) &&
      		check_carrés(tab, ligne, colonne, chiffre)
        
        		trouvé = true
        
        		tab[ligne][colonne] = chiffre #mettre un chiffre
       
       		i += 1
      
      		else
        		
        		chiffre += 1 #sinon essayer un autre chiffre
      		end
    	end

    	if !trouvé
     
      	tab[ligne][colonne] = 0 #si nécessaire revenir à la case vide précédente
      	i -= 1
    	
    	end
 	 end
  
 	return tab
end

def affichage(tab) #affichage du sudoku en plateau
	
	tab_fini = []
	tab_string = tab.join
	
	i = 0

	while i < tab_string.length
		
		if i % 9 == 0
			
			tab_fini << tab_string[i..i+8]+"\n"
		
		end

	i+=1
	end
	
	return tab_fini
end

#Parsing
sudoku = ARGV[0]

#Gestion d'erreurs
if ARGV.length != 1 #vérifier qu'il y un fichier en argument
	puts "error : 1 file expected"
	exit

elsif !File.exist?(ARGV[0]) #vérifier que le fichier existe
	puts "error : file does not exist"
	exit
end

#Appel des fonctions
tableau = convertir_sudoku_en_matrice(sudoku)
cases_à_remplir = trouver_les_cases_vides(tableau)
résoudre_sudoku(tableau, cases_à_remplir)
puts affichage(tableau)
