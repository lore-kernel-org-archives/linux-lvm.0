Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i18FbXa06710
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 10:37:33 -0500
Subject: Re: [linux-lvm] root on lvm2 on raid5 problem... kernel 2.6.x
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>
References: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>
Message-Id: <1076254612.20774.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb  8 10:37:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

How do you have lvm.conf set up on the initrd image? In particular, are
you filtering out the underlying devices for your RAID5 partition? I'm
not sure what that error means, but that's the only big gotcha that I
know of that you haven't already covered...
-- Jeff


On Thu, 2004-02-05 at 15:37, Weber, Geoffrey M. wrote:
> Hello all,
> 
> I've done quite a bit of research and worked on it quite a while, but I am
> having problems booting to a lvm2 on raid5 configuration.  Here are the
> details:
> 
> - RAID and ioctl v4 are compiled into the kernel (not as modules).
> - /boot is on a raid1 device /dev/md0.
> - The other partitions are on LVM2 logical volumes riding on a raid5 (3 hard
> drives) on /dev/md1.
> - If I run "cat /proc/mdstat" from the initrd then I do see both raid
> devices running properly.
> - I am running a custom initrd that I built off of an evms initrd image
> because lvmcreate_initrd didn't work.
>     -- The custom initrd works on a different machine with LVM2 but no
> raid5.
>     -- I do run the script to setup /dev/mapper/control in the initrd as a
> preliminary step.
>     -- The nodes in the /dev/mapper/ and /dev/vg_raid5 directories are setup
> exactly as it is in my "setup" partition (where I installed Knoppix to get
> everything started).
>     -- The error I get when running "lvm vgchange -ay" is:
>         device-mapper: dm-linear: Device lookup failed
> 
> In broader terms, I've tried setting up an initrd that will perform a
> "vgchange -a y" to allow the boot process to load correctly but keep getting
> errors.  RAID and LVM2 (ioctl v4) support are compiled into the kernel(s)
> (2.6.0 and 2.6.1) and mount great if I boot on my original "installation"
> parition.  From the initrd image, however, vgchange is unable to activate
> the volumes.
> 
> I also want to note that I have gotten the same initrd image to work on a
> non-raid5 setup on a different machine.  I decided to use that image because
> I couldn't get lvmcreate_initrd to work properly in either place, and it
> took me a while to get the right libraries, commands, /dev/mapper/control
> init/setup script, and /dev directory in the initrd all correct (I based it
> off of the evms initrd image).  I did change the /dev directory on each
> machine to match the configuration of that machine (e.g. /dev/vg_raid5/*),
> so there shouldn't be any worries there I hope.
> 
> Has anyone gotten a root on LVM2 on raid5 setup going?  I would appreciate
> any advice I could get...
> 
> TIA,
>     Geoff
> 
> 
> 
> NOTICE: This electronic mail transmission may contain confidential
> information and is intended only for the person(s) named.  Any use, copying
> or disclosure by any other person is strictly prohibited. If you have
> received this transmission in error, please notify the sender via e-mail.
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Jeff Layton <jtlayton@poochiereds.net>
