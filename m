Message-ID: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>
From: "Weber, Geoffrey M." <Geoffrey.Weber@mcleodusa.com>
MIME-Version: 1.0
Subject: [linux-lvm] root on lvm2 on raid5 problem... kernel 2.6.x
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
Date: Thu Feb  5 15:40:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello all,

I've done quite a bit of research and worked on it quite a while, but I am
having problems booting to a lvm2 on raid5 configuration.  Here are the
details:

- RAID and ioctl v4 are compiled into the kernel (not as modules).
- /boot is on a raid1 device /dev/md0.
- The other partitions are on LVM2 logical volumes riding on a raid5 (3 hard
drives) on /dev/md1.
- If I run "cat /proc/mdstat" from the initrd then I do see both raid
devices running properly.
- I am running a custom initrd that I built off of an evms initrd image
because lvmcreate_initrd didn't work.
    -- The custom initrd works on a different machine with LVM2 but no
raid5.
    -- I do run the script to setup /dev/mapper/control in the initrd as a
preliminary step.
    -- The nodes in the /dev/mapper/ and /dev/vg_raid5 directories are setup
exactly as it is in my "setup" partition (where I installed Knoppix to get
everything started).
    -- The error I get when running "lvm vgchange -ay" is:
        device-mapper: dm-linear: Device lookup failed

In broader terms, I've tried setting up an initrd that will perform a
"vgchange -a y" to allow the boot process to load correctly but keep getting
errors.  RAID and LVM2 (ioctl v4) support are compiled into the kernel(s)
(2.6.0 and 2.6.1) and mount great if I boot on my original "installation"
parition.  From the initrd image, however, vgchange is unable to activate
the volumes.

I also want to note that I have gotten the same initrd image to work on a
non-raid5 setup on a different machine.  I decided to use that image because
I couldn't get lvmcreate_initrd to work properly in either place, and it
took me a while to get the right libraries, commands, /dev/mapper/control
init/setup script, and /dev directory in the initrd all correct (I based it
off of the evms initrd image).  I did change the /dev directory on each
machine to match the configuration of that machine (e.g. /dev/vg_raid5/*),
so there shouldn't be any worries there I hope.

Has anyone gotten a root on LVM2 on raid5 setup going?  I would appreciate
any advice I could get...

TIA,
    Geoff



NOTICE: This electronic mail transmission may contain confidential
information and is intended only for the person(s) named.  Any use, copying
or disclosure by any other person is strictly prohibited. If you have
received this transmission in error, please notify the sender via e-mail.
