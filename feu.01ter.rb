#Evaluer une expression

calcul_initial = ARGV[0]
calcul_découpé = calcul_initial.to_s.delete(" ").chars
p calcul_découpé


def afficher_intérieur_parenthèses(calcul_cut)

par = " "
résultat_par = []
calcul = []

	if calcul_cut.include?("(")
		
		p par = calcul_cut.slice!(calcul_cut.index("(")+1..calcul_cut.index(")")-1)
	end
	
	if par.include?("/")
		résultat_par = par[par.index("/")-1].to_i / par[par.index("/")+1].to_i
	
	elsif par.include?("*")
		résultat_par = par[par.index("*")-1].to_i * par[par.index("*")+1].to_i
	end
	

	return résultat_par
end

p afficher_intérieur_parenthèses(calcul_découpé)

