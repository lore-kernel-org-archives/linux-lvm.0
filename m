From: lembark@wrkhors.com
Subject: Re: [linux-lvm] LVM newbie question.
Message-ID: <6290000.1027433167@duke>
In-Reply-To: <Pine.OSF.4.33.0207231638100.7125-100000@newt.phys.unsw.edu.au>
References: <Pine.OSF.4.33.0207231638100.7125-100000@newt.phys.unsw.edu.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Tue Jul 23 09:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Have you read the FAQ?

> When I do a pvcreate on say /dev/sda1 does that destroy all the existing
> data on that partition?

Why would you run pvcreate on a non-empty partition? The
only thing you'd do after that would be creating LV's 
which will overwrite any data on the partition.

> Which is better for pvcreate to be used on a whole disk (pvcreate
> /dev/sda) and destroy all the underlying data or for me to merge all my
> existing paritions over to PV to combine in a volume group? Is there any
> advantage over either?

Depends on how many disks you have. If have only a 
single disk then you're better off w/ a root partition
and some swap outside LVM in case you have to recover
from a situation in which LVM has problems. At that 
point you can parition a disk with, say, 120MB, 64MB,
2GB, <the rest> w/ types 83, 82, 83, and 8e. This 
allows you to install the system w/ the 3rd partition
as /usr if your distribution doesn't support LVM out of
the box or use it for scratch space. If /usr is a mount
point then the root can comfortably be 128MB.

> I've read the LVM how-to and am stilll alittle confused having never done
> it in practice. One part of the how-to said converting a root system to
> LVM is not recommended. SHould your OS directories /var / /boot
> etc all not be included in the LVM? That was the main idea behind me
> implementing LVM so that specific partitions (say var) could be resized at
> a later date if needed.

If /usr is a mount point then having /boot as a separate
mount is extraneous. If the machine isn't a 7x24 server
you can probably get by with /var on LVM; for a hard-core
system having /var on a partition is useful in case LVM
fries. Make /var 320MB and use a separate /scratch partition
for building new code, &c, and the only thing you'll need
on /var is spooling and logs, which will be unlikely to 
outrun a 320MB partition.

> Will I have any trouble restoring my system (which I backed up using dd
> with a BS of 1024k) Do I have to make the LV the same size as my original
> partition were for this to work?

You cannot perform backups with dirty dump (dd). Use dump or
cpio to back the system up before touching LVM. At the 
simplest:

    find / |
    egrep -v '/(proc|tmp|cache)/' |
    cpio -ov -Hcrc --io-size=$((80*1024*1024)) --file=$TAPE 2>&1 |
    tee /var/log/backup.log;

would give a full system backup to the tape device.

For a full backup using cpio -it --io-size=$((1024*1024*80)) --file=$TAPE
to check the archive is highly recommended.

Pick up a copy of Frisch, Essential System Administration, (3rd ed,
O'Reilly Press, 2002) for recommendations on this; Nemeth, et al, 
Unix System Administrator's Handook (3rd ed) is also an excellent
read.


--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
