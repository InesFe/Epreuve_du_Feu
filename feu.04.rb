#Trouver le plus grand carré

#Fonctions
def faire_une_matrice_de_1_et_0(fichier) #met le plateau en matrice d'integer
	fichier_mat = []
	
	fichier_ouvert = File.open(fichier)
	fichier_lu  = fichier_ouvert.read 

	for i in 0..fichier_lu.length
		
		if fichier_lu[i] == "."

			fichier_lu[i] = fichier_lu[i].gsub(".", "1")
		
		elsif fichier_lu[i] == "x"

			fichier_lu[i] = fichier_lu[i].gsub("x", "0")
		end
	end

	fichier_lu = fichier_lu.split("\n")

	fichier_lu.each do |j| 
		
		fichier_mat << (j.chars).map(&:to_i) 
	end

return fichier_mat[1..-1]
end

def chercher_le_carré(tab) #algo de résolution : cherche les coordonnées de l'angle bas/droit du carré et la longueur des cotés

	cache = tab.clone #initialisation d'un cache
	
	résultat = 0

	for ligne in 0...tab.length
		
		for col in 0...tab[ligne].length

			if tab[ligne][col] == 0

				cache[ligne][col] = 0 #cache remis à 0 si on a un 0 dans le tableau

			elsif ligne > 0 && col > 0 #incrémentation du cache si on a un 1

				cache[ligne][col] = [cache[ligne][col-1], cache[ligne-1][col], cache[ligne-1][col-1]].min + 1

			end
			
			if cache[ligne][col] > résultat #incrémentation du résultat en fonction du cache
				
				résultat = cache[ligne][col]
				coordonées = ligne, col 
			
			end

		end
		
	end
	
	return [coordonées, résultat].flatten
end

def afficher_le_plus_grand_carré(fichier, coord_resul) #affiche le carré en "o" à partir des cordonnées
	
	tab_a_afficher = []
	
	fichier_ouvert = File.open(fichier)
	fichier_lu  = fichier_ouvert.read.split("\n")

	fichier_lu.each do |j| 
		
		 tab_a_afficher << (j.chars)
	end

	début_carré_ligne = coord_resul[0] - coord_resul[2] + 2 #remplacer les "." par "o" aux coordonnées du carré
	fin_carré_ligne = coord_resul[0] + 1


	début_carré_col = coord_resul[1] - coord_resul[2] + 1
	fin_carré_col = coord_resul[1]

	
	for k in début_carré_ligne..fin_carré_ligne
					
		for l in début_carré_col..fin_carré_col

			tab_a_afficher[k][l] = tab_a_afficher[k][l].gsub(".", "o")

		end
	end
		
	for i in 0...tab_a_afficher.length
		tab_a_afficher[i] = tab_a_afficher[i].join + "\n"

	end
    
    return tab_a_afficher[1..-1]
end

#Parsing
plateau = ARGV[0]

#Gestion d'erreurs
if ARGV.length != 1 #vérifier qu'il y un fichier en argument
	puts "error : 1 file expected"
	exit

elsif !File.exist?(ARGV[0]) #vérifier que le fichier existe
	puts "error : file does not exist"
	exit
end

#Appel des fonctions
matrice = faire_une_matrice_de_1_et_0(plateau)
coordonnées_résultat = chercher_le_carré(matrice)
puts afficher_le_plus_grand_carré(plateau, coordonnées_résultat)
