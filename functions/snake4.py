#!/usr/bin/python

'''
Snake game for social defeat task
Created by Guillaume Sartoretti
Modified by Jonathan Wilson & Anna Szucs
2/16/07 First creation
2/26/17 Added multiple apples, more command line options, disbaled snake dying on contact with itself - Jonathan
3/03/2017 Fixed apple generate to only appear when all are collected, added speed option, fixed final score to be correct - Jonathan
3/06/2017 Reduced commands to left-right click - Anna
5/04/2017 Added adjustable warnings 10 seconds before the end of the game - Anna (with the help of Guillaume)
'''

from Tkinter import *
from random import randrange
import argparse

# Creation de la fenetre principale, canevas et boutons

'Initialize Tkinter'
fen = Tk()
fen.configure(background='black')
fen.title("Snake")

#remove title bar 
fen.overrideredirect(1)

'Initialize canvas'
can = Canvas(fen, height=501, width=501, bg='light grey')
can.grid(row=0, rowspan=20, column=0, padx=3, pady=3)
#can.configure(background='grey')

# center Tkinter window
screen_width = fen.winfo_screenwidth()
screen_height = fen.winfo_screenheight()
x = (screen_width/19)
y = (screen_height/5)
fen.geometry('+%d+%d' % (x, y))

def recoupeQ():
	'''Go through the length of the snake and update its position'''
	global x, y, snake, flag
	i = 0
	while i < len(snake):
		tmp = snake[i]
		if (tmp[0] == x) and (tmp[1] == y):
			pass
			#break
		i += 1
	if i != len(snake):
		flag = 0
		perdu()


def start(event):
	'''start the game'''
	global flag, timeout
	if flag == 2:
		flag = 1
		fen.bind('<Left>', tleft)
		fen.after(timeout, exitScore)
		fen.after(near_end_timeout,nearing_end)
		move()


def nearing_end():
	global near_endQ, text_end
	
	if state_end == 0:
		text_end = ("You're losing!")
	elif state_end == 1:
		text_end = ("You're close!")
	elif state_end == 2:
		text_end = ("You're ahead!")
	else: 
		text_end = ("  ")
	
	near_endQ = True


def draw():
	'''Handles all graphics drawing'''
	global snake, pomme, points, points_per_apple, score_mod, final_score, near_endQ
	'Clear the canvas to prevent crashes'
	can.delete(ALL)

	'Loop through length of snake and draw it'
	i = 0
	while i < len(snake):
		tmp = snake[i]
		can.create_rectangle(
			tmp[0],
			tmp[1],
			tmp[0] + tmp[2],
			tmp[1] + tmp[2],
			fill='green')
		i += 1

	#change point	 
	Label(fen, text=str((points*points_per_apple)+score_mod), width=5, height=1, font=("Courier", 30), background="black", foreground="white").grid(row=1, column=1)
	if near_endQ and text_end == ("You're losing!"):
#		Label(fen, text="Trudi", width=14, height=1).grid(row=2, column=1)
		Label(fen, text=text_end, width=14, height=1, font=("Arial", 30), background="black", foreground="red").grid(row=2, column=1)
	elif near_endQ and text_end == ("You're close!"):
		Label(fen, text=text_end, width=14, height=1, font=("Arial", 30), background="black", foreground="yellow").grid(row=2, column=1)
	else:
		Label(fen, text=text_end, width=14, height=1, font=("Arial", 30), background="black", foreground="green").grid(row=2, column=1)
	
	final_score = (points*points_per_apple)+score_mod
	
	'draw apple'
	j = 0
	while j < len(pomme):
			tmp = pomme[j]
			can.create_oval(
				pomme[j][0],
				pomme[j][1],
				pomme[j][0] +
				pomme[j][2],
				pomme[j][1] +
				pomme[j][2],
				fill='red')
			j += 1 


def move():
	'''Move the snake'''
	global snake, x, y, dx, dy, flag, points, mvmnt_bonus,score_mod,speed_mod
	x = (x + dx) % 500
	y = (y + dy) % 500

	recoupeQ()
	snake[0:0] = [[x, y, 10]]
	score_mod += mvmnt_bonus
	pommeQ()
	draw()

	# This is where speed increase happens
	if flag == 1:
		fen.after(((120-10*speed_mod) - 2 * (points / 3)), move)


def pommeQ():
	'''Update the points system and hanldes apple collision?'''
	global x, y, pomme, points, points_per_apple
	#Get the coordinates of the tail, add to snake is nessesary
	snake_tail = snake[len(snake) - 1]
	for i in range(0,len(pomme)):
		if ([True]==[x==p[i][0] and y==p[i][1] for p in [pomme]]):
			points += 1
			if i > 0:
				snake.append(snake_tail)
			del pomme[i]
			apple()
			break
		else:
			if i==0:
				del(snake[len(snake) - 1])
	
	
	#if (x == pomme[0][0]) and (y == pomme[0][1]):
	#	points += 1
	#	apple()
	#else:
	#	del(snake[len(snake) - 1])
	

def apple():
	'''Generate the placement of the apple'''
	global pomme, snake, number_of_apples

	#number of apples you would like to display
	#number_of_apples = 25
	#print len(snake) #debug only
	#Generate pomme list
	#pomme =[]
	if not pomme:
		for i in range(0,number_of_apples):
			px = randrange(50) * 10 + 1
			py = randrange(50) * 10 + 1
			pomme.append([px,py,10])
			
	flag = 0
	#Still a little confused about this loop but it works?
	while flag != 1:
		i = 0
		#This runs on start up and anytime snake comes in contact with an apple
		while i < len(pomme):
			tmp = snake[0]
			#if (tmp[0] == px) and (tmp[1] == py):
			if (tmp[0] == pomme[i][0]) and (tmp[1] == pomme[i][1]):
				#print(i)
				break
			i += 1
		if i == len(pomme):
			flag = 1
		else:
			#Exit of loop
			flag = 1

'''Bind movement keys'''
# def ttop(event):
	# global dx, dy
	# if (dx != 0) and (dy == 0):
		# dx = 0
		# dy = -10


# def tbottom(event):
	# global dx, dy
	# if (dx != 0) and (dy == 0):
		# dx = 0
		# dy = 10


def tright(event):
	global dx, dy
	if dy < 0 and dx == 0:
		dy = 0
		dx = 10
	elif dy > 0 and dx == 0:
		dy = 0
		dx = -10
	elif dx < 0 and dy == 0:
		dx = 0
		dy = -10
	elif dx > 0 and dy == 0:
		dx = 0
		dy = 10
		
def tleft(event):
	global dx, dy
	if dy > 0 and dx == 0:
		dy = 0
		dx = 10
	elif dy < 0 and dx == 0:
		dy = 0
		dx = -10
	elif dx > 0 and dy == 0:
		dx = 0
		dy = -10
	elif dx < 0 and dy == 0:
		dx = 0
		dy = 10
	

def perduQ(x, y):
	'''Reset the position of snake to allow cross screen travel'''
	if (x > 500) or (x < 0) or (y > 500) or (y < 0):
		return 1
	else:
		return 0


def perdu():
	'''Exit game'''
	exitScore()


def exitScore():
	'''Exit game'''
	global final_score
	fen.destroy()
	#print final_score
	exit(final_score)


# Constantes


# , [241, 261, 10], [241, 271, 10], [241, 281, 10], [241, 291, 10], [241, 301, 10], [241, 311, 10], [241, 321, 10], [241, 331, 10]]
snake = [[241, 241, 10], [241, 251, 10]]
x, y, dx, dy, flag, score_mod, final_score = 241, 241, 0, -10, 2, 0, 0
#timeout = 450000000  # in milliseconds, 60s = 1min
points = 0
pomme = []

#Parser out command line arguments
parser = argparse.ArgumentParser(description='Parse out the args for snake game.')
parser.add_argument('--n_apples', dest='num_apples',type=int, default=3,
					help='Enter the number of apples to appear on screen')
parser.add_argument('--ppa', dest='points_per_apple',type=int, default=1,
					help='Enter the points gained for each aplpe acquired')
parser.add_argument('--t', dest='game_time',type=int, default=40000,
					help='Enter the duration of the game (in miliseconds)')
parser.add_argument('--bonus_mvmt', dest='mvmnt_bonus',type=int, default=0,
					help='Bonus given to play for just moving')
parser.add_argument('--speed', dest='speed_mod',type=int, default=0,
					help='How fast the snake will move 1 - slower 5 - fastest ')
parser.add_argument('--state', dest='state_end',type=int, default=0,
					help='What to show in the last 10s of the game (0 = you''re losing, 1 = you''re close, 2 = you''re ahead)')


#pull the args
args = parser.parse_args()
number_of_apples = args.num_apples
points_per_apple = args.points_per_apple
timeout = args.game_time
mvmnt_bonus = args.mvmnt_bonus
speed_mod = args.speed_mod
state_end = args.state_end

# Things needed to plot text in the last 10s

#near_end_timeout = 0f
near_end_timeout = timeout - 10000
near_endQ = False
text_end = ""



'Add Score label'
Label(fen, text='Score :', width=14, height=1, font=("Courier", 24), background="black", foreground="white").grid(row=0, column=1)
Label(fen, text=str(points), width=14, height=1, font=("Courier", 24), background="black", foreground="white").grid(row=1, column=1)
#Button(fen, text = 'Jouer', width = 8, command = move).grid(row = 2, column = 1)
#Button(fen, text = 'Pause', width = 8, command = pause).grid(row = 3, column = 1)
#Button(fen, text = 'Quitter', width = 8, height = 1, command = fen.destroy).grid(row = 19, column = 1)

draw()
apple()



#fen.bind('<Down>', tbottom)
fen.bind('<Right>', tright)
fen.bind('<Left>', start)
#fen.bind('<Up>', start)
#fen.bind('<Return>', start)
fen.mainloop()

