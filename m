Message-Id: <200401290444.i0T4iVX02132@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040129022341.88184.qmail@web80402.mail.yahoo.com> (message
	from Chris Conn on Wed, 28 Jan 2004 18:23:41 -0800 (PST))
Subject: Re: [linux-lvm] combining two vg's into one
References: <20040129022341.88184.qmail@web80402.mail.yahoo.com>
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
Date: Wed Jan 28 23:38:02 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Chris Conn wrote:

>I've got 2 vg's on two different partitions on
>different disks, one is my root vg and the other
>has /usr, /var and /tmp filesystems. I'd like to
>keep them on separate disks but use the same vg
>if I can, but I'm unsure how to combine them.

To keep / on one disk and /usr, /var and /tmp on another
disk, one volume group per disk as described above is the
best way to do this.  There is no advantage to combining
the two volume groups together given that one wants to
keep logical volumes exclusively on one disk or the other.

Combining the two volume groups into one volume group
would allow logical volumes to span the two disks and
lvm striping, but that is contrary to the desire to keep
each logical volume exclusively on a particular disk.

>Do I have to move the lv's on disk2 out of their vg
>or can I just expand the vg on disk1 to include
>them? The filesystems are all ReiserFS, system
>is Slackware Linux 9.1.

Logical volumes can't be moved between volume groups.

If the physical extents of two volume groups are the
same and the limits of the destination group are not
exceeded, the two volume groups can be merged using
vgmerge(8).  Go to step 9 below.

To join two volume groups with unequal logical extents:

1) Back up all logical volumes.
2) Remove all logical volumes in one volume group,
   preferably the volume group NOT containing /,
   using lvremove(8).
3) Remove all physical volumes from the volume
   group to be removed using vgreduce(8).
4) Finally remove that volume group using vgremove(8).
5) Add all physical volumes that were in the removed
   volume group into the remaining volume group using
   vgextend(8)
6) Within the remaining volume group, create all logical
   volumes removed in step 2 using lvcreate(8)
7) Create the desired filesystems for each logical
   volume created in step 6.
8) Restore from backup each filesystem created in
   step 7.
9) Modify /etc/fstab and any other configuration files
   to reflect the volume group name change in the
   "moved" (removed/recreated) volumes.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
