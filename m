Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1BMLshG010586
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 17:21:54 -0500
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.29])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1BMLco5007224
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 17:21:38 -0500
Received: by yx-out-2324.google.com with SMTP id 8so218413yxm.81
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 14:21:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1234389833.8851.3.camel@geeko>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
	<1234389833.8851.3.camel@geeko>
Date: Thu, 12 Feb 2009 03:51:37 +0530
Message-ID: <3a4237470902111421q5c0ed44dyae8a9a163d51ea42@mail.gmail.com>
Subject: Re: [linux-lvm] About fstab and fsck
From: Madan Thapa <madan.feedback@gmail.com>
Content-Type: multipart/alternative; boundary=001636e1fa2cfba0710462ac06e8
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--001636e1fa2cfba0710462ac06e8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

You said you increased the size of a LV, not added a new LV. If you
added a new LV and created a filesystem on it you'd want to add it to
fstab, but if you're growing an existing LV and filesystem you
wouldn't need to change anything - the filesystem you grew would
already be listed in fstab. You did grow the filesystem too, right?
Why do you think you need to reboot?

-------------->

A new disk was added /dev/sdb , to grow existing LV on /dev/sda. So yes, no
need to change anything in fstab


[root@server ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               VolGroup00
  PV Size               698.54 GB / not usable 4.40 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              22353
  Free PE               0
  Allocated PE          22353
  PV UUID               L6igzx-qX3V-TEpR-0A6b-DXT9-eIf9-6Kl65Q

  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               VolGroup00
  PV Size               698.64 GB / not usable 10.34 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              22356
  Free PE               1556
  Allocated PE          20800
  PV UUID               7tN9mF-ZUGA-Fsdx-SU30-OHBL-gcVf-IYiDDK

[root@server ~]#



[root@server ~]# cat /etc/fstab
/dev/VolGroup00/LogVol00 /                       ext3    defaults        1 1
LABEL=/boot             /boot                   ext3    defaults        1 2
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
/dev/VolGroup00/LogVol01 swap                    swap    defaults        0 0
[root@server ~]#



[root@server ~]# fdisk -l

Disk /dev/sda: 750.1 GB, 750156374016 bytes
255 heads, 63 sectors/track, 91201 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          13      104391   83  Linux
/dev/sda2              14       91201   732467610   8e  Linux LVM

Disk /dev/sdb: 750.1 GB, 750156374016 bytes
255 heads, 63 sectors/track, 91201 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       91201   732572001   83  Linux
[root@server ~]#

( strange though ,  ID is still showing 83 for /dev/sdb1 , even when i used
8e , while formatting /dev/sdb, ) ,  i selected 83 for t during fdisk for
/dev/sdb

current status
------------------------
[root@server ~]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                      1.3T  426G  812G  35% /
/dev/sda1              99M   29M   65M  31% /boot
tmpfs                 3.9G     0  3.9G   0% /dev/shm
[root@server ~]#



old status
---------------------

[root@server ~]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                      730  670G  60G  35% /
/dev/sda1              99M   29M   65M  31% /boot
tmpfs                 3.9G     0  3.9G   0% /dev/shm
[root@server ~]#




why reboot? - > I do not intend to do so, just wanted to know.


I agree with chris (using not too large disk) ,  we do use only 250G disks (
max size) for most of our servers ( except some CDP servers),  but in this
case someone else wanted little help,  and was bent on using large disk, I
did caution him though


Thanks

--001636e1fa2cfba0710462ac06e8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br>You said you increased the size of a LV, not added a new LV. If you<br>
added a new LV and created a filesystem on it you&#39;d want to add it to<b=
r>
fstab, but if you&#39;re growing an existing LV and filesystem you<br>
wouldn&#39;t need to change anything - the filesystem you grew would<br>
already be listed in fstab. You did grow the filesystem too, right?<br>
Why do you think you need to reboot?<br><br>--------------&gt;<br><br>A new=
 disk was added  /dev/sdb , to grow existing LV on  /dev/sda. So yes, no ne=
ed to change anything in fstab<br><br><br>[root@server ~]# pvdisplay<br>
&nbsp; --- Physical volume ---<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda2<br>&nbs=
p; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; VolGroup00<br>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 698.54 GB / not u=
sable 4.40 MB<br>&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; yes (but full)<br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 32768<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 22353<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Allocated P=
E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22353<br>&nbsp; PV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; L6igzx-qX3V-TEpR-0A6b-DXT9-eIf9-6Kl65Q<br><br>&nbsp; --- Phys=
ical volume ---<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb1<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<br>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 698.64 GB / n=
ot usable 10.34 MB<br>&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; yes<br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 32768<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22356<br>&nbsp; Free PE&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 1556<br>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2=
0800<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7tN9mF-ZUGA-Fsdx-SU30-OHBL-gcVf-IYiDDK<br><=
br>[root@server ~]#<br><br><br><br>[root@server ~]# cat /etc/fstab<br>/dev/=
VolGroup00/LogVol00 /&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 1 1<br>
LABEL=3D/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; de=
faults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 2<br>tmpfs&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /dev/shm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmpfs&nbsp;&nbsp; defaults&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<br>devpts&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /dev/pts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; devpts&nbsp; gid=3D5,mode=3D620&nbsp; 0 0<br>
sysfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; sysfs&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 0 0<br>proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /proc&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; proc&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0 0<br>/dev/VolGroup00/LogVol01 swap&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; swap&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0 0<br>
[root@server ~]#<br><br><br><br>[root@server ~]# fdisk -l<br><br>Disk /dev/=
sda: 750.1 GB, 750156374016 bytes<br>255 heads, 63 sectors/track, 91201 cyl=
inders<br>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br><br>&nbsp=
;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;=
&nbsp; Id&nbsp; System<br>
/dev/sda1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 104391&nbsp;&nbsp; 83&nbsp; Linux<br>/dev/sda2&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 91201&nbsp;&nbsp; 732467610&nbsp;&nbsp=
; 8e&nbsp; Linux LVM<br><br>Disk /dev/sdb: 750.1 GB, 750156374016 bytes<br>=
255 heads, 63 sectors/track, 91201 cylinders<br>
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br><br>&nbsp;&nbsp; De=
vice Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&=
nbsp; System<br>/dev/sdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 91=
201&nbsp;&nbsp; 732572001&nbsp;&nbsp; 83&nbsp; Linux<br>[root@server ~]#<br=
><br>( strange though ,&nbsp; ID is still showing 83 for /dev/sdb1 , even w=
hen i used 8e , while formatting /dev/sdb, ) ,&nbsp; i selected 83 for t du=
ring fdisk for /dev/sdb<br>
<br>current status<br>------------------------<br>[root@server ~]# df -h<br=
>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; Size&nbsp; Used Avail Use% Mounted on<br>/dev/mapper/VolGroup00-LogVol00=
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3T&nbsp; 426G&nbs=
p; 812G&nbsp; 35% /<br>/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 99M&nbsp;&nbsp; 29M&nbsp;&nbsp; 65M&nbs=
p; 31% /boot<br>
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 3.9G&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 3.9G&nbsp;&=
nbsp; 0% /dev/shm<br>[root@server ~]# <br><br><br><br>old status<br>-------=
--------------<br><br>
[root@server ~]# df -h<br>
Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; Size&nbsp; Used Avail Use% Mounted on<br>
/dev/mapper/VolGroup00-LogVol00<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 730&nbsp; 670G&nbsp; 60=
G&nbsp; 35% /<br>
/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 99M&nbsp;&nbsp; 29M&nbsp;&nbsp; 65M&nbsp; 31% /boot<br>
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 3.9G&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 3.9G&nbsp;&=
nbsp; 0% /dev/shm<br>
[root@server ~]# <br><br><br><br><br>why reboot? - &gt; I do not intend to =
do so, just wanted to know.<br><br><br>I agree with chris (using not too la=
rge disk) ,&nbsp; we do use only 250G disks ( max size) for most of our ser=
vers ( except some CDP servers),&nbsp; but in this case someone else wanted=
 little help,&nbsp; and was bent on using large disk, I did caution him tho=
ugh<br>
<br><br>Thanks<br>

--001636e1fa2cfba0710462ac06e8--
