#Trouver le plus grand carré

#Parsing
plateau = ARGV[0]


#Fonctions
def faire_une_matrice_de_1_et_0(fichier)

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


def chercher_le_carré(tab)

	cache = tab.clone
	
	résultat = 0

	for ligne in 0...tab.length
		
		for col in 0...tab[ligne].length


			if ligne == 0 || col == 0 || tab[ligne][col] == 0

				cache[ligne][col] = 0


			elsif ligne > 0 && col > 0 

				cache[ligne][col] = [cache[ligne][col-1], cache[ligne-1][col], cache[ligne-1][col-1]].min + 1

			end
			

			if cache[ligne][col] > résultat
				
				résultat = cache[ligne][col]
				coordonées = ligne, col+1
			
			end

		end
		
	end
	p cache
	return [coordonées, résultat + 1].flatten


end

#Appel des fonctions
matrice = faire_une_matrice_de_1_et_0(plateau)
p matrice

p chercher_le_carré(matrice)