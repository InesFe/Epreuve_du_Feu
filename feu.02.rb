#parsing
plateau = File.open(ARGV[0]) #ouvrir les fichiers
forme = File.open(ARGV[1])


plateau_lignes = plateau.readlines #convertir le plateau et la forme en matrice
forme_lignes = forme.readlines

plateau_mat = plateau_lignes.map {|i| i.chomp.split("")}
p plateau_mat

forme_mat= forme_lignes.map {|j| j.chomp.split("")}
p forme_mat

def parcourir_plateau(plateau_mat)

	for k in plateau_mat
	
		for l in k
		puts l

		end
	end
end

parcourir_plateau(plateau_mat)


def parcourir_forme(forme_mat)

	for o in forme_mat

		for q in o
			puts q
		end
	end
end

parcourir_forme(forme_mat)

