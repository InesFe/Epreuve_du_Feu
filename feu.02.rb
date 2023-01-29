#Fonctions
def convertir_plateau_et_forme_en_matrices(fichier)

fichier_ouvert = File.open(fichier) #ouvrir le fichier

fichier_lignes = fichier_ouvert.readlines #lire le fichier

fichier_mat = fichier_lignes.map {|i| i.chomp.split("")} #convertir en matrice
end


def parcourir_plateau(fichier1_mat,fichier2_mat) #parcourir le plateau et chercher la forme

	fichier1_mat.each_with_index do |ligne, idx1|
		
		ligne.each_with_index do |colonne, idx2|

			if fichier2_mat[0][0] == fichier1_mat[idx1][idx2] && 
				fichier2_mat[0][1] == fichier1_mat[idx1][idx2+1] && 
				fichier2_mat[1][1] == fichier1_mat[idx1+1][idx2+1]
				
				return "Trouvé!\nCoordonnées : #{idx2}, #{idx1}"
			end

		end

	end
	return "Introuvable"
	exit
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

trouver_la_forme = puts parcourir_plateau(plateau, forme)
return trouver_la_forme #Affichage
