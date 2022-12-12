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
			tableau_vide2 << "i\n"

		else
			tableau_vide2 << " "
			
		end
	j+=1
	
	end
	return tableau_vide2
end


def afficher_rectangle(cotes_rectangle, hauteur, largeur)

	
	for k in 1..hauteur.to_i

		if k == 1
			print afficher_largeur_rectangle(cotes_rectangle, largeur).join

		elsif k == hauteur.to_i
			print afficher_largeur_rectangle(cotes_rectangle, largeur).join

		else 
			print afficher_hauteur_rectangle(cotes_rectangle, largeur).join
		end
	end
end

afficher_rectangle(taille_rectangle, hauteur_rectangle, largeur_rectangle)

