Message-Id: <3C2E9935.513E8F99@symbionsys.com>
From: Chris Worley <cworley@symbionsys.com>
MIME-Version: 1.0
References: <20011129164915.I1408@tykepenguin.com>
    <20011130102423.E1452@tykepenguin.com> <742840000.1007128632@tiny>
    <20011130093239.E15936@lynx.no>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Fun little horror story -- please add to FAQ if it isn't already
 documented
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
Date: Sat Dec 29 22:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

If you remove an lv, and the minor number of the removed lv is less than
the minor number of your root partition, then the vgscan during initrd
will run correctly, but assign a minor device number to the root
partition that lilo doesn't expect (and you won't be able to mount the
root partition).

This caused a few tense moments with root booting LVM this morning ;)...

With a new big hard drive in hand, I started upgrading my server.  Added
the new disk as it's own logical volume, reiser format, root initrd'd,
and copied all my other disks to it, then started upgrading to SuSE 7.3.

During the upgrade, I was running out of disk space , so I decommisioned
one of the older lv's with lvremove, then lvextended it onto the new lv,
and had reiser expand into the new space.  Quite easy and nifty; that's
what LVM's all about.

I even ran lilo before the next reboot, but it wouldn't have mattered...

Upon the next reboot, the initrd ran fine... found and activated the
lv's... but the kernel said "no root partition" and hung.  I could
rescue boot the system from the SuSE CD -- everything was there... I
finally added a "vgdisplay -v" to the initrd's linuxrc, and that showed
me the problem.

The file system it was trying to mount was, to lilo, the device "3a:03"
(major device number 58, minor 3), but, once I'd removed the old lv for
extra disk space, any new vgscan during initrd assigned my new root lv
to minor device number 2.  "root=/dev/..." doesn't help, for lvm (it
doesn't like the name).  There was no longer an lvm minor device 3 to
mount.

Once I saw the problem, I recue booted and chrooted to my new lvm, and
manually changed the minor number before running lilo.  

I'm guessing vgscan can be run on an active system to realign the minor
numbers, before running lilo, but I'm not sure... 

_BUT_, I think the faq's ought to add a little note concerning this side
effect to root booted lvm file systems to the "Removing a logical
volume" section, and save the next person some "tense moments ;)".

If this info is already there, then disregard this sugestion (I haven't
seen it, but I do tend to skim the manuals).

Chris
