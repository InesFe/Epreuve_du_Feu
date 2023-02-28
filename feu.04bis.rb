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

			fichier_lu[i] = fichier_lu[i].gsub(".", "0")
		
		elsif fichier_lu[i] == "x"

			fichier_lu[i] = fichier_lu[i].gsub("x", "1")
		end
	end

	fichier_lu = fichier_lu.split("\n")

	fichier_lu.each do |j| 
		
		fichier_mat << (j.chars).map(&:to_i) 
	end

return fichier_mat[1..-1]
end


def chercher_le_carré(tableau)

	cache = tableau.clone
	p cache

end

#Appel des fonctions
matrice = faire_une_matrice_de_1_et_0(plateau)
p matrice

#chercher_le_carré(matric e)