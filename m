From: Frank Van Damme <frank.vandamme@student.kuleuven.ac.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200210131526.48573.frank.vandamme@student.kuleuven.ac.be>
Subject: [linux-lvm] [newbie] name changes in physial volumes
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Oct 13 08:31:15 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I'm experimenting with lvm on a small (40 GB) home system, and I wish to know 
the following: suppose you have a lot of partitions in a volume group, and 
suppose besides this, there is also a windows partition. Suppose that the 
windows partition needs more space for some reason, so you make one of the 
logical volumes smaller and you remove the physical volume (the lvm partition 
next to the windows partition) to increase the size of the windows partition 
(with parted eg). That means there will be 1 less partition on that disk, 
hance, their names will change (hda8 becomes hda7 and so on). 

What happens to the lvm setup? It will be confused because it won't find the 
PV's where they were supposed to be. Will the kernel panic, will you simply 
lose all the data, or will lvm figure it out for itself? 

P.S. please CC me!

-- 
Frank Van Damme
homepage:       www.student.kuleuven.ac.be/~m9917684
jabber (=IM):   yalu@jabber.com
