Message-ID: <3F98B691.7090902@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Drive gone bad, now what?
References: <20031021171817.GA28462@mail.parplies.de>	<3F985B2D.5060008@xs4all.nl> <16280.27367.874758.610758@gargle.gargle.HOWL>
In-Reply-To: <16280.27367.874758.610758@gargle.gargle.HOWL>
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
Date: Fri Oct 24 00:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

John Stoffel wrote:

Gert> We've setup a simple server machine with a bunch of harddisks of
Gert> 60 and 80 Gb.

John> Did you just concatentate or stripe the data across all the drives?

Butting in, I would assume (dangerous, I know) concatenation and 
non-striped since that is the default LVM mode when creating LVs. This 
is the exact same setup I have, BTW.

John> If you had just a simple concatenation of all the disks, then you are
John> toast.  How do you expect LVM to restore the missing 60gb if there's
John> no parity information or mirrored blocks?  It's impossible!

Yes, but he can restore the LV (sans the missing 60 gigs, of course) and 
access the rest of the archive. I believe that's what he's after.

Gert> For now we let the system rest until lvm2 matures and maybe the
Gert> tools will be there to rescue this set of disks

The tools are already here. I did the same thing a while back. But it 
ain't always easy. :-)

Go back to LVM1. Then, find another disk with the _exact same size_ as 
the deceased disk. Plug it in and pvcreate it (unless the old one had a 
LVM partition, in which case you fdisk and create a LVM partition on the 
new one):
# pvcreate -ff /dev/ide/host0/bus1/target0/lun0/disc

Restore your metadata to the new, empty disk, so LVM can restore the LV:
# vgcfgrestore -n YourVGName /dev/ide/host0/bus1/target0/lun0/disc
# vgscan
# vgchange -ay
# reiserfsck --rebuild-tree /dev/YourVGName
# mount /dev/YourVGName

There are a number of pitfalls along the way (not finding a disk of the 
same size is probably #1, but there is a way. If you can't find one, 
pvcreate a larger disk with -s. Use vgcfgrestore -ll to list the VG 
metadata stored in the backup, including the exact size of the dead PV.) 
but this is the basic layout. Heinz was kind enough to walk me through 
this when I had problems so now I feel like an expert. ;-)

Gert> LVM seemed an easy way to expand when needed..

It is. It's also the primary reason I use it instead of RAID. However, 
if there's money behind the archive (in my case, there isn't) you can go 
for a hardware RAID solution that offers the ability to grow the RAID. 
You will still need a bunch of same-size disks, but I could live with 
that, maybe you could too.

You can also combine RAID and LVM in various ways in an attempt to 
minimize the need for spare disks and maximize the size of useable 
space. Perhaps one RAID-5 array of one size disks and use LVM to 
concatenate it with another RAID-5 set of differently-sized disks. You 
can use NFS or Coda to glue two or more file servers together over the 
network if you run out of physical space in one of the machines.

John> You've basically hit upon the basic tradeoffs here, though you're
John> missing a performance issue, in that you should really try to keep
John> just one drive per IDE channel if at all possible from a performance
John> point of view.

If he's doing the same trade-offs I am, he values size over performance 
(which is 'good enough' for many uses even with shared IDE channels).

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
