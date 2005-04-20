Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3KHJOO22668
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2005 13:19:24 -0400
Received: from imo-m18.mx.aol.com (imo-m18.mx.aol.com [64.12.138.208])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3KHJOVV021388
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2005 13:19:24 -0400
Received: from Infoteq@aol.com
	by imo-m18.mx.aol.com (mail_out_v38.7.) id e.1d4.3a6991e2 (4418)
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2005 13:19:05 -0400 (EDT)
From: Infoteq@aol.com
Message-ID: <1d4.3a6991e2.2f97e909@aol.com>
Date: Wed, 20 Apr 2005 13:19:05 EDT
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="-----------------------------1114017545"
Subject: [linux-lvm] Problems with df and lvm
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


-------------------------------1114017545
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I just installed FC3 on a brand new 80gb hard drive. Up until this point I 
have been using Redhat 7.3, so this whole thing with LVM is pretty new to me.

I had the drive partitioned into three parts (on top of the boot and swap 
partition):

/ 20gb
/dstar 10gb
/home 45gb

However, when I use df, I get this:

dracon:/home/infoteq# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                      20158332   5611396  13522936  30% /

When I use lvdsiplay, I get this:

dracon:/home/infoteq# lvdisplay
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                Ud4qo5-Ysba-HETb-mm0u-ntvi-oEI0-kzreZ7
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                19.53 GB
  Current LE             625
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
   
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol02
  VG Name                VolGroup00
  LV UUID                d2CYD9-8fOX-fVd5-VFdF-7kuL-7P7U-Ed9ERM
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                9.78 GB
  Current LE             313
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
   
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol03
  VG Name                VolGroup00
  LV UUID                7rHvJC-5SNh-HO7I-acKM-3n0B-teFy-XlVZMa
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                44.06 GB
  Current LE             1410
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2
   
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                AZ0FwK-KL1j-CAPS-emtT-3Uzt-Xlhi-I3t127
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             32
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3

My fstab shows this:

/dev/VolGroup00/LogVol00 /                       ext3    defaults        1 1
LABEL=/boot             /boot                   ext3    defaults        1 2
none                    /dev/pts                devpts  gid=5,mode=620  0 0
none                    /dev/shm                tmpfs   defaults        0 0
/dev/VolGroup00/LogVol02 /dstar                  ext3    defaults        1 2
/dev/VolGroup00/LogVol03 /home                   ext3    defaults        1 2
none                    /proc                   proc    defaults        0 0
none                    /sys                    sysfs   defaults        0 0
/dev/VolGroup00/LogVol01 swap                    swap    defaults        0 0

So the drives are there, and I have put data on them, but for some reason, it 
won't display it on df. I've looked all over for some sort of clue as to why 
this happened, but have come up empty handed.

Is there some way to fix df so that it will display the information 
correctly? If not, is there some way I can avoid causing this problem in the future?

Thanks for your time,

-Jay

-------------------------------1114017545
Content-Type: text/html; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META charset=3DUS-ASCII http-equiv=3DContent-Type content=3D"text/html; cha=
rset=3DUS-ASCII">
<META content=3D"MSHTML 6.00.2800.1498" name=3DGENERATOR></HEAD>
<BODY style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; BACKGROUND-COLOR: #fffff=
f">
<DIV><FONT face=3D"Courier New">I just installed FC3 on a brand new 80gb har=
d drive. Up until this point I have been using Redhat 7.3, so this whole thi=
ng with LVM is pretty new to me.</FONT></DIV>

<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">I had the drive partitioned into three parts=
 (on top of the boot and swap partition):</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>/&nbsp;20gb<BR>/dstar&nbsp;10gb<BR>/home&nbsp;45gb</DIV>
<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">However, when I use df, I get this:</FONT></=
DIV>
<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">dracon:/home/infoteq# df</FONT></DIV>
<DIV><FONT face=3D"Courier New">Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 1K-blocks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Used Avai=
lable Use% Mounted on<BR>/dev/mapper/VolGroup00-LogVol00<BR>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20158332&nbsp;&nbsp; 5611396&nbsp; 135229=
36&nbsp; 30% /<BR></FONT></DIV>
<DIV><FONT face=3D"Courier New">When I use lvdsiplay, I get this:</FONT></DI=
V>
<DIV><FONT face=3D"Courier New"><FONT face=3DArial></FONT>&nbsp;</DIV></FONT=
>
<DIV><FONT face=3D"Courier New">dracon:/home/infoteq# lvdisplay<BR>&nbsp; --=
- Logical volume ---<BR>&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/VolGroup00/LogVol0=
0<BR>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<BR>&nbsp; LV UUID&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 Ud4qo5-Ysba-HETb-mm0u-ntvi-oEI0-kzreZ7<BR>&nbsp; LV Write Access&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV Status&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<B=
R>&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19.53=20=
GB<BR>&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 625<BR>&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>&nbsp; Allocation&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inheri=
t<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; Block dev=
ice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:0<BR>&nb=
sp;&nbsp; <BR>&nbsp; --- Logical volume ---<BR>&nbsp; LV Name&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20=
/dev/VolGroup00/LogVol02<BR>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<BR>&nbsp=
; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; d2CYD9-8fOX-fVd5-VFdF-7kuL-7P7U-Ed9ERM<BR>&nbsp; LV=20=
Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp;=20=
LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; available<BR>&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; LV Si=
ze&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 9.78 GB<BR>&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 313<BR>&nbsp; Segments&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<B=
R>&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp;=
 0<BR>&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 253:1<BR>&nbsp;&nbsp; <BR>&nbsp; --- Logical volume ---<BR>&nbsp;=20=
LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /dev/VolGroup00/LogVol03<BR>&nbsp; VG Name&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; VolGroup00<BR>&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7rHvJC-5SNh-HO7I-acKM-3n0B-teF=
y-XlVZMa<BR>&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 read/write<BR>&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>&nbsp; # open&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0<BR>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 44.06 GB<BR>&nbsp; Current LE&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1410<BR>&nb=
sp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 1<BR>&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>&nbsp; Read ahead sectors=
&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:2<BR>&nbsp;&nbsp; <BR>&nbsp; --- Logic=
al volume ---<BR>&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/VolGroup00/LogVol01<BR>&n=
bsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<BR>&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AZ0FwK=
-KL1j-CAPS-emtT-3Uzt-Xlhi-I3t127<BR>&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>&nbsp=
; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.00 GB<BR>&n=
bsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 32<BR>&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>&nbsp; Allocation&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>&nbs=
p; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>&nbsp; Block device&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:3<BR></FONT></DIV=
>
<DIV><FONT face=3D"Courier New">My fstab shows this:</FONT></DIV>
<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">/dev/VolGroup00/LogVol00 /&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 1<BR>LABEL=3D/boot&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /boot&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 1 2<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/pts&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; devpts&nbsp; gid=3D5,mode=3D620&nbsp; 0 0<BR>none&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /dev/shm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmpfs&nbsp;&nbsp; defaults&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<BR>/dev/VolGroup00/LogVol02 /dsta=
r&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1 2<BR>/dev/VolGroup00/LogVol03 /home&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 1 2<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /proc&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proc&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<BR>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /sys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysfs&nbsp;&nbsp; defaults&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0<BR>/dev/VolGroup00/LogVol01 swap&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swap&nbsp;&nbsp;&nbsp; defaults&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0</FONT></DIV>
<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">So the drives are there, and I have put data=
 on them, but for some reason, it won't display it on df. I've looked all ov=
er for some sort of clue as to why this happened, but have come up empty han=
ded.</FONT></DIV>
<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">Is there some way to fix df so that it will=20=
display the information correctly? If not, is there some way I can avoid cau=
sing this problem in the future?</FONT></DIV>
<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">Thanks for your time,</FONT></DIV>
<DIV><FONT face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New">-Jay</FONT></DIV></BODY></HTML>

-------------------------------1114017545--
