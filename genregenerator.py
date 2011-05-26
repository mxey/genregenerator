#!/usr/bin/python
# -*- coding: utf-8 -*-

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

# Author: Stefan Ritter <xeno@thehappy.de>
# Description: Generate music genres

from random import choice, randint

subgroup = ["medieval", "death", "black", "hard", "progressive", "symphonic", "viking", "pagan", "gangsta", "experimental", "alternative", "minimal", "dark", "synth", "future", "body", "christian", "indian", "chinese", "euro", "happy", "power", "fusion", "free", "speed", "trash", "extreme", "surf", "brit", "emo", "electronic", "neo", "noise", "psychedelic", "post", "conscious", "battle", "east coast", "west coast", "glam", "heavy", "avantgarde", "gothic", "groove", "funk", "nu", "melodic", "celtic", "industrial", "latin", "traditional", "harmonica", "dirty", "gospel", "balkan", "lounge", "Rotterdam", "sunshine", "street", "skate", "garage", "horror", "Detroit", "ghetto", "acid"]
group = ["core", "metal", "pop", "punk", "country", "rap", "western", "ambient", "techno", "house", "trance", "dance", "beat", "dubstep", "samba", "chiptune", "jazz", "ska", "soul", "aggrotech", "rave", "oi!", "bluegrass", "hip-hop", "grunge", "rockabilly", "industrial", "blues", "humppa", "reggae", "dancehall", "dub", "Schranz"]

rand = randint(0, 1)
if rand is 0: print choice(subgroup), choice(subgroup), choice(group)
if rand is 1: print choice(subgroup), choice(group)

# vim: set sw=4 tw=0 ts=4 expandtab:
