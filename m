Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1BFjcYR009269
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 10:45:38 -0500
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.242])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1BFjMbS029629
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 10:45:23 -0500
Received: by an-out-0708.google.com with SMTP id b2so132549ana.36
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 07:45:22 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 11 Feb 2009 21:15:21 +0530
Message-ID: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
From: Madan Thapa <madan.feedback@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd32f98d443360462a67dbe
Subject: [linux-lvm] About fstab and fsck
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
To: linux-lvm@redhat.com

--000e0cd32f98d443360462a67dbe
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I recently added a new disk ( secondary 750G) and added it into a VG  and
then increased the size of the LV.


[root@server ~]# pvdisplay | egrep 'PV Name|PV Size|VG Name'
  PV Name               /dev/sda2
  VG Name               VolGroup00
  PV Size               698.54 GB / not usable 4.40 MB
  PV Name               /dev/sdb1
  VG Name               VolGroup00
  PV Size               698.64 GB / not usable 10.34 MB



[root@server ~]# lvdisplay | egrep 'LV Name|LV Size|VG Name'
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV Size                1.32 TB
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV Size                1.94 GB
[root@server ~]#



======================


Can you please advise of the following q:

1) Do we need to change anything in  /etc/fstab or the second disk will be
automatically mounted on reboot?

current fstab is
###############
[root@server ~]# cat /etc/fstab
/dev/VolGroup00/LogVol00 /                       ext3    defaults        1 1
LABEL=/boot             /boot                   ext3    defaults        1 2
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
/dev/VolGroup00/LogVol01 swap                    swap    defaults        0 0
[root@server ~]#



2)  For 1.3 TB , fsck is going to take a long time

Is it good idea disable fsck completely on reboot and or  do scheduled
manual fsck.  Due to the nature of data , even manual fsck is not preffered
though, but with tight budget, other things are not possible

--000e0cd32f98d443360462a67dbe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br><span class=3D"HcCDpe">I recently added a new disk ( secondary 7=
50G) and added it into a VG&nbsp; and then increased the size of the LV.<br=
><br><br>[root@server ~]# pvdisplay | egrep &#39;PV Name|PV Size|VG Name&#3=
9;<br>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/sda2<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<br>=
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 698.54 GB / not usable 4.40 MB<br>&nbsp; PV Name&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /dev/sdb1<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<br>&nbsp; PV Size&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 698.64 GB / not usable 10.34 MB<br>
<br><br><br>[root@server ~]# lvdisplay | egrep &#39;LV Name|LV Size|VG Name=
&#39;<br>&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/VolGroup00/LogVol00<br>&nbsp; V=
G Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; VolGroup00<br>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.32 TB<b=
r>&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/VolGroup00/LogVol01<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<br>&nbsp; LV Size&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1=
.94 GB<br>[root@server ~]#<br><br><br><br></span>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br><br>
<span class=3D"HcCDpe">Can you please advise of the following q:<br>
<br>
1) Do we need to change anything in&nbsp; /etc/fstab or the second disk wil=
l be automatically mounted on reboot?<br><br>current fstab is <br>#########=
######<br></span><span class=3D"HcCDpe">[root@server ~]# </span><span class=
=3D"HcCDpe">cat /etc/fstab<br>
/dev/VolGroup00/LogVol00 /&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 1 1<br>LABEL=3D/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; /boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;=
&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 2<br>tmpf=
s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/shm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmpfs&nbsp;&nbsp=
; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<br>
devpts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/pts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devpts&nbsp; gid=
=3D5,mode=3D620&nbsp; 0 0<br>sysfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysfs&nbsp;&nbsp; defaults&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<br>proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proc&nbsp;&nbsp;&nbsp; defaul=
ts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<br>
/dev/VolGroup00/LogVol01 swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swap&n=
bsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<br>=
</span><span class=3D"HcCDpe">[root@server ~]#</span><br><span class=3D"HcC=
Dpe"><br><br><br>2)&nbsp; For 1.3 TB , fsck is going to take a long time<br=
>
<br>Is it good idea disable fsck completely on reboot and or&nbsp; do sched=
uled manual fsck.&nbsp; Due to the nature of data , even manual fsck is not=
 preffered though, but with tight budget, other things are not possible<br>=
<br><br>
<br><br><br><br></span>

--000e0cd32f98d443360462a67dbe--
