#Echauffement
taille_rectangle = ARGV[0,1]
largeur_rectangle = ARGV[0]
hauteur_rectangle = ARGV[1]

def afficher_largeur_rectangle(cotes_rectangle, largeur)

tableau_vide = []
i = 1

	while i <= largeur.to_i
		
		if i == 1
			tableau_vide << "o"
		
		elsif i == largeur.to_i
			tableau_vide << "o\n"
		else
			tableau_vide << "-"
		end
	
	i+=1
	end
	
	return tableau_vide
end


def afficher_hauteur_rectangle(cotes_rectangle, largeur)

tableau_vide2 = []
j = 1

	while j <= largeur.to_i 

		if j == 1
			tableau_vide2 << "|"

		elsif j == largeur.to_i
			tableau_vide2 << "i"

		else
			tableau_vide2 << " "
			
		end
	j+=1
	
	end
	return tableau_vide2
end


#def afficher_rectangle(cotes_rectangle, hauteur_rectangle)




#end
print afficher_largeur_rectangle(taille_rectangle, largeur_rectangle).join

print afficher_hauteur_rectangle(taille_rectangle, largeur_rectangle).join












