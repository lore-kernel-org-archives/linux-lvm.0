From: jon@kollegiegaarden.dk
Subject: Re: [linux-lvm] Raid or backups
Message-ID: <20031121210831.GA664@kollegiegaarden.dk>
References: <20031121172915.GN10912@riseup.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031121172915.GN10912@riseup.net>
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
Date: Fri Nov 21 15:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 21, 2003 at 11:29:15AM -0600, Micah Anderson wrote:
> I am trying to decide what the best way to deal with backups on a LVM
> system is.

backup like any other system.


[cut]

> I don't like a machine that is dependant on one disk any more than the
> next guy, so I put another 120gig disk in the machine, thinking I
> would raid the two together. After reading months of list archives, I
> am seeing that building a raid array on the system at this point is
> not going to be straightforward, especially since the machine is in
> production. It seems the best method for doing this would be to build
> up md raid devices, layer LVM on top of the md's and then create
> filesystems, this isn't easy if you already have things up and running
> (although I am interested to hear if people have done this, and if so,
> how).

it is very easy, i do it all the time because the debian woody
installer doesnt support a raided install.
Read the software raid howto.
Then read the LVM howto.
Particular:
http://www.tldp.org/HOWTO/Software-RAID-HOWTO-4.html#ss4.4
http://www.tldp.org/HOWTO/Software-RAID-HOWTO-4.html#ss4.10
http://www.tldp.org/HOWTO/Software-RAID-HOWTO-4.html#ss4.11
http://www.tldp.org/HOWTO/Software-RAID-HOWTO-4.html#ss4.12
use method 2
Mark it failed
After this, you either spend time doing this 
	find . -xdev | cpio -pm /mnt/newroot
which is a waste of time, since this is a LVM system

http://tldp.org/HOWTO/LVM-HOWTO/x546.html
http://tldp.org/HOWTO/LVM-HOWTO/x662.html
http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html


So really, it is not a problem. If you want to, you can catch me
at irc.oftc.net at #vserver, and i'll walk you through it.


> In addtion, I feel as if backup up the system is a higher priority
> than having disk redundancy (mirrored corrupt data is worse for my
> situation than a disk failure and recovery time).

do both, both mirror and backup.


> It is simple for me to take a disk backup of the non LVM partitions (I
> use StoreBackup), but I am somewhat puzzled about the best direction
> to go with the LVM volumes. Should I back them up just like any other
> partition and not let the LVM bother me? What about the LVM metadata
> and if I needed to restore from this backup?

I would either take filesystem backup, or the partition containing the LVM
system. But... setting up a LVM system does not take long, so just do the
filesystem on file level, not blocklevel.


> Would taking snapshots be more advisable? The data in these partitions
> changes fairly raipidly. If I were to do snapshots, does it make sense
> to make the snapshot onto my backup disk (hdc) and then back up that
> snapshot onto the backup disk (hdc again), and then destroy the
> snapshot? Or is it a waste to snapshot to a different disk entirely,
> should I instead keep the snapshot to the same volume it is on? Or
> does it not matter at all because snapshots don't actually do much
> disk work until you start accessing the data?

Snapshots MIGHT degrade your performance, but they are good if
you run a database, then you can shut it down, take a snapshot
and start it up again.




JonB
