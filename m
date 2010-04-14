Message-ID: <4BC58DF3.608@redhat.com>
Date: Wed, 14 Apr 2010 12:42:11 +0300
From: Avi Kivity <avi@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problems resizing physical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

(resending, first try didn't seem to make it to the archives)

Due to dracut creating huge initrds, I now need a larger /boot.  So I'd 
like to reduce my lvm physical volume on the same disk in order to make 
room.

However, lvm doesn't want me to:

> lvm> pvs
>   PV         VG   Fmt  Attr PSize   PFree
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G

Seems I have enough room.

> lvm> pvresize --setphysicalvolumesize 148.54G /dev/sda2
>   /dev/sda2: cannot resize to 4753 extents as later ones are allocated.
>   0 physical volume(s) resized / 1 physical volume(s) not resized

So it seems lvm wants me to move the data around instead of doing it by 
itself.  What did I do (besides not reading the manual)?

Let's find a new home for the data:

> [root@violet-regb ~]# pvs --segments
>   PV         VG   Fmt  Attr PSize   PFree  Start SSize
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G     0   480
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G   480   192
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G   672   320
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G   992   320
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G  1312   320
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G  1632  2560
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G  4192   128
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G  4320    64
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G  4384   320
>   /dev/sda2  vg0  lvm2 a-   148.94G 10.00G  4704    62

Looks like all extents are already allocated (that's the 'a', right?). 
But it claims that 10G are free!  And sure, if I create a new volume, 
space is found at extent 4384:

> [root@violet-regb ~]# lvcreate -L 1G -n new vg0
>   Logical volume "new" created
> [root@violet-regb ~]# pvs --segments
>   PV         VG   Fmt  Attr PSize   PFree Start SSize
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G     0   480
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G   480   192
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G   672   320
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G   992   320
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G  1312   320
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G  1632  2560
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G  4192   128
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G  4320    64
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G  4384    32
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G  4416   288
>   /dev/sda2  vg0  lvm2 a-   148.94G 9.00G  4704    62

32 extents, 32MB each = 1GB.  Let's move the 62 extents at the end manually:

> [root@violet-regb ~]# lvremove vg0/new
> Do you really want to remove active logical volume new? [y/n]: y
>   Logical volume "new" successfully removed
> [root@violet-regb ~]# pvmove /dev/sda2:4704-4765 /dev/sda2:4384-4445
>   No extents available for allocation

At this point I gave up.  Is there any way to accomplish this?

-- 
error compiling committee.c: too many arguments to function
