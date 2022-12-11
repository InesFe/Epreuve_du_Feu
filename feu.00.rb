#Echauffement
taille_rectangle = ARGV[0,1]
largeur_rectangle = ARGV[0]
hauteur_rectangle = ARGV[-1]
p largeur_rectangle
p hauteur_rectangle

def afficher_largeur_rectangle(cotes_rectangle, largeur)

tableau_vide = []
i = 1

	while i <= largeur.to_i
		
		if (i == 1) || (i == largeur.to_i)
			tableau_vide << "o"
		else
			tableau_vide << "-"
		end
	i+=1
	
	end
	return tableau_vide
end

puts afficher_largeur_rectangle(taille_rectangle, largeur_rectangle).join

def afficher_hauteur_rectangle(cotes_rectangle, hauteur, largeur)

tableau_vide2 = []
j = 1
k = 2

	while j <= largeur.to_i 

		if (j == 1) || (j == largeur.to_i)

			while k <= (hauteur.to_i-1)
				tableau_vide2 << "|"
			
			k+=1
			end 

		end
	j+=1
	
	end
	return tableau_vide2
end

puts afficher_hauteur_rectangle(taille_rectangle, hauteur_rectangle, largeur_rectangle)







