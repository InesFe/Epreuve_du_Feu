#Evaluer une expression

calcul_initial = ARGV[0]
calcul_découpé = []

if calcul_initial.include?("(")
	calcul_découpé = calcul_initial.to_s[0..calcul_initial.index("(")] + " " + calcul_initial[calcul_initial.index("(")+1..calcul_initial.index(")")-1] + " " + calcul_initial[calcul_initial.index(")")..-1]
end

calcul_découpé = calcul_découpé.split(' ')

p calcul_découpé

def calculer_eval(calcul_cut)

par = " "
sous_par = " "
sous_calcul = " "
derniers_calculs = " "
i = 0

	if calcul_cut.include?("(") #vérifier si le calcul comporte des parenthèses
		
		p par = calcul_cut.slice!(calcul_cut.index("(")+1..calcul_cut.index(")")-1)
	
	end
		if par.include?("/") #faire les divisons, multiplications, modulo dans les parenthèses

			p sous_par = par.slice!(par.index("/")-1..par.index("/")+1)
			
			p sous_par = sous_par[0].to_i / sous_par[-1].to_i
	
		elsif par.include?("*")
		
			p sous_par = par.slice!(par.index("*")-1..par.index("*")+1)
		
			p sous_par = sous_par[0].to_i * sous_par[-1].to_i
	
		elsif par.include?("%")
		
			p sous_par = par.slice!(par.index("%")-1..par.index("%")+1)
		
			p sous_par = sous_par[0].to_i % sous_par[-1].to_i
		
		end
	
		par = par << sous_par #renvoyer le résultat des divisions, multiplications et modulos dans les parenthèses
	
	
		if par.include?("+") #faire des additions et soustractions des parenthèses

			p sous_par = par.slice!(par.index("+")-1..par.index("+")+1)

			p sous_par = sous_par[0].to_i + sous_par[-1].to_i

		elsif par.include?("-")

			p sous_par = par.slice!(par.index("-")-1..par.index("-")+1)

			p sous_par = sous_par[0].to_i - sous_par[-1].to_i
		end

	
		par = par << sous_par #renvoyer le résultat additions et soustractions dans les parenthèses 

		p calcul_cut = calcul_cut[0..(calcul_cut.index("(")-1)] + par + calcul_cut[(calcul_cut.index(")")+1)..-1] #renvoyer le résultat final des parenthèses dans le calcul
	

	
	if calcul_cut.include?("*") #faire les multiplications, divisions, modulos du calcul final

		p sous_calcul = calcul_cut.slice!(calcul_cut.index("*")-1..calcul_cut.index("*")+1)

		p sous_calcul = sous_calcul[0].to_i * sous_calcul[-1].to_i

		p calcul_cut = calcul_cut.insert(calcul_cut.index("+")+1, "#{sous_calcul}".to_i) #renvoyer le résultat dans le calcul

	
	elsif calcul_cut.include?("/")

		p sous_calcul = calcul_cut.slice!(calcul_cut.index("/")-1..calcul_cut.index("/")+1)

		p sous_calcul = sous_calcul[0].to_i / sous_calcul[-1].to_i

		p calcul_cut = calcul_cut.insert(calcul_cut.index("+")+1, "#{sous_calcul}") #renvoyer le résultat dans le calcul


	elsif calcul_cut.include?("%")

		p sous_calcul = calcul_cut.slice!(calcul_cut.index("%")-1..calcul_cut.index("%")+1) 

		p sous_calcul = sous_calcul[0].to_i % sous_calcul[-1].to_i

		p calcul_cut = calcul_cut.insert(calcul_cut.index("+")+1, "#{sous_calcul}") #renvoyer le résultat dans le calcul

	end

	
	until calcul_cut.length == 1 #faire les additions et soustractions finales
	
		if calcul_cut.include?("+") 

			p derniers_calculs = calcul_cut.slice!(calcul_cut.index("+")-1..calcul_cut.index("+")+1) 

			p derniers_calculs = derniers_calculs[0].to_i + derniers_calculs[-1].to_i

			p calcul_cut = calcul_cut.unshift("#{derniers_calculs}")

		elsif calcul_cut.include?("-") 

			p derniers_calculs = calcul_cut.slice!(calcul_cut.index("+")-1..calcul_cut.index("+")+1) 

			p derniers_calculs = derniers_calculs[0].to_i - derniers_calculs[-1].to_i

			p calcul_cut = calcul_cut.unshift("#{derniers_calculs}")

		end
	end

return calcul_cut
end

puts calculer_eval(calcul_découpé)
