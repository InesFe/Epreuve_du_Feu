plateau = ARGV[0] #trouver les noms des fichiers passés en arguments
forme = ARGV[1]

plateau = File.open(ARGV[0]) #ouvrir les fichiers
forme = File.open(ARGV[1])

plateau_lignes = plateau.readlines #parcourir le plateau et la forme ligne par ligne
forme_lignes = forme.readlines

p plateau_lignes
p forme_lignes