From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] Restricted partitions?
Message-ID: <20011117154632.B27459@tiger.bigcats.invalid>
References: <20011115020138.J1585@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011115020138.J1585@sonsofthunder.yi.org>; from storm@tux.org on Thu, Nov 15, 2001 at 02:01:38AM -0500
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
Date: Sat Nov 17 09:04:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Bradley!

Bradley M Alexander (storm@tux.org) wrote 50 lines:

> Are there any partitions/filesystems that should not be used without an
> initrd besides /? Here is my partition list:

> /dev/hda1                 7746      3499      3847  48% /boot

This one might be a problem.  (think: growing it, and it might
even end up on a different HD.)

> I have two 30GB
> drives, the secomd of which is empty, so I was going to put /var, /tmp,
> /home, /usr/local, /opt, /mirror and /archive on a volgroup on the second
> drive, then once it stabilized, create a second volgroup on /dev/hda from
> the partitions that are now on the volgroup on hdb.

Why 2 volumegroups, why not one that grows by appending the
(then free) space of /dev/hda?  

> I went in, using 1.0.1rc4 and kernel 2.4.13 and created the partitions on
> the volume group on hdb. Ran lilo and changed fstab. Rebooted and it could
> not mount the volumes, and gave me a "Can't locate module /dev/vg01" and
> for each partition, it tries to load them as modules. The LVM code is
> compiled into the kernel.

/dev/vg01 is your new volume group, right?  I _think_ devfs
sees it accessed and tries to load the appropriate module
(none, but it doesn't know).

> At this point, I have two prime suspects. Either one of the partitions I am
> trying to mount on the volume group should not be without an initrd (/tmp
> or /var?)

Both are on LVM here -- and if my system really needs /tmp it
can easily use /tmp -- which would be on / then ( /tmp is not mounted
then).  The only problem will be that after mounting those
you won't be able to access the files which are there, but on
the root partition.  But then mounting is a very early step
in the boot process, so that won't be a problem.

> or its a problematic interaction with devfs. 

That would be my guess.

-Wolfgang
