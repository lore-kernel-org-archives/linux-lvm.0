Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2K82Hj03306
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2004 03:02:17 -0500
Received: from mtagate5.uk.ibm.com (mtagate5.uk.ibm.com [195.212.29.138])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2K82GWA012539
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2004 03:02:17 -0500
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.12.10/8.12.10) with ESMTP id i2K82AIe050102
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2004 08:02:10 GMT
Received: from d06ml064.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i2K829aH247846
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2004 08:02:10 GMT
MIME-Version: 1.0
Message-ID: <OFA503F7CB.EA7425E4-ON80256E5D.002A1936-80256E5D.002BCF6E@uk.ibm.com>
From: Chris Laycock <LAYCOCKC@uk.ibm.com>
Date: Sat, 20 Mar 2004 08:02:03 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 002BCF6C80256E5D_="
Subject: [linux-lvm] It never rains...
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
To: linux-lvm@redhat.com

This is a multipart message in MIME format.
--=_alternative 002BCF6C80256E5D_=
Content-Type: text/plain; charset="US-ASCII"

Hi All, 

Had a bit a disaster, lost 1 disk from a 3 disk VG and the root partition! 
All  on fully patched RH 9 system.
I realise that I need to attach the 2 remaining PV to a LV and VG but if I 
do the usual vgcreate, lvcreate & pvcreate I'll end up with two dataless 
disks.
I luckly do have backups of some of the more important data but there not 
a recenct as I'd like and don't contain all of the data or the root 
partition.

Outputs from:

vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "datavg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG "datavg" 
(run vgscan)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "datavg" 
(run vgscan)
pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no VG: 0 [0]

pvdisplay /dev/hdc1

--- Physical volume ---
PV Name               /dev/hdc1
VG Name               datavg
PV Size               37.28 GB [78172227 secs] / NOT usable 4.19 MB [LVM: 
165 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              9541
Free PE               0
Allocated PE          9541
PV UUID               vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0

The two remaining disks are /dev/hdc1 & /dev/sda1

Thanks in advance

Regards,
Chris.

-------------------
Chris Laycock
IT Specialist 
IBM Global Services (IDO)

LITS, Stevenage
Mail point: K3 STEV UK
Email: LaycockC@uk.ibm.com
Tel : (01438) 76-9460  (internal: 44-9460)


--=_alternative 002BCF6C80256E5D_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi All, </font>
<br>
<br><font size=2 face="sans-serif">Had a bit a disaster, lost 1 disk from
a 3 disk VG and the root partition! All &nbsp;on fully patched RH 9 system.</font>
<br><font size=2 face="sans-serif">I realise that I need to attach the
2 remaining PV to a LV and VG but if I do the usual vgcreate, lvcreate
&amp; pvcreate I'll end up with two dataless disks.</font>
<br><font size=2 face="sans-serif">I luckly do have backups of some of
the more important data but there not a recenct as I'd like and don't contain
all of the data or the root partition.</font>
<br>
<br><font size=2 face="sans-serif">Outputs from:</font>
<br>
<br><font size=2 face="sans-serif">vgscan</font>
<br><font size=2 face="sans-serif">vgscan -- reading all physical volumes
(this may take a while...)</font>
<br><font size=2 face="sans-serif">vgscan -- ERROR &quot;vg_read_with_pv_and_lv():
current PV&quot; can't get data of volume group &quot;datavg&quot; from
physical volume(s)</font>
<br><font size=2 face="sans-serif">vgscan -- &quot;/etc/lvmtab&quot; and
&quot;/etc/lvmtab.d&quot; successfully created</font>
<br><font size=2 face="sans-serif">vgscan -- WARNING: This program does
not do a VGDA backup of your volume group</font>
<br>
<br><font size=2 face="sans-serif">pvscan</font>
<br><font size=2 face="sans-serif">pvscan -- reading all physical volumes
(this may take a while...)</font>
<br><font size=2 face="sans-serif">pvscan -- inactive PV &quot;/dev/sda1&quot;
&nbsp;is associated to unknown VG &quot;datavg&quot; (run vgscan)</font>
<br><font size=2 face="sans-serif">pvscan -- inactive PV &quot;/dev/hdc1&quot;
&nbsp;is associated to unknown VG &quot;datavg&quot; (run vgscan)</font>
<br><font size=2 face="sans-serif">pvscan -- total: 2 [45.75 GB] / in use:
2 [45.75 GB] / in no VG: 0 [0]</font>
<br>
<br><font size=2 face="sans-serif">pvdisplay /dev/hdc1</font>
<br>
<br><font size=2 face="sans-serif">--- Physical volume ---</font>
<br><font size=2 face="sans-serif">PV Name &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; /dev/hdc1</font>
<br><font size=2 face="sans-serif">VG Name &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; datavg</font>
<br><font size=2 face="sans-serif">PV Size &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; 37.28 GB [78172227 secs] / NOT usable 4.19 MB [LVM:
165 KB]</font>
<br><font size=2 face="sans-serif">PV# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2</font>
<br><font size=2 face="sans-serif">PV Status &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; available</font>
<br><font size=2 face="sans-serif">Allocatable &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; yes (but full)</font>
<br><font size=2 face="sans-serif">Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;1</font>
<br><font size=2 face="sans-serif">PE Size (KByte) &nbsp; &nbsp; &nbsp;
4096</font>
<br><font size=2 face="sans-serif">Total PE &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;9541</font>
<br><font size=2 face="sans-serif">Free PE &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; 0</font>
<br><font size=2 face="sans-serif">Allocated PE &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;9541</font>
<br><font size=2 face="sans-serif">PV UUID &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0</font>
<br>
<br><font size=2 face="sans-serif">The two remaining disks are /dev/hdc1
&amp; /dev/sda1</font>
<br>
<br><font size=2 face="sans-serif">Thanks in advance</font>
<br>
<br><font size=2 face="sans-serif">Regards,<br>
Chris.<br>
<br>
-------------------<br>
Chris Laycock<br>
IT Specialist <br>
IBM Global Services (IDO)<br>
<br>
LITS, Stevenage<br>
Mail point: K3 STEV UK<br>
Email: LaycockC@uk.ibm.com<br>
Tel : (01438) 76-9460 &nbsp;(internal: 44-9460)<br>
<br>
</font>
--=_alternative 002BCF6C80256E5D_=--
