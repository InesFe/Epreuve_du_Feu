#parsing
plateau = File.open(ARGV[0]) #ouvrir les fichiers
forme = File.open(ARGV[1])


plateau_lignes = plateau.readlines #lire le plateau 
forme_lignes = forme.readlines #lire la forme

plateau_mat = plateau_lignes.map {|i| i.chomp.split("")} #convertir le plateau en matrice
p plateau_mat

forme_mat= forme_lignes.map {|j| j.chomp.split("")} #convertir la forme en matrice
p forme_mat

def parcourir_plateau(plateau_mat,forme_mat) #parcourir le plateau et chercher la forme

	plateau_mat.each_with_index do |ligne, idx1|
		
		ligne.each_with_index do |colonne, idx2|

			if forme_mat[0][0] == plateau_mat[idx1][idx2] && 
				forme_mat[0][1] == plateau_mat[idx1][idx2+1] && 
				forme_mat[1][1] == plateau_mat[idx1+1][idx2+1]
				
				return "Trouvé!\nCoordonnées : #{idx2}, #{idx1}"
			end

		end

	end
	return "Introuvable"
end

puts parcourir_plateau(plateau_mat, forme_mat)

