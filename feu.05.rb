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

#Parsing
carte_laby = ARGV[0]

#Appel des fonctions
laby_matrice = faire_matrice(carte_laby)
p laby_matrice