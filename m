Message-ID: <01be01c2ba3e$b188b3a0$0f00a8c0@COMPAQ>
From: "Sean Oh" <oh@storageone.co.kr>
References: <010901c2ba33$d3e5daf0$0f00a8c0@COMPAQ> <20030112130943.GA12078@gw.silicide.dk>
Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?
MIME-Version: 1.0
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
Date: Sun Jan 12 07:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for the replay.
Well, just doing 'lvextend' does not work for me here.
Is there any other thing that I need to look for?

This is what I do for testing the extending the snapshot volume

------------------
[root@storageone root]# df -k
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda1              5903668   1476712   4426956  26% /
/dev/vg01/lv01       567079312      2200 567077112   1% /vg01/lv01
/dev/vg01/lv01_snap0112_2159
                     567079312      2200 567077112   1%
/snap/lv01_snap0112_2159

[root@storageone root]# lvdisplay /dev/vg01/lv01_snap0112_2159
--- Logical volume ---
LV Name                /dev/vg01/lv01_snap0112_2159
VG Name                vg01
LV Write Access        read only
LV snapshot status     active destination for /dev/vg01/lv01
LV Status              available
LV #                   2
# open                 1
LV Size                540.88 GB
Current LE             8654
Allocated LE           8654
snapshot chunk size    64 KB
Allocated to snapshot  0.00% [0/127.88 MB]
Allocated to COW-table 128 KB
Allocation             next free
Read ahead sectors     1024
Block device           58:1

[root@storageone root]# dd if=/dev/zero of=/vg01/lv01/SOMEFILE bs=1024k
count=64
64+0 records in
64+0 records out

[root@storageone root]# sync

[root@storageone root]# lvdisplay /dev/vg01/lv01_snap0112_2159
--- Logical volume ---
LV Name                /dev/vg01/lv01_snap0112_2159
VG Name                vg01
LV Write Access        read only
LV snapshot status     active destination for /dev/vg01/lv01
LV Status              available
LV #                   2
# open                 1
LV Size                540.88 GB
Current LE             8654
Allocated LE           8654
snapshot chunk size    64 KB
Allocated to snapshot  50.15% [64.12 MB/127.88 MB]
Allocated to COW-table 128 KB
Allocation             next free
Read ahead sectors     1024
Block device           58:1

[root@storageone root]# lvextend -L+127M /dev/vg01/lv01_snap0112_2159
lvextend -- rounding relative size up to physical extent boundary
lvextend -- extending logical volume "/dev/vg01/lv01_snap0112_2159" to 256
MB
lvextend -- doing automatic backup of volume group "vg01"
lvextend -- logical volume "/dev/vg01/lv01_snap0112_2159" successfully
extended

[root@storageone root]# df -k
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda1              5903668   1476624   4427044  26% /
/dev/vg01/lv01       567079312     67736 567011576   1% /vg01/lv01
/dev/vg01/lv01_snap0112_2159
                     567079312      2200 567077112   1%
/snap/lv01_snap0112_2159

[root@storageone root]# umount /snap/lv01_snap0112_2159/

[root@storageone root]# mount /snap/lv01_snap0112_2159/
mount: wrong fs type, bad option, bad superblock on
/dev/vg01/lv01_snap0112_2159,
       or too many mounted file systems

[root@storageone root]# cat /etc/fstab
/dev/sda1          /                        reiserfs defaults         0  0
/dev/sda2          swap                     swap     defaults         0  0
/dev/vg01/lv01     /vg01/lv01               xfs
defaults,usrquota,grpquota,noatime 0  0
/dev/vg01/lv01_snap0112_2159 /snap/lv01_snap0112_2159 xfs
ro,nouuid,usrquota,grpquota,noatime 0  0
none               /proc                    proc     defaults         0  0
none               /dev/pts                 devpts   mode=622         0  0
-------------

The reasone that I did 'unmount' is to simulate the 'rebooting'. Because
after rebooting, I can not mount the extended snapshot anymore.

Thanks in advance



----- Original Message -----
From: <jon+lvm@silicide.dk>
To: <linux-lvm@sistina.com>
Sent: Sunday, January 12, 2003 10:09 PM
Subject: Re: [linux-lvm] [Q] LVM snapshot volume extendable?


> On Sun, Jan 12, 2003 at 09:12:07PM +0900, Sean Oh wrote:
> > Hi
> >
> > I am using LVM 1.0.6, kernel 2.4.20 and XFS (from linux-2.4-xfs CVS).
> >
> > My question is that is the snapshot volume extendable?
>
> yes, just use lvextend.
>
>
> > My environment is as follows:
> >
> > /dev/vg01/lv01 ---> XFS, 2G
> > /dev/vg01/lv01_snap --> 256M, snapshot for /dev/vg01/lv01, mounted under
> > /snap with ro,nouuid,usrquota,grpquota,noatime
> >
> > Now I have wrote a small shell scripts that if lv01_snap is more than
50%
> > full, automatically increase the lv01_snap. But it seems to me that it
does
> > not work well..
>
> I wrote one too, but rather than 50% used, i used XX MB free space.
>
>
> > What I did in the shell scripts are 'lvextend -L+256M
/dev/vg01/lv01_snap'
> > with/without 'xfs_growfs /snap'.
>
> you dont need to grow the filesystem on the snapshot.
>
>
> > After umounting the /snap and trying to remount /snap, it complaints as
> > below
>
> you dont need to unmount it
>
>
>
> A LVM snapshot works by allocating a new "PE table". This means.
> (# is allocated, - is not, and | is the end)
>
> LV: |-#################--##---#####-|
> snapshot: |---|
>
> so, you change something in the LV
>
> LV: |-#############+###--##---#####-|
> snapshot: |#--|
>
> Only the block that is actualy changed is moved to the snapshot.
> If you need alot of changes your snapshot should be big, if you dont
> change alot, you can use a much smaller snapshot.
>
>
>
>
>
> JonB
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
