Message-Id: <37BD9B5B.A1247F83@mainland.ab.ca>
Date: Fri, 20 Aug 1999 12:15:55 -0600
From: Drew Smith <drew@winterland.mainland.ab.ca>
Mime-Version: 1.0
Subject: [linux-lvm] LVM and Debian
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


	Hello, all.

	Just joined in on the list - of course, to show proper etiquette, I
read the archives first, to catch up on the topics discussed.  Something
I didn't see, however, were comments on the stablility of the LVM code
under Debian Potato.

	Some background - I'm an AIX guy, working for a consulting company that
specializes in storage management.  Wow, that sound WAY less fun than it
actually is - basically, I'm a 23-year-old, fifth-year linux geek who
managed to land a job doing unix-ish things.

	Some more background - in our house, we're running just under 200G of
disk - the shoutcast "BeNOW" (http://www.benow.org) is running in the
server room, right off my bedroom.  I'm not the originator of it, but
I'm a full partner and am the administrator of the servers it runs on.

	And even more - we have friends, here in Calgary, that have the
reclaimant contracts on used gear.  Basically, they pick up truckloads
of Unix hardware from large corporations, give them tax credits, and
sell it all off.  They've got exclusive contracts with a lot of places,
so they're an incredible resource.  They're not out to turn a profit,
just make a living - so incredible deals.
	The deal I'm referring mostly to is the "9G fullheight Seagate SCSI
drive, 1M cache, 5500 RPM, 9ms access" for $50 CAD.  We bought eight. 
LVM comes into play here.

	So I did manage to get 0.7 to compile happily under Debian - using
2.2.10-ac12.  This was difficult, and I've discovered why - either
Debian or LVM isn't properly referencing where the includes are stored. 
My fix was:

	cd /root/LVM/0.7/tools
	ln -s /usr/src/linux/includes/linux linux
	make

	This worked.

	I plugged in four of the 9G drives - would have been eight, but I blew
one of the two power supplies in the "cube" (a four-beside-four
fullheight enclosure) when I didn't set the drives to delayed powerup. 
I created a 33G volume group called "rootvg" (sue me, I learned LVM on
AIX) and created a 33G lv called lv01 inside that.

	My problems begin here - it worked happily!  I shared it out to the
others via Samba, and they happily drug and dropped mass quantities of
.MP3's to it.  After a while, it crashed.

	I'm sort of hypothesizing that it crashed as it hit the end of the
first drive - I'm only doing a linear setup, no stripes.  Roughly at the
time that it WOULD have hit 9G, it locked the system solid, requiring a
power-down.  Unfortunately, the machine doesn't have a head most of the
time, so no errors were noted.

	Since then, I've compiled 2.2.11-ac3, and have been working on getting
the same setup running again - with one exception.  I tried to put a
fifth drive in the machine, INSIDE the actual desktop case - and it
seems I don't own a single 50-pin ribbon cable that is clean enough to
avoid timeouts.  At 2am, I powered it off and left it for my bed - had
to be up at 6 for work.

	To give a long story another paragraph, I'll be continuing the struggle
tonight. Has anyone had any problems with stability under Debian, and/or
tracked down what those might stem from?  I'm running the machine now
with it's own monitor (a rarity in the server room - nearing 20 machines
now) and keyboard, constantly keeping an eye on it.  I'll be setting it
up again tonight with the same setup, 33G, but most likely striped.

	Looking through the list, I don't see many people detailing what they
ARE doing with LVM, just what they CAN'T do, and asking for help.  I
apologize if I've offended anyone with the length of this post - but
this is what I like to read, and I'd love to see what other people are
doing with this software.  If it's to be included in kernel 2.4, we'd
damn well better push it to it's limits! :)

	Cheers,
	- Drew.
