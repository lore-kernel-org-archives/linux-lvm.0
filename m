Message-ID: <20040114151855.3502.qmail@web20727.mail.yahoo.com>
From: tomasz braun <tomasz_braun@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1985663016-1074093535=:99062"
Subject: [linux-lvm] cannot set vg online anymore - corrupted pv in vg
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
Date: Wed Jan 14 18:23:02 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-1985663016-1074093535=:99062
Content-Type: text/plain; charset=us-ascii

hi all,
i try to explain the problem i have here,
it looks like dataloss to me because is cannot set the 
volumegroup online anymore.

what i had originally:
1 fibre channel diskdrive of the size 236.02 GB.
i had created one both pv's and assigned it
to a volume group called tivg1.
i made 1 lv out of it, using the maximum possible
PE's available (PE size = 16 MB).  i named this lv 
/dev/tivg1/tilv1. 
now i added 3 new drives to this vg, 1*16.85 GB
and 2* 8.43 GB.  
i created a new lv /dev/tivg1/tilv2, using again 
the max. number of free pe's, resulting in a lv size 
of 33.64 GB.
both lv's have been in production with no problem.
until one 8.43 GB drive (/dev/sdv1 used in /dev/tivg1/tilv2)  
got corrupted somehow. 
/dev/tivg1/tilv2 crashed but /dev/tivg1/tilv1 kept running with 
no problems.
until i rebooted.
the problem is that i now cannot reactivate tivg1 anymore
and get to my data which relies on /dev/tivg1/tilv1.
even though in know that this drive (/dev/sdg1) is 100%
running and ok.
i already re-formated the corrupted 8.43 GB drive and tried to
to vgcfgrestore the old lvm-config to the drive.
but i still cant get the vg online again.
at this point all data on the 236.02 GB lv seemes to be lost.

can anybody help with any ideas?
 
 
best regards,
tomasz
****************************************************************************
outputs:

[root@ti root]# vgcfgrestore -ll -n tivg1 -f /etc/lvmconf/tivg1.conf
--- Volume group ---
VG Name               tivg1
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                2
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               269.64 GB
PE Size               16 MB
Total PE              17257
Alloc PE / Size       17257 / 269.64 GB
Free  PE / Size       0 / 0
VG UUID               7gfOH1-Fdxb-ths8-yTSo-2iZJ-Sh1C-mK3v3w
--- Logical volume ---
LV Name                /dev/tivg1/tilv1
VG Name                tivg1
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                236 GB
Current LE             15104
Allocated LE           15104
Allocation             next free
Read ahead sectors     10000
Block device           58:1
--- Logical volume ---
LV Name                /dev/tivg1/tilv2
VG Name                tivg1
LV Write Access        read/write
LV Status              NOT available
LV #                   2
# open                 0
LV Size                33.64 GB
Current LE             2153
Allocated LE           2153
Allocation             next free
Read ahead sectors     10000
Block device           58:2

--- Physical volume ---
PV Name               /dev/sdg1
VG Name               tivg1
PV Size               236.02 GB [494962587 secs] / NOT usable 16.19 MB [LVM: 187 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              15104
Free PE               0
Allocated PE          15104
PV UUID               oOS8A3-OKLq-1pY7-wktU-2n3c-GMfO-q5k9k4
--- Physical volume ---
PV Name               /dev/sdf1
VG Name               tivg1
PV Size               16.85 GB [35342937 secs] / NOT usable 16.19 MB [LVM: 132 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              1077
Free PE               0
Allocated PE          1077
PV UUID               UWfbF4-ZRCC-4ik2-pX91-3GDc-MrtM-C4gH5Y
--- Physical volume ---
PV Name               /dev/sdv1
VG Name               tivg1
PV Size               8.43 GB [17671437 secs] / NOT usable 16.19 MB [LVM: 130 KB]
PV#                   3
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              538
Free PE               0
Allocated PE          538
PV UUID               BoZxoP-nRA7-j6X3-3rPq-1Gki-yK0I-yfcvW1
--- Physical volume ---
PV Name               /dev/sdm1
VG Name               tivg1
PV Size               8.43 GB [17671437 secs] / NOT usable 16.19 MB [LVM: 130 KB]
PV#                   4
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              538
Free PE               0
Allocated PE          538
PV UUID               Qb1uGf-6X1F-o3VL-WJYo-2mWX-aApu-Ogn8vq
****************************************************************************
[root@ti root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdd1" of VG "tivg0" [33.69 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sde1" of VG "tivg0" [8.41 GB / 0 free]
pvscan -- inactive PV "/dev/sdf1" is in no VG  [8.43 GB]
pvscan -- inactive PV "/dev/sdg1"  is associated to unknown VG "tivg1" (run vgscan)
pvscan -- inactive PV "/dev/sdh1"  is associated to unknown VG "tivg1" (run vgscan)
pvscan -- inactive PV "/dev/sdn1"  is associated to unknown VG "tivg1" (run vgscan)
pvscan -- ACTIVE   PV "/dev/sdp1" of VG "tivg0" [101.12 GB / 0 free]
pvscan -- total: 7 [413.01 GB] / in use: 6 [404.58 GB] / in no VG: 1 [8.43 GB]
****************************************************************************
[root@ti root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "tivg0"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "tivg1" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups
****************************************************************************
[root@ti root]# vgchange tivg1 -ay
vgchange -- volume group "tivg1" does not exist
****************************************************************************

 

 


---------------------------------
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
--0-1985663016-1074093535=:99062
Content-Type: text/html; charset=us-ascii

<DIV>hi all,<BR>i try to explain the problem i have here,<BR>it looks like dataloss to me because is cannot set the <BR>volumegroup online anymore.</DIV>
<DIV><BR>what i had originally:</DIV>
<DIV>1 fibre channel diskdrive of the size 236.02 GB.<BR>i had created one both pv's and assigned it<BR>to a volume group called tivg1.<BR>i made 1 lv out of it, using the maximum possible<BR>PE's available (PE size = 16 MB).&nbsp; i named this lv <BR>/dev/tivg1/tilv1. </DIV>
<DIV>now i added 3 new drives to this vg, 1*16.85 GB<BR>and 2* 8.43 GB.&nbsp; <BR>i created a new lv /dev/tivg1/tilv2, using again <BR>the max. number of free pe's, resulting in a lv size <BR>of 33.64 GB.</DIV>
<DIV>both lv's have been in production with no problem.<BR>until one 8.43 GB drive (/dev/sdv1 used in /dev/tivg1/tilv2)&nbsp; <BR>got corrupted somehow. <BR>/dev/tivg1/tilv2 crashed but /dev/tivg1/tilv1 kept running with <BR>no problems.<BR>until i rebooted.</DIV>
<DIV>the problem is that i now cannot reactivate tivg1 anymore<BR>and get to my data which relies on /dev/tivg1/tilv1.<BR>even though in know that this drive (/dev/sdg1) is 100%<BR>running and ok.</DIV>
<DIV>i already re-formated the corrupted 8.43 GB drive and tried to<BR>to vgcfgrestore the old lvm-config to the drive.<BR>but i still cant get the vg online again.<BR>at this point all data on the 236.02 GB lv seemes to be lost.</DIV>
<DIV><BR>can anybody help with any ideas?</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>best regards,<BR>tomasz</DIV>
<DIV>****************************************************************************<BR>outputs:</DIV>
<DIV><BR>[root@ti root]# vgcfgrestore -ll -n tivg1 -f /etc/lvmconf/tivg1.conf</DIV>
<DIV>--- Volume group ---<BR>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tivg1<BR>VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available/resizable<BR>VG #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<BR>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>MAX LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1023.97 GB<BR>Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<BR>Cur
 PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<BR>Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<BR>VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 269.64 GB<BR>PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16 MB<BR>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17257<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17257 / 269.64 GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0<BR>VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7gfOH1-Fdxb-ths8-yTSo-2iZJ-Sh1C-mK3v3w</DIV>
<DIV>--- Logical volume ---<BR>LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/tivg1/tilv1<BR>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tivg1<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<BR>LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR># open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 236 GB<BR>Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15104<BR>Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 15104<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 10000<BR>Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 58:1</DIV>
<DIV>--- Logical volume ---<BR>LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/tivg1/tilv2<BR>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tivg1<BR>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<BR>LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR># open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33.64 GB<BR>Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2153<BR>Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 2153<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 10000<BR>Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 58:2</DIV>
<DIV><BR>--- Physical volume ---<BR>PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdg1<BR>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tivg1<BR>PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 236.02 GB [494962587 secs] / NOT usable 16.19 MB [LVM: 187 KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16384<BR>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15104<BR>Free
 PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15104<BR>PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oOS8A3-OKLq-1pY7-wktU-2n3c-GMfO-q5k9k4</DIV>
<DIV>--- Physical volume ---<BR>PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdf1<BR>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tivg1<BR>PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.85 GB [35342937 secs] / NOT usable 16.19 MB [LVM: 132 KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16384<BR>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1077<BR>Free
 PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1077<BR>PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UWfbF4-ZRCC-4ik2-pX91-3GDc-MrtM-C4gH5Y</DIV>
<DIV>--- Physical volume ---<BR>PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdv1<BR>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tivg1<BR>PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.43 GB [17671437 secs] / NOT usable 16.19 MB [LVM: 130 KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<BR>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16384<BR>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 538<BR>Free
 PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 538<BR>PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BoZxoP-nRA7-j6X3-3rPq-1Gki-yK0I-yfcvW1</DIV>
<DIV>--- Physical volume ---<BR>PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdm1<BR>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tivg1<BR>PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.43 GB [17671437 secs] / NOT usable 16.19 MB [LVM: 130 KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<BR>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16384<BR>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 538<BR>Free
 PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 538<BR>PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Qb1uGf-6X1F-o3VL-WJYo-2mWX-aApu-Ogn8vq</DIV>
<DIV>****************************************************************************</DIV>
<DIV>[root@ti root]# pvscan<BR>pvscan -- reading all physical volumes (this may take a while...)<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/sdd1" of VG "tivg0" [33.69 GB / 0 free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/sde1" of VG "tivg0" [8.41 GB / 0 free]<BR>pvscan -- inactive PV "/dev/sdf1" is in no VG&nbsp; [8.43 GB]<BR>pvscan -- inactive PV "/dev/sdg1"&nbsp; is associated to unknown VG "tivg1" (run vgscan)<BR>pvscan -- inactive PV "/dev/sdh1"&nbsp; is associated to unknown VG "tivg1" (run vgscan)<BR>pvscan -- inactive PV "/dev/sdn1"&nbsp; is associated to unknown VG "tivg1" (run vgscan)<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/sdp1" of VG "tivg0" [101.12 GB / 0 free]<BR>pvscan -- total: 7 [413.01 GB] / in use: 6 [404.58 GB] / in no VG: 1 [8.43 GB]</DIV>
<DIV>****************************************************************************</DIV>
<DIV>[root@ti root]# vgscan<BR>vgscan -- reading all physical volumes (this may take a while...)<BR>vgscan -- found active volume group "tivg0"<BR>vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "tivg1" from physical volume(s)<BR>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created<BR>vgscan -- WARNING: This program does not do a VGDA backup of your volume groups</DIV>
<DIV>****************************************************************************</DIV>
<DIV>[root@ti root]# vgchange tivg1 -ay<BR>vgchange -- volume group "tivg1" does not exist</DIV>
<DIV>****************************************************************************</DIV>
<P>&nbsp;</P>
<P>&nbsp;</P><p><hr SIZE=1>
Do you Yahoo!?<br>
Yahoo! Hotjobs: <a href="http://pa.yahoo.com/*http://us.rd.yahoo.com/hotjobs/mail_footer_email/evt=21482/*http://hotjobs.sweepstakes.yahoo.com/signingbonus">Enter the "Signing Bonus" Sweepstakes</a>
--0-1985663016-1074093535=:99062--
