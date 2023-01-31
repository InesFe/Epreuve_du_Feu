#Fonctions
def convertir_plateau_et_forme_en_matrices(fichier)

fichier_ouvert = File.open(fichier) #ouvrir le fichier

fichier_lignes = fichier_ouvert.readlines #lire le fichier

fichier_mat = fichier_lignes.map {|i| i.chomp.split("")} #convertir en matrice

return fichier_mat
end

def parcourir_plateau_et_comparer(fichier1, fichier2)

	fichier1.each_with_index do |ligne, idx1| #parcourir les lignes du plateau
		
		ligne.each_with_index do |colonne, idx2| #parcourir les colonnes du plateau

			if fichier2[0][0] == fichier1[idx1][idx2] &&  #chercher correspondance entre forme et plateau
				fichier2[0][1] == fichier1[idx1][idx2+1] && 
				fichier2[1][1] == fichier1[idx1+1][idx2+1]
				
				return "Trouvé!\nCoordonnées : #{idx2}, #{idx1}" #renvoyer les coordonnées
			end
		end
	end
	return "Introuvable"
end

#Parsing
plateau_et_forme = ARGV

#Gestion d'erreurs
if plateau_et_forme.length != 2
	puts "error : 2 files expected"
	exit

elsif !File.exist?(ARGV[0]) || !File.exist?(ARGV[1])
	puts "error : file does not exist"
	exit
end
	
#Résolution
plateau = p convertir_plateau_et_forme_en_matrices(ARGV[0])
forme = p convertir_plateau_et_forme_en_matrices(ARGV[1])

parcourir_plateau = puts parcourir_plateau_et_comparer(plateau, forme)



