#!/usr/bin/python
# -*- coding: utf-8 -*-

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

# Author: Stefan Ritter <xeno@thehappy.de>
# Description: Generate music genres

from random import choice

subgroup = ["medieval", "death", "black", "hard", "progressive", "symphonic", "viking", "pagan", "gangsta", "experimental", "alternative"]
group = ["core", "metal", "pop", "punk", "country", "rap", "western"]

print(choice(subgroup), choice(subgroup) + choice(group))

# vim: set sw=4 tw=0 ts=4 expandtab:
