From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Converting existing partitions/disks to LVM?
Message-ID: <20030503114008.GA541@guldukat>
References: <20030502145325.418.h006.c000.wm@mail.stanger.com.criticalpath.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030502145325.418.h006.c000.wm@mail.stanger.com.criticalpath.net>
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
Date: Sat May  3 05:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 02.05.03, jan@stanger.com wrote:

> Q1: Now I want to add another data disk to my system
> and would like both, that new disk and my existing 120G
> disk to be logically combined so that they appear as
> only one disk. I understand that this is where LVM
> comes into play. Can I convert my existing, full 120G
> drive to be using LVM in conjunction with the new
> drive, or will I have to reformat/repartition it first?

You can do the following:

0. Make a backup of your data! (you should have this anyway (-: )

1. Install new harddisk, create one big partition for lvm (type 8e).

2. Create a physical lvm volume (with pvcreate) on the partition.

3. Create a volume group with that pv (vgcreate)

4. Create logical volumes (lvcreate) and copy the data from your old disk
onto the volumes. Also, make sure to add lvm stuff (like vgscan, vgchange)
to your boot scripts and edit fstab.

5. Wipe old disk, create one lvm partition, pvcreate it

6. Add old disk to volume group via vgextend.

7. Expand your logical volumes. The lvs are now distributed over both disks.
Important: if one drive goes bad you loose _all_ you data.
You might want to use 'e2fsadm' which expands your lv and also extends the
filesystem on it. 

As it is not trivial to do all this with a running system so i suggest you use
a rescue cd that has lvm support. I use Knoppix for those things.
(http://www.knopper.net/knoppix/index-en.html)

> Q2: I am afraid to convert my root fs on /dev/hda to
> LVM, so that currently is out of the question. But can
> I resize my 40G hdd, say, to only have 20G for the
> Linux installation, and combine the remaining 20G
> together with the two data disks to one single logical
> volume?

Knoppix (see above) also contains GNU parted which is able to resize ext2
partitions. If lilo gives you trouble after resizing, boot into Knoppix,
mount root fs, chroot to root fs and then call lilo.

> Thanks
> Jan

hope that helps,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
