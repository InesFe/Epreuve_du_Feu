#parsing
plateau = File.open(ARGV[0]) #ouvrir les fichiers
forme = File.open(ARGV[1])


plateau_lignes = plateau.readlines #convertir le plateau et la forme en matrice
forme_lignes = forme.readlines

plateau_mat = plateau_lignes.map {|i| i.chomp.split("")}
p plateau_mat

forme_mat= forme_lignes.map {|j| j.chomp.split("")}
p forme_mat

p plateau_mat[2][2]
p forme_mat[1][0]
