From: Micah Anderson <micah@riseup.net>
Message-ID: <20031121172915.GN10912@riseup.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Raid or backups
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
Date: Fri Nov 21 11:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am trying to decide what the best way to deal with backups on a LVM
system is.

I've got one 120gig disk that the system is riding on, 110gigs of that
is setup on a LVM partition as such:

Filesystem	  	  		1k-blocks	Used	Available Use% Mounted on
/dev/sympavg01/spool    511980    101640    410340    20% /home/sympa/spool
/dev/sympavg01/archives 27503796  15009052  12494744  55% /home/sympa/archives
/dev/sympavg01/expl    6291260   3758112   2533148    60% /home/sympa/expl

The rest is partitioned up into separate /, /boot, /tmp, /usr, /var,
and home (and swap).

I don't like a machine that is dependant on one disk any more than the
next guy, so I put another 120gig disk in the machine, thinking I
would raid the two together. After reading months of list archives, I
am seeing that building a raid array on the system at this point is
not going to be straightforward, especially since the machine is in
production. It seems the best method for doing this would be to build
up md raid devices, layer LVM on top of the md's and then create
filesystems, this isn't easy if you already have things up and running
(although I am interested to hear if people have done this, and if so,
how).

In addtion, I feel as if backup up the system is a higher priority
than having disk redundancy (mirrored corrupt data is worse for my
situation than a disk failure and recovery time).

It is simple for me to take a disk backup of the non LVM partitions (I
use StoreBackup), but I am somewhat puzzled about the best direction
to go with the LVM volumes. Should I back them up just like any other
partition and not let the LVM bother me? What about the LVM metadata
and if I needed to restore from this backup?

Would taking snapshots be more advisable? The data in these partitions
changes fairly raipidly. If I were to do snapshots, does it make sense
to make the snapshot onto my backup disk (hdc) and then back up that
snapshot onto the backup disk (hdc again), and then destroy the
snapshot? Or is it a waste to snapshot to a different disk entirely,
should I instead keep the snapshot to the same volume it is on? Or
does it not matter at all because snapshots don't actually do much
disk work until you start accessing the data?

Thanks for any insights!
micah
