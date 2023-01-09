#Evaluer une expression

calcul_initial = ARGV[0]
calcul_découpé = calcul_initial.to_s.delete(" ").chars
p calcul_découpé


def gérer_intérieur_parenthèses(calcul_cut)

par = " "
sous_par = " "

	if calcul_cut.include?("(")
		
		p par = calcul_cut.slice!(calcul_cut.index("(")+1..calcul_cut.index(")")-1)
	end
	
	if par.include?("/")

		p sous_par = par.slice!(par.index("/")-1..par.index("/")+1)
		
		p sous_par = sous_par[0].to_i / sous_par[-1].to_i
	
	elsif par.include?("*")
		
		p sous_par = par.slice!(par.index("*")-1..par.index("*")+1)
		
		p sous_par = sous_par[0].to_i * sous_par[-1].to_i
	
	elsif par.include?("%")
		
		p sous_par = par.slice!(par.index("%")-1..par.index("%")+1)
		
		p sous_par = sous_par[0].to_i % sous_par[-1].to_i
	
	end
	
	par << sous_par
	
	if par.include?("+")

		p sous_par = par.slice!(par.index("+")-1..par.index("+")+1)

		p sous_par = sous_par[0].to_i + sous_par[-1].to_i

	elsif par.include?("-")

		p sous_par = par.slice!(par.index("-")-1..par.index("-")+1)

		p sous_par = sous_par[0].to_i - sous_par[-1].to_i
	end

	par << sous_par 

	p calcul_cut = calcul_cut[0..(calcul_cut.index("(")-1)] + par + calcul_cut[(calcul_cut.index(")")+1)..-1]

end

gérer_intérieur_parenthèses(calcul_découpé)









