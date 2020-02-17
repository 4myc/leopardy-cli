Player.destroy_all
Question.destroy_all
Answer.destroy_all
Game.destroy_all

p1 = Player.create(name: "Andy", score: 0)
p2 = Player.create(name: "Beth", score: 0)
p3 = Player.create(name: "Cecilia", score: 0)
p4 = Player.create(name: "David", score: 0)
p5 = Player.create(name: "Elaine", score: 0)
p6 = Player.create(name: "Finn", score: 0)
p7 = Player.create(name: "George", score: 0)
p8 = Player.create(name: "Holly", score: 0)
p9 = Player.create(name: "Inga", score: 0)
p10 = Player.create(name: "Jerry", score: 0)

q1 = Question.create(clue: "Leopards have this coat pattern")
q2 = Question.create(clue: "A group of leopards is called this")
q3 = Question.create(clue: "The maximum speed at which a leopard can run")
q4 = Question.create(clue: "A baby leopard weighs this many pounds")
q5 = Question.create(clue: "A leopard does this to avoid prey theft")
q6 = Question.create(clue: "This animal often steals prey from leopards")
q7 = Question.create(clue: "Black panthers from these continents are leopards")
q8 = Question.create(clue: "Leopards’ ears can hear this many times more sounds than the human ear")
q9 = Question.create(clue: "The leopard’s scientific name is")
q10 = Question.create(clue: "Leopards are one of out this many species in the big cat genus Panthera")

#clue: "Leopards have this coat pattern"
a1_1 = Answer.create(content: "rosette", correct: true, question_id: q1.id)
a1_2 = Answer.create(content: "spots", correct: false, question_id: q1.id)
a1_3 = Answer.create(content: "rosette with spots", correct: false, question_id: q1.id)

#clue: "A group of leopards is called"
a2_1 = Answer.create(content: "ambush", correct: false, question_id: q2.id)
a2_2 = Answer.create(content: "pride", correct: false, question_id: q2.id)
a2_3 = Answer.create(content: "prowl", correct: true, question_id: q2.id)

#clue: "The maximum speed at which a leopard can run"
a3_1 = Answer.create(content: "26 mph", correct: false, question_id: q3.id)
a3_2 = Answer.create(content: "36 mph", correct: true, question_id: q3.id)
a3_3 = Answer.create(content: "56 mph", correct: false, question_id: q3.id)

#clue: "A baby leopard weighs this many pounds"
a4_1 = Answer.create(content: "1", correct: true, question_id: q4.id)
a4_2 = Answer.create(content: "2", correct: false, question_id: q4.id)
a4_3 = Answer.create(content: "3", correct: false, question_id: q4.id)

#clue: "A leopard does this to avoid prey theft"
a5_1 = Answer.create(content: "eat it quickly", correct: false, question_id: q5.id)
a5_2 = Answer.create(content: "bury it", correct: false, question_id: q5.id)
a5_3 = Answer.create(content: "carry it up a tree", correct: true, question_id: q5.id)

#clue: "This animal often steals prey from leopards"
a6_1 = Answer.create(content: "cheetah", correct: false, question_id: q6.id)
a6_2 = Answer.create(content: "hyena", correct: true, question_id: q6.id)
a6_3 = Answer.create(content: "tiger", correct: false, question_id: q6.id)

#clue: "Black panthers from these continents are leopards"
a7_1 = Answer.create(content: "Europe", correct: false, question_id: q7.id)
a7_2 = Answer.create(content: "North & South America", correct: false, question_id: q7.id)
a7_3 = Answer.create(content: "Africa & Asia", correct: true, question_id: q7.id)

#clue: "Leopards’ ears can hear this many times more sounds than the human ear"
a8_1 = Answer.create(content: "8", correct: false, question_id: q8.id)
a8_2 = Answer.create(content: "5", correct: true, question_id: q8.id)
a8_3 = Answer.create(content: "10", correct: false, question_id: q8.id)

#clue: "The leopard’s scientific name is"
a9_1 = Answer.create(content: "Panthera leo", correct: false, question_id: q9.id)
a9_2 = Answer.create(content: "Panthera onca", correct: false, question_id: q9.id)
a9_3 = Answer.create(content: "Panthera pardus", correct: true, question_id: q9.id)

#clue: "Leopards are one of out this many species in the big cat genus Panthera"
a10_1 = Answer.create(content: "5", correct: true, question_id: q10.id)
a10_2 = Answer.create(content: "6", correct: false, question_id: q10.id)
a19_3 = Answer.create(content: "7", correct: false, question_id: q10.id)

#clue: 
# a11_1 = Answer.create(content: "", correct: true, question_id: q11.id)
# a11_2 = Answer.create(content: "", correct: false, question_id: q11.id)
# a11_3 = Answer.create(content: "", correct: false, question_id: q11.id)

g1 = Game.create(player_id: p1.id, question_id: q1.id)
g2 = Game.create(player_id: p2.id, question_id: q2.id)
g3 = Game.create(player_id: p3.id, question_id: q3.id)
g4 = Game.create(player_id: p4.id, question_id: q4.id)
g5 = Game.create(player_id: p5.id, question_id: q5.id)
g6 = Game.create(player_id: p6.id, question_id: q6.id)
g7 = Game.create(player_id: p7.id, question_id: q7.id)
g8 = Game.create(player_id: p8.id, question_id: q8.id)
g9 = Game.create(player_id: p9.id, question_id: q9.id)
g10 = Game.create(player_id: p10.id, question_id: q10.id)