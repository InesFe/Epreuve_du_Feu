#Sudoku

#Parsing
sudoku_a_remplir = ARGV[0]

#Fonctions
def convertir_sudoku_en_matrice(fichier)

fichier_mat = []

fichier_ouvert = File.open(fichier) #ouvrir le fichier

fichier_lu = fichier_ouvert.read #lire le fichier

	for i in 0..fichier_lu.length - 1 do #remplacer les . par des 0

		if fichier_lu[i] == "."
			
			fichier_lu[i] = fichier_lu[i].gsub(".", "0")

		end

	end
	
	for i in 0...fichier_lu.length do #faire les lignes de 9 chiffres

		if i % 9 == 0
			
			fichier_mat << (fichier_lu[i...i + 9].split("")).map(&:to_i) #convertir les string en int
		end
	end
	
	return fichier_mat
end

def find_next_empty(tab) #trouver la prochaine case à remplir

	none = true
	next_empty = []

	for r in 0..8
		
		for c in 0..8
			
			if tab[r][c] == 0
				
				next_empty << [r, c]
				
			return next_empty.flatten
			end
		
		end
	end
	
	return none, none
end

def check_lignes(tab, guess, row) #chercher un chiffre dans les lignes

	for colonne in 0...tab[row].length
		
		if tab[row][colonne] == guess
			
			return false
		end

		
	end
	return true
end

def check_colonnes(tab, guess, row, col) #chercher un chiffre dans les colonnes

	for ligne in 0...tab.length

		if tab[row][col] == guess
			
			return false
		end

	end
	return true
end

def check_carrés(tab, guess, row, col) #chercher un chiffre dans les carrés

	row_début = (row / 3) * 3
	col_début = (col / 3) * 3
	row_fin = row_début + 3
	col_fin = col_début + 3

 	for l in row_début...row_fin

 		for c in col_début...col_fin
 			
 			if tab[l][c] == guess

 			return false
 			end
 		end
 	end

	return true
end

def solve_sudoku(tab, next_empty)

	row = next_empty[0]
	col = next_empty[1]
	p row
	p col
	return tab if next_empty == [true, true]
	
	for guess in 1..9

		if check_lignes(tab, guess, row) &&
			check_colonnes(tab, guess, row, col) &&
			check_carrés(tab, guess, row, col)

				tab[row][col] = guess
		

		else 
			tab[row][col] = 0

		end 
	end

	

end

#Appel des fonctions
tableau = convertir_sudoku_en_matrice(sudoku_a_remplir)
p tableau
next_vide = find_next_empty(tableau)
p solve_sudoku(tableau, next_vide)












