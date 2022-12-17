#Evaluer une expression
calcul_initial = ARGV[0]
p calcul_initial

def extraire_nombres_des_parenthèses(calcul)

calcul_splité = calcul.to_s.chars
p calcul_splité
intérieur_parenthèses = []

intérieur_parenthèses << calcul_splité[calcul_splité.index("(")+1..calcul_splité.index(")")-1]
return intérieur_parenthèses

end

p extraire_nombres_des_parenthèses(calcul_initial).join(' ')