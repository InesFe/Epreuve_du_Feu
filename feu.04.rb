#Trouver le plus grand carré

#Parsing
plateau = ARGV[0]


#Fonctions
def faire_une_matrice(fichier)
	
	fichier_lu = File.open(fichier).readlines
	fichier_en_matrice  = fichier_lu.map {|line| line.chomp.split('')}

return fichier_en_matrice[1..-1]

end

p faire_une_matrice(plateau)