Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i53HE1018692
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 13:14:01 -0400
Received: from smtp804.mail.sc5.yahoo.com (smtp804.mail.sc5.yahoo.com
	[66.163.168.183])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i53HDtXn030566
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 13:13:55 -0400
From: "Tim Harvey" <tharvey@alumni.calpoly.edu>
Subject: RE: [linux-lvm] Troubling activating and mounting a volume group
Date: Thu, 3 Jun 2004 10:12:48 -0700
Message-ID: <005a01c4498d$fed27bc0$7001a8c0@darwin>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <005501c44989$8c87e540$7001a8c0@darwin>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I found the answer to my question.  This has been a rather interesting
puzzle as the original NAS device was a black box and I've had to try
and figure out how they store the data.  The /dev/logdev/storage1 was
the 'log device' for the XFS filesystem in /dev/vgroup00/storage1.  I
was able to mount my filesystem using:

[root@masterbackend root]# mount -t xfs -o logdev=/dev/logdev/storage1
/dev/vgr

Success finally!

Tim

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Tim Harvey
> Sent: Thursday, June 03, 2004 9:41 AM
> To: linux-lvm@redhat.com
> Subject: RE: [linux-lvm] Troubling activating and mounting a volume
group
> 
> As I learn more about LVM, let me add some more info:
> 
> [root@masterbackend array]# more /proc/lvm/global
> LVM module LVM version 1.0.7(28/03/2003)
> 
> Total:  2 VGs  2 PVs  3 LVs (0 LVs open)
> Global: 862101 bytes malloced   IOP version: 10   10:03:51 active
> 
> VG:  vgroup00  [1 PV, 1 LV/0 open]  PE Size: 16384 KB
>   Usage [KB/PE]: 872710144 /53266 total  872710144 /53266 used  0 /0
> free
>   PV:  [AA] md0                   872710144 /53266   872710144 /53266
> 0 /0
>     LV:  [AWDL  ] storage1                 872710144 /53266    close
> 
> VG:  logdev  [1 PV, 2 LV/0 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 1536000 /375 total  565248 /138 used  970752 /237
free
>   PV:  [AA] md2                    1536000 /375       565248 /138
> 970752 /237
>     LVs: [AWDL  ] syslog                      524288 /128      close
>          [AWDL  ] storage1                     40960 /10       close
> 
> 
> [root@masterbackend root]# lvdisplay /dev/vgroup00/storage1
> --- Logical volume ---
> LV Name                /dev/vgroup00/storage1
> VG Name                vgroup00
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                832.28 GB
> Current LE             53266
> Allocated LE           53266
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:2
> 
> [root@masterbackend root]# lvdisplay /dev/logdev/storage1
> --- Logical volume ---
> LV Name                /dev/logdev/storage1
> VG Name                logdev
> LV Write Access        read/write
> LV Status              available
> LV #                   2
> # open                 0
> LV Size                40 MB
> Current LE             10
> Allocated LE           10
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:1
> 
> [root@masterbackend root]# lvdisplay /dev/logdev/syslog
> --- Logical volume ---
> LV Name                /dev/logdev/syslog
> VG Name                logdev
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                512 MB
> Current LE             128
> Allocated LE           128
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:0
> 
> I have been able to mount /dev/logdev/syslog:
> [root@masterbackend root]# mount -t xfs /dev/logdev/syslog
/mnt/syslog/
> [root@masterbackend root]# ls /mnt/array/
> initlog.txt  internal.bak  internal.txt  nfs  samba  syslog.bak
> syslog.txt
> 
> However, I cannot mount the other two XFS filesystems:
> [root@masterbackend root]# mount -t xfs /dev/logdev/storage1
> /mnt/storage1
> mount: wrong fs type, bad option, bad superblock on
> /dev/logdev/storage1,
>        or too many mounted file systems
> [root@masterbackend root]# mount -t xfs /dev/vgroup00/storage1
> /mnt/storage1
> mount: wrong fs type, bad option, bad superblock on
> /dev/vgroup00/storage1,
>        or too many mounted file systems
> 
> All three of these LVs appear to be XFS filesystems:
> 
> [root@masterbackend root]# hexdump -C -n 1024 /dev/logdev/syslog
> 00000000  58 46 53 42 00 00 10 00  00 00 00 00 00 02 00 00
> |XFSB............|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> 00000020  ac 47 30 43 a8 28 44 2f  ad 35 91 da b3 59 b3 80
> |.G0C.(D/.5...Y..|
> 00000030  00 00 00 00 00 01 00 04  00 00 00 00 00 00 00 80
> |................|
> 00000040  00 00 00 00 00 00 00 81  00 00 00 00 00 00 00 82
> |................|
> 00000050  00 00 00 10 00 00 40 00  00 00 00 08 00 00 00 00
> |......@.........|
> 00000060  00 00 04 b0 20 84 02 00  01 00 00 10 00 00 00 00  |....
> ...........|
> 00000070  00 00 00 00 00 00 00 00  0c 09 08 04 0e 00 00 19
> |................|
> 00000080  00 00 00 00 00 00 02 00  00 00 00 00 00 00 01 cb
> |................|
> 00000090  00 00 00 00 00 01 f9 b7  00 00 00 00 00 00 00 00
> |................|
> 000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> 000000b0  00 00 00 00 00 00 00 02  00 00 00 00 00 00 00 00
> |................|
> 000000c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000200  58 41 47 46 00 00 00 01  00 00 00 00 00 00 40 00
> |XAGF..........@.|
> 00000210  00 00 00 01 00 00 00 02  00 00 00 00 00 00 00 01
> |................|
> 00000220  00 00 00 01 00 00 00 00  00 00 00 00 00 00 00 03
> |................|
> 00000230  00 00 00 04 00 00 3f cd  00 00 3f 84 00 00 00 00
> |......?...?.....|
> 00000240  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000400
> 
> [root@masterbackend root]# hexdump -C -n 1024 /dev/logdev/storage1
> 00000000  fe ed ba be 00 00 00 01  00 00 00 01 00 00 00 14
> |................|
> 00000010  00 00 00 01 00 00 00 00  00 00 00 01 00 00 00 00
> |................|
> 00000020  00 00 00 00 ff ff ff ff  00 00 00 01 b0 c0 d0 d0
> |................|
> 00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000120  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 01
> |................|
> 00000130  0f ef 3b 71 68 eb 4b 0b  a4 e7 88 1c 35 8b 33 c7
> |..;qh.K.....5.3.|
> 00000140  00 00 80 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> 00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000200  00 00 00 01 00 00 00 08  aa 20 00 00 6e 55 00 00  |.........
> ..nU..|
> 00000210  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000400
> [root@masterbackend root]# hexdump -C -n 1024 /dev/vgroup00/storage1
> 00000000  58 46 53 42 00 00 10 00  00 00 00 00 0d 01 20 00
> |XFSB.......... .|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> 00000020  0f ef 3b 71 68 eb 4b 0b  a4 e7 88 1c 35 8b 33 c7
> |..;qh.K.....5.3.|
> 00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 80
> |................|
> 00000040  00 00 00 00 00 00 00 81  00 00 00 00 00 00 00 82
> |................|
> 00000050  00 00 00 10 00 10 00 00  00 00 00 d1 00 00 00 00
> |................|
> 00000060  00 00 27 10 20 d4 02 00  01 00 00 10 00 00 00 00  |..'.
> ...........|
> 00000070  00 00 00 00 00 00 00 00  0c 09 08 04 14 00 00 19
> |................|
> 00000080  00 00 00 00 00 00 01 80  00 00 00 00 00 00 01 71
> |...............q|
> 00000090  00 00 00 00 0d 01 18 67  00 00 00 00 00 00 00 00
> |.......g........|
> 000000a0  00 00 00 00 00 00 00 83  00 00 00 00 00 00 00 84
> |................|
> 000000b0  00 77 00 00 00 00 00 02  00 00 00 00 00 00 00 00
> |.w..............|
> 000000c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000200  58 41 47 46 00 00 00 01  00 00 00 00 00 10 00 00
> |XAGF............|
> 00000210  00 00 00 01 00 00 00 02  00 00 00 00 00 00 00 01
> |................|
> 00000220  00 00 00 01 00 00 00 00  00 00 00 00 00 00 00 03
> |................|
> 00000230  00 00 00 04 00 0f ff e9  00 0f fe 62 00 00 00 00
> |...........b....|
> 00000240  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000400
> 
> Any ideas?  I'm desperate to get the data off of these filesystems.
> 
> Thanks,
> 
> Tim
> 
> > -----Original Message-----
> > From: linux-lvm-bounces@redhat.com
> [mailto:linux-lvm-bounces@redhat.com]
> > On Behalf Of Tim Harvey
> > Sent: Thursday, June 03, 2004 12:16 AM
> > To: linux-lvm@redhat.com
> > Subject: [linux-lvm] Troubling activating and mounting a volume
group
> >
> > Greetings,
> >
> > I'm trying to recover data from a couple of RAID arrays that were
> > created in a system that has died.  The arrays themselves are
intact.
> >
> > I've been able to assemble the arrays and find logical volumes on
> them,
> > but I'm not sure how to activate the LG's and mount the volumes.
> >
> > I've assembled the arrays with 3 out of the 4 disks, which should be
> > enough to access the data in a RAID1/5 array if I understand things
> > correctly without allowing RAID reconstruction.  Here is some data
> from
> > my progress so far:
> >
> > [root@masterbackend root]# more /proc/mdstat
> > Personalities : [raid1] [raid5]
> > read_ahead 1024 sectors
> > md1 : active raid1 hdb2[1] hdd2[3] hdc2[2]
> >       513984 blocks [4/3] [_UUU]
> >
> > md0 : active raid5 hdb1[1] hdd1[3] hdc1[2]
> >       872738880 blocks level 5, 32k chunk, algorithm 2 [4/3] [_UUU]
> >
> > unused devices: <none>
> >
> > md0 is a RAID5 array which has a VG called 'vgroup00' and an LV
called
> > 'storage1'.  md1 is a RAID1 array which as a VG called 'logdev'.
> >
> > [root@masterbackend root]# vgdisplay -D
> > --- Volume group ---
> > VG Name               vgroup00
> > VG Access             read/write
> > VG Status             NOT available/resizable
> > VG #                  0
> > MAX LV                256
> > Cur LV                1
> > Open LV               0
> > MAX LV Size           1023.97 GB
> > Max PV                256
> > Cur PV                1
> > Act PV                1
> > VG Size               832.28 GB
> > PE Size               16 MB
> > Total PE              53266
> > Alloc PE / Size       53266 / 832.28 GB
> > Free  PE / Size       0 / 0
> > VG UUID               oizRKm-JFUq-hMiZ-rN6F-1M7u-mRDc-vqqy1p
> >
> > --- Volume group ---
> > VG Name               logdev
> > VG Access             read/write
> > VG Status             NOT available/resizable
> > VG #                  1
> > MAX LV                256
> > Cur LV                2
> > Open LV               0
> > MAX LV Size           255.99 GB
> > Max PV                256
> > Cur PV                1
> > Act PV                1
> > VG Size               1.46 GB
> > PE Size               4 MB
> > Total PE              375
> > Alloc PE / Size       138 / 552 MB
> > Free  PE / Size       237 / 948 MB
> > VG UUID               nCpyXh-5bn4-Qh2W-UlAc-3dyh-zQOT-i33ow8
> >
> > So far I'm not understanding how to make the VG Status 'available'
and
> > how to mount them.  I now have the following devices:
> >
> > /dev/vgroup00/storage1 block special (58/2)
> > /dev/vgroup00/group character special (109/0)
> > /dev/logdev/storage1 block special (58/1)
> > /dev/logdev/syslog block special (58/0)
> > /dev/logdev/group character special (109/1)
> >
> > I believe these are XFS but I still can't mount them via:
> >
> > [root@masterbackend root]# mount /dev/vgroup00/storage1 /mnt/array/
-t
> > xfs
> > mount: wrong fs type, bad option, bad superblock on
> > /dev/vgroup00/storage1,
> >        or too many mounted file systems
> >
> > Any ideas?  I'm not familiar with LVM, but have been googling it.
> >
> > Thanks for any help,
> >
> > Tim
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
