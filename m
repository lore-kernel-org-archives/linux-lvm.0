From: "kanika nema" <kanikanema@hotmail.com>
Subject: Re: [linux-lvm] restoring filesystem state using snapshot
Mime-Version: 1.0
Message-ID: <BAY9-F29a0uszn8fsXW0001a51a@hotmail.com>
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
Date: Fri Jan  9 13:19:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi,

i was having some problems installing lvm.

1. when i try to change the partition type using fdisk, i get a msg sayin
"No partition created yet!"

i have a 3gb hdd, with 3 partitions
hdb1  --- ext2
hdb5 --- swap
hdb6 --- ext2 ( abt 800mb)

2. so, then i did vgscan, followed by pvcreate on hdb6 without changing the 
partition type.
After this i got a file system error, and linux crashed.

Then i created a new partition for lvm
1. i added this partion by using 'n' command of fdisk.
2. then set the type of this partition to 8E.

A partition hdb3 of linux lvm type was created (along with hdb1,hdb5,hdb6).

3. i ran a vgscan,
4. then did pvcreate as follows
$pvcreate /dev/hdb3

It gave me a msg saying "Cannot read partition to to find 
PhysicalVolumeSize"

I have read all the How-tos i cud,but still not helpful.
Pls tell me what shud i do.

i will try rsync....once i install lvm.

regards,
K

>From: Cameron Hutchison <camh@xdna.net>
>Reply-To: linux-lvm@sistina.com
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] restoring filesystem state using snapshot
>Date: Fri, 9 Jan 2004 10:31:18 +1100
>
>Once upon a time Ken Fuchs said...
> >
> > >i want to restore the filesystem state using only the snapshot taken by 
>LVM
> > >ie without taking a full backup.
> >
> > Will copying the contents of the snapshot over the original logical
> > volume do what you want?  If so, this can be done as follows:
> >
> > # mount /dev/vg/snapshot /snap
> > # mount /dev/vg/original /orig
> > # (cd /snap; tar cf - .) | (cd /orig; tar xvf -)
>
>rsync would probably be a better option - it will copy far less and will
>remove any files added after the snapshot was taken (if invoked
>appropriately). /orig should end up as a replica of /snap.
>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_________________________________________________________________
Feeling like a vacation? Then you are in the right place. 
http://www.msn.co.in/Travel/ Get the best travel deals here!
