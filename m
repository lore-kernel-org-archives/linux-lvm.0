Date: Sun, 2 Sep 2001 20:07:15 +0200
From: Rasmus Wiman <rasmus.wiman@sami.se>
Subject: Re: [linux-lvm] My VG is gone...
Message-Id: <20010902200715.73773199.rasmus.wiman@sami.se>
In-Reply-To: <20010831102206.A391@btconnect.com>
References: <20010831071518.07f51602.rasmus.wiman@sami.se>
	<20010831102206.A391@btconnect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Joe Thornber <thornber@btconnect.com> skrev:

> > This evening I added a 36 GB drive to our department server. I did a
> > vgextend on it and somehow it all went terribly wrong. It seems to me
> that
> > the new drive got added twice, but with different UUIDs. Of course
> there
> > is no way vgchange will bring it online. Is there a solution to the
> > problem? I downloaded LDE from <http://lde.sourceforge.net/> to have a
> > look at it, but I don't know what to alter. I run Slackware 8 with
> Kernel
> > 2.4.8 and LVM-1.0. The attached files contain output from pvdata -U -V
> -PP
> > on all three partitions.
> 
> You're right sdb1 appears to have been added twice with seperate
> UUID's.  I'm at a loss to explain this at the moment.  Did you run
> pvcreate more than once on sdb1 ? (I want to know where that extra
> uuid came from).

Well here's the full story:
I added the new disk, made a new LVM partition, ran pvcreate on it. Did a
vgextend vg1 /dev/sdb1. Rebooted. No vg:s found, Panic: root not found.
Spent a bunch of hours hackaing a Slackware 8 boot floppy with LVM 1.0
support. It found the vg. Next idea: Maybe it's because of devfs. I hacked
the disk a bit further yo use devfs, and now it didn't find the VG:s. I
started looking for any LVM list archive, found something about small
initrd:s so I put an 8 MB initrd image on the root floppy, and wow, the VG
was there. Tried to put a larger initrd on the boot partition and re-ran
lilo. Rebooted, no success. Later I realised that a initrd_size=8912k
might have done the trick. Booted from the floppy again and did a vgreduce
vg1 /dev/sdb1. Now it would boot. Here I should really have backed up
everything to a non LVM partition, but instead I did a vgextend vg1 sdb1.
Re-ran lvmcreate_initrd, re-ran lilo and rebooted. That's where I am now.
Two SDB1:s with separate UUID's. Can this be fixed or should I format and
reinstall? It would really feel bad because I've never had to format and
reinstall a Linux system except for the occasional hardware failure.


---------------------
Rasmus Wiman
SAMI Labs
