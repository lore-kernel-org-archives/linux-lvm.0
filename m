Date: Thu, 6 Sep 2001 12:45:31 -0400 (EDT)
From: Rob Foehl <rwf@loonybin.net>
Message-ID: <Pine.LNX.4.33.0109061240350.10967-100000@jupiter.loonybin.net>
MIME-Version: 1.0
Subject: [linux-lvm] disk swap
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have a few questions, perhaps someone can help me out with this..

First, I have a drive set up with LVM right now that has a couple holes in
it and is getting replaced.. I have the replacement drive, but I'm not
sure what the best way to swap it in will be.. Old drive still boots, the
affected LV has already been moved to a spare drive in the box..

Secondly, the existing drive is currently partitioned with swap space and
an LVM partition, and a boot partition on the spare drive holding the
kernel and initrd.. is there any way (with the lilo boot-from-lvm patches,
I'm assuming) to clean this up a bit, preferably getting everything inside
a single lvm partition on the main drive? (the one being replaced).. I'm
assuming its possible to put swap on LVM, I may be wrong.. The boot
partition, on the other hand, I'm totally unsure on whether or not I can
do away with it.. I figure now would be the best time since I'm swapping
drives anyway, it would be really easy to redo the partition setup on the
new drive before they're swapped..

Any insight / suggestions / assistance is greatly appreciated..

-Rob
