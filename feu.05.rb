#Labyrinthe

#Fonctions

def faire_matrice(fichier) #met le laby en matrice d'integer, obstacles = 3, vides  = 4, entrée = 1, sorties = 2
	fichier_mat = []
	
	fichier_ouvert = File.open(fichier)
	fichier_lu  = fichier_ouvert.read 

	for i in 0..fichier_lu.length
		
		if fichier_lu[i] == "*"

			fichier_lu[i] = fichier_lu[i].gsub("*", "3")
		
		elsif fichier_lu[i] == " "

			fichier_lu[i] = fichier_lu[i].gsub(" ", "4")
		end
	end

	fichier_lu = fichier_lu.split("\n")

	fichier_lu.each do |j| 
		
		fichier_mat << (j.chars).map(&:to_i) 
	end

return fichier_mat[1..-1]
end

def trouver_coordonées_entrée(lab_matrice) #renvoie les coordonées de l'entrée du laby

	for ligne in 0...lab_matrice.length
		
		for col in 0...lab_matrice[ligne].length

			if lab_matrice[ligne][col] == 1

				coord_entrée = ligne, col
			end
		end
	end
	
	return [coord_entrée].flatten
end

def trouver_coordonées_sortie(lab_matrice) #renvoie les coordonées de différentes sorties du laby

	coord_sortie = []
	
	for ligne in 0...lab_matrice.length
		
		for col in 0...lab_matrice[ligne].length

			if lab_matrice[ligne][col] == 2

				coord_sortie << ligne
				coord_sortie << col
			end
		end
	end
	
	return coord_sortie
end

def trouver_la_sortie(lab_matrice, coord_entrée, coord_sortie)

	# Initialisation de la matrice de distance avec des valeurs à l'infini sauf pour l'entrée
	distance_matrice = Array.new(lab_matrice.length) { Array.new(lab_matrice[0].length, Float::INFINITY) }
	distance_matrice[coord_entrée[0]][coord_entrée[1]] = 0
  
	# Initialisation de la file pour le parcours en largeur
	queue = [coord_entrée]
  
	while queue.length > 0 # On retire le prochain noeud de la file
    
    	noeud = queue.shift
    	voisins = [[-1, 0], [0, 1], [1, 0], [0, -1]]# On parcourt les noeuds des 4 voisins possibles
    
    	voisins.each do |voisin|
    		
    		row = noeud[0] + voisin[0]
    		col = noeud[1] + voisin[1]
      
    			# Si le voisin est à l'intérieur de la matrice et non un obstacle
      			if row >= 0 && row < lab_matrice.length && col >= 0 && col < lab_matrice[0].length && lab_matrice[row][col] != 3
        
        		# Si la distance jusqu'à ce voisin est plus courte que la valeur précédente
        			if distance_matrice[row][col] > distance_matrice[noeud[0]][noeud[1]] + 1
          
          				distance_matrice[row][col] = distance_matrice[noeud[0]][noeud[1]] + 1
          				queue << [row, col]
        			end
      			end
    	end
 	end
  
  	# Recherche de la sortie la plus proche
  	min_distance = Float::INFINITY
  	coord_sortie_proche = nil
  		
  		coord_sortie.each_slice(2) do |sortie|
    		
    		distance = distance_matrice[sortie[0]][sortie[1]]
    			
    			if distance < min_distance
     				
     				min_distance = distance
      				coord_sortie_proche = sortie
    			end
    		
    		#p coord_sortie_proche
  		end
  
  	# Parcours du chemin pour tracer le chemin dans la matrice
	chemin = []
  	compteur = 0

		if min_distance < Float::INFINITY
    	
    	noeud_courant = coord_sortie_proche
    		
    		while distance_matrice[noeud_courant[0]][noeud_courant[1]] != 0
    		
    		chemin << noeud_courant
      		voisins = [[-1, 0], [0, 1], [1, 0], [0, -1]]
      			
      			voisins.each do |voisin|
        			
        			row = noeud_courant[0] + voisin[0]
        			col = noeud_courant[1] + voisin[1]
        
        			if lab_matrice[row][col] != coord_entrée[0][1]
        
        				if row >= 0 && row < lab_matrice.length && col >= 0 && col < lab_matrice[0].length && distance_matrice[row][col] == distance_matrice[noeud_courant[0]][noeud_courant[1]]-1
          					
          					noeud_courant = [row, col]
							lab_matrice[row][col] = 8
          					compteur += 1
						end 
        			end
				end
			end
		end

	#print lab_matrice
	return compteur -1
end

def afficher_en_propre(lab_matrice, coord_entrée) #affichage du labyrinthe comme dans l'exemple

	lab_fini = []
	
	for ligne in 0...lab_matrice.length

			lab_fini << lab_matrice[ligne].map(&:to_s) 
	end

	for l in 0...lab_fini.length

		for c in 0...lab_fini[l].length

			if l == coord_entrée[0] && c == coord_entrée[1]
				
				lab_fini[l][c] = lab_fini[l][c].gsub("8", "1")
			
			elsif lab_fini[l][c] == "3"
			
				lab_fini[l][c] = lab_fini[l][c].gsub("3", "*")

			elsif lab_fini[l][c] == "4"
			
				lab_fini[l][c] = lab_fini[l][c].gsub("4", " ")

			elsif lab_fini[l][c] == "8"
			
				lab_fini[l][c] = lab_fini[l][c].gsub("8", "o")


			end

			
		end
	end

	for i in 0...lab_fini.length
		
		lab_fini[i] = lab_fini[i].join + "\n"

	end
	
	return lab_fini
end

def affichage_final(lab_fini)

end



#Parsing
carte_laby = ARGV[0]

#Appel des fonctions
laby_matrice = faire_matrice(carte_laby)
coordonées_entrée = trouver_coordonées_entrée(laby_matrice)
coordonées_sortie = trouver_coordonées_sortie(laby_matrice)
compte = trouver_la_sortie(laby_matrice, coordonées_entrée, coordonées_sortie)

laby_fini = afficher_en_propre(laby_matrice, coordonées_entrée)
puts laby_fini
puts "Sortie atteinte en #{compte} coups !"

