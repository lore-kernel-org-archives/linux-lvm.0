Message-ID: <393653F6.2D1C57B9@twc.de>
Date: Thu, 01 Jun 2000 14:15:50 +0200
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SuSE/LVM boot problem
References: <390FD771.DB59EECB@msede.com> <20000503095326.A4439@archimedes.suse.com> <20000531110128.A22796@gruyere.muc.suse.de> <12xB7E-0izhAGC@fwd05.sul.t-online.de> <20000531181803.A30169@gruyere.muc.suse.de> <39355918.C2B6A94B@msede.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@msede.com

Michael Marxmeier wrote:
> AFAIR someone already did something similar by hacking the partition
> table  and creating an overlapping partition which just happened to
> map to the root LV.

someone == me.

It�d work if the root were the only partition but I preferred to do this
hack on /boot and /.


What do I gain?

I just refer /boot and / by the "partition aliases" in fstab and
lilo.conf and my system boots strictly conventional.

And when turning off lvm functionality becomes a must, the init.d-script
can safely switch lvm off and I�m still able to access /boot and /.

When the system crashes by eventually using wrong lvm tools, I still can
get up the essential file systems and insert the right lvm tools from
e.g. a floppy (I needed this once since 11-1999).


What do I loose?

/ and /boot appear as conventional partitions in all locations e.g. df
output. I cannot switch from partition alias to lvm addressing after the
system comes up. While not modifying the boot setup, /boot could be
mounted using the lv device, but I see no reason why this would make
sense...

Both partitions are flagged to be contiguous and <strong>I</strong> have
to remember, not to move them arround. I�d like to have a nonmoveable
flag in lvm instead...

If I�d resize or move /boot or /, I�d have to recalculate the faked
partition entries.

I have to tell the geometry of the boot drive to the kernel on booting
("append=" in lilo.conf is enough) cause the kernel guesses arround and
shows strange geometries if I do not...

As long as lvm is not launched and brought down by some kernel code like
the raid stuff, I thing this way is my favourite one...


Bye!
	Ulf.
