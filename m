Subject: [linux-lvm] Striping and Partition Preference.
Message-Id: <20000425070159.D0B361F473@chronozon.dyndns.org>
Date: Tue, 25 Apr 2000 02:01:59 -0500 (CDT)
From: Stef telford <stef@chronozon.dyndns.org>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Hello, 
	First let me jst say that the lvm stuff works great
as of pre6-5. No problems (well, okay jst one but I will get
to that). Using reiserfs on top and it makes SUCH a difference
to bootup times (e2fsck on 17Gig partition was jst _hideous_ ;)

	Now, here is the small 'problem' for your consideration.
I have about 6 partitions on the 20Gig drives i have here at
home (two of them, both Quantum, same make, same batch etc etc).
i have converted across most of my filesystems to using both of
the disks striped (lvcreate -i 2 -I 32 or 64) but i hit a small
prblem last night that i think (read :think: ) is in the algorithm
that choses what partitions to stripe across. 

	In the volume group there is about 17 gig free, across
6 partitions. The smallest amount of 'PE's available on one of
the partitions is 160M (total), the others have about 2-4 Gig
each. The problem arises in that I can not create a new 'lv'
which is over 300M in space and which is striped. This makes 
some sense (in that i assume it is checking the smallest free
'PE' on any 'Physical Volume' (PV) and as such isnt letting
me stripe, but i _do_ have enough on the _other_ PV's to do 
this by a sizeable factor.
	
	Does any of this make sense ? forgive the english but
its rather late and the coffee supply has run out (no jolt :'(

	Regards.
	Stefs
