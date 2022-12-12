#Echauffement

#parsing
taille_rectangle = ARGV[0,1]
largeur_rectangle = ARGV[0]
hauteur_rectangle = ARGV[1]

#fonctions
def afficher_largeur_rectangle(cotes_rectangle, largeur)

tableau_vide = []

	if (largeur.to_i < 1) || (largeur.length < 1)
		puts "error  : -1"
		exit
	end

	for i in 1..largeur.to_i
		
		if i == 1
			tableau_vide << "o"
		
		elsif i == largeur.to_i
			tableau_vide << "o\n"
		
		else
			tableau_vide << "-"
		end
	end
	return tableau_vide
end

def afficher_hauteur_rectangle(cotes_rectangle, largeur)

tableau_vide2 = []

	for j in 1..largeur.to_i 

		if j == 1
			tableau_vide2 << "|"

		elsif j == largeur.to_i
			tableau_vide2 << "|\n"

		else
			tableau_vide2 << " "
		end
	end
	return tableau_vide2
end


def afficher_rectangle(cotes_rectangle, hauteur, largeur)

	if (hauteur.to_i < 1) || (hauteur.length < 1)
		puts "error  : -1"
		exit
	end

	if largeur.to_i == 1
		
		if hauteur.to_i > 1
			puts "error : -1"
			exit
		end
	end
	
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

#gestion erreurs et affichage
if taille_rectangle.all?(/\d/)
	
	afficher_rectangle(taille_rectangle, hauteur_rectangle, largeur_rectangle)
else
	puts "error = -1"
end

