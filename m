Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Ellis Whitehead" <silleliam@ellisw.net>
Message-Id: <20030523003626.18233.h022.c007.wm@mail.ellisw.net.criticalpath.net>
Subject: [linux-lvm] vgscan -f created duplicate block devices
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
Date: Fri May 23 02:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hallo,

How do you fix an incorrect Block Device assignment?

When I hooked the harddrive from an old computer into my newer one (both had lvm
partitions), I got the message that certain IDs were duplicated.  So I ran vgscan
-f to assign new IDs.  However, vgscan -f duplicated the Block Device on two of
the logical volumes.  The has the outcome that when I mount the first one, I only
get access to the second one. :(

I would show the output of lvdisplay & friends, but I can't get an internet
connection from that computer anymore because of this. *grin*  Basically:

/dev/toro1/home, block device 58:5
/dev/toro1/var, block device 58:6
/dev/toro1/projekte, block device 58:7
/dev/toro1/usr, block device 58:8
/dev/toro1/local, block device 58:9
/dev/toro1/fileserver, block device 58:5

Either the drive I added had 5 lv's and so vgscan didn't reassign the 6th on the
first drive (i.e., /dev/toro1/fileserver), or it cycled back around after 58:9
for some reason.

Can anyone tell me how to get my home back??? *grin*

Many thanks in advance!
Ellis Whitehead
