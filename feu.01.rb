#Evaluer une expression
calcul_initial = ARGV[0]

def extraire_nombres_des_parenthèses(calcul)

calcul_splité = calcul.to_s.chars
intérieur_parenthèses = []

intérieur_parenthèses << calcul_splité[calcul_splité.index("(")+1..calcul_splité.index(")")-1]
return intérieur_parenthèses

end

p extraire_nombres_des_parenthèses(calcul_initial).join(' ').split



def faire_division(calcul)
	calcul_splité = calcul.to_s.chars
	p calcul_splité
	résultat_division = []
	
	if calcul.include?("/")
		résultat_division << calcul_splité[calcul_splité.index("/")-2].to_i / calcul_splité[calcul_splité.index("/")+2].to_i
	end
	return résultat_division
end

p faire_division(calcul_initial)

def 
