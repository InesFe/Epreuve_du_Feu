plateau = ARGV[0] #trouver les noms des fichiers passés en arguments
forme = ARGV[1]

plateau = File.open(ARGV[0]) #ouvrir les fichiers
forme = File.open(ARGV[1])

plateau_lignes = plateau.readlines#parcourir le plateau et la forme ligne par ligne
forme_lignes = forme.readlines

plateau_tableau = plateau_lignes.map {|i| i.chomp.split("")}
p plateau_tableau

forme_tableau = forme_lignes.map {|j| j.chomp.split("")}
p forme_tableau


