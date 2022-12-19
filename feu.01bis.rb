#Evaluer une expression

#parsing
calcul_initial = ARGV[0]
calcul_coupé = calcul_initial.to_s.chars

#fonctions
def extraire_nombres_des_parenthèses(calcul_splité)

intérieur_parenthèses = []
résultat_div = []

	if calcul_splité.include?("(")
		intérieur_parenthèses << calcul_splité[calcul_splité.index("(")+1..calcul_splité.index(")")-1]
	end

	return intérieur_parenthèses

end


def faire_division(calcul_splité)
	
	résultat_division = []
	
	if calcul_splité.include?("/")
		résultat_division << calcul_splité[calcul_splité.index("/")-2].to_i / calcul_splité[calcul_splité.index("/")+2].to_i
	end
	
	calcul_splité = calcul_splité[0..calcul_splité.index("/")-3]+résultat_division+calcul_splité[calcul_splité.index("/")+3..-1]

	return calcul_splité
end


def faire_multiplication(calcul_splité)
	
	résultat_multiplication = []

	if calcul_splité.include?("*")
		résultat_multiplication << calcul_splité[calcul_splité.index("*")-2].to_i * calcul_splité[calcul_splité.index("*")+2].to_i
	end
	
	calcul_splité = calcul_splité[0..calcul_splité.index("*")-3]+résultat_multiplication+calcul_splité[calcul_splité.index("*")+3..-1]

	return calcul_splité

end


def faire_addition(calcul_splité)

	résultat_addition= []

	if calcul_splité.include?("+")
		résultat_addition << calcul_splité[calcul_splité.index("+")-2].to_i + calcul_splité[calcul_splité.index("+")+2].to_i
	end
	
	calcul_splité = calcul_splité[0..calcul_splité.index("+")-3]+résultat_addition+calcul_splité[calcul_splité.index("+")+3..-1]

	return calcul_splité
end


def faire_soustraction(calcul_splité)
	
	résultat_soustraction= []

	if calcul_splité.include?("-")
		résultat_soustraction << calcul_splité[calcul_splité.index("-")-2].to_i - calcul_splité[calcul_splité.index("-")+2].to_i
	end
	
	calcul_splité = calcul_splité[0..calcul_splité.index("-")-3]+résultat_soustraction+calcul_splité[calcul_splité.index("-")+3..-1]

	return calcul_splité
end


def calculer_dans_les_parenthèses(calcul_splité)

	if calcul_splité.include?("(")
		p extraire_nombres_des_parenthèses(calcul_splité)
	
		if calcul_splité.include?("/")
			p faire_division(calcul_splité)

		elsif calcul_splité.include?("*")
			p faire_multiplication(calcul_splité)
		end
	end
end

calculer_dans_les_parenthèses(calcul_coupé)
























