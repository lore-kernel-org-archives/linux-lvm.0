Message-Id: <2AD26456-4CD9-4D61-99FC-039530DA1E35@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-18-477807454
Mime-Version: 1.0 (Apple Message framework v924)
Date: Wed, 2 Jul 2008 09:16:48 -0500
References: <003701c8db50$c8fcb390$5af61ab0$@schneider@f-it.biz>
Subject: [linux-lvm] Fwd: [Linux-cluster] inconsistend volume group after
	pvmove
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
Cc: andreas.schneider@f-it.biz


--Apple-Mail-18-477807454
Content-Type: text/plain;
	charset=WINDOWS-1252;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

Spotted this message on linux-cluster...

It seems to me that the LVM label on /dev/sdh still needs to be wiped =20=

(pvremove /dev/sdh)...  [Although, I'm not sure the PV has been =20
removed from the VG yet... unless by chance it was failing when they =20
did the 'vgreduce'...  and that wouldn't explain why there were =20
problems /before/ the vgreduce.]  I'm not sure how it got to the point =20=

of having inconsistent metadata after running the pvmove.  Also note =20
that this is done using CLVM.

Anyone have ideas?

  brassow

Begin forwarded message:

> From: "Andreas Schneider" <andreas.schneider@f-it.biz>
> Date: July 1, 2008 3:02:18 AM CDT
> To: <linux-cluster@redhat.com>
> Subject: [Linux-cluster] inconsistend volume group after pvmove
> Reply-To: linux clustering <linux-cluster@redhat.com>
>
> Hello,
> This is our setup: We have 3 Linux servers (2.6.18 Centos 5), =20
> clustered, with a clvmd running one =93big=94 volume group (15 SCSI =20=

> disks a 69,9 GB).
> After we got an hardware I/O error on one disk out gfs filesystem =20
> began to loop.
> So we stopped all services and we determined the corrupted disk (/=20
> dev/sdh) and my intention was to do the following:
> -          pvmove /dev/sdh
> -          vgreduce my_volumegroup /dev/sdh
> -          do an intensive hardware check on the volume
>
>
> But: that=92s what happened during pvmove =96v /dev/sdh:
> =85=85.
> /dev/sdh: Moved: 78,6%
>   /dev/sdh: Moved: 79,1%
>   /dev/sdh: Moved: 79,7%
>   /dev/sdh: Moved: 80,0%
>     Updating volume group metadata
>     Creating volume group backup "/etc/lvm/backup/myvol_vg" (seqno =20
> 46).
>   Error locking on node server1: device-mapper: reload ioctl failed: =20=

> Das Argument ist ung=FCltig
>   Unable to reactivate logical volume "pvmove0"
>   ABORTING: Segment progression failed.
>     Removing temporary pvmove LV
>     Writing out final volume group after pvmove
>     Creating volume group backup "/etc/lvm/backup/myvol_vg" (seqno =20
> 48).
> [root@hpserver1 ~]# pvscan
>   PV /dev/cciss/c0d0p2   VG VolGroup00   lvm2 [33,81 GB / 0    free]
>   PV /dev/sda            VG fit_vg       lvm2 [68,36 GB / 0    free]
>   PV /dev/sdb            VG fit_vg       lvm2 [68,36 GB / 0    free]
>   PV /dev/sdc            VG fit_vg       lvm2 [68,36 GB / 0    free]
>   PV /dev/sdd            VG fit_vg       lvm2 [68,36 GB / 0    free]
>   PV /dev/sde            VG fit_vg       lvm2 [66,75 GB / 46,75 GB =20
> free]
>   PV /dev/sdf            VG fit_vg       lvm2 [68,36 GB / 0    free]
>   PV /dev/sdg            VG fit_vg       lvm2 [68,36 GB / 0    free]
>   PV /dev/sdh            VG fit_vg       lvm2 [68,36 GB / 58,36 GB =20
> free]
>   PV /dev/sdj            VG fit_vg       lvm2 [68,36 GB / 54,99 GB =20
> free]
>   PV /dev/sdi            VG fit_vg       lvm2 [68,36 GB / 15,09 GB =20
> free]
>   PV /dev/sdk1           VG fit_vg       lvm2 [68,36 GB / 55,09 GB =20
> free]
>   Total: 12 [784,20 GB] / in use: 12 [784,20 GB] / in no VG: 0 [0   ]
>
> That sounded bad, and I didn=92t have any idea what to do, but read, =20=

> that pvmove can start at the point it was, so I started pvmove =20
> againg and now pvmove could move all data.
> pvscan and vgscan -vvv showed me, that all data were moved from the /=20=

> dev/sdh volume to the other volumes.
>
> To be sure I restarted my cluster nodes, but they encountered =20
> problems mounting the gfs filesystems.
> I got this error:
>
> [root@server1 ~]# /etc/init.d/clvmd stop
> Deactivating VG myvol_vg:   Volume group "myvol_vg" inconsistent
>   WARNING: Inconsistent metadata found for VG myvol_vg - updating to =20=

> use version 148
>   0 logical volume(s) in volume group "myvol_vg" now active
>                                                            [  OK  ]
> Stopping clvm:                                             [  OK  ]
> [root@server1 ~]# /etc/init.d/clvmd start
> Starting clvmd:                                            [  OK  ]
> Activating VGs:   2 logical volume(s) in volume group "VolGroup00" =20
> now active
>   Volume group "myvol_vg" inconsistent
>   WARNING: Inconsistent metadata found for VG myvol_vg - updating to =20=

> use version 151
>   Error locking on node server1: Volume group for uuid not found: =20
> tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtuFZZe8QKoX8sVA0XRTNoDQVWVftk8cSa
>   Error locking on node server1: Volume group for uuid not found: =20
> tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtqDfFtrJTFTGuju8nNjwtCdPGnzP3hh8k
>   Error locking on node server1: Volume group for uuid not found: =20
> tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtc22hBY40phdVvVdFBFX28PvfF7JrlIYz
>   Error locking on node server1: Volume group for uuid not found: =20
> tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtWfJ1EqXJ309gO3Gx0ZvpNekrmHFo9u2V
>   Error locking on node server1: Volume group for uuid not found: =20
> tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtCP6czghnQFEjNdv9DF6bsUmnK3eJ5vKp
>   Error locking on node server1: Volume group for uuid not found: =20
> tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBt0KNlnblpwOfcnqIjk4GJ662dxOsL70GF
>   0 logical volume(s) in volume group "myvol_vg" now active
>                                                            [  OK  ]
>
> As I take a look at it, these 6 volumes are exactly the LVs which =20
> should be found and where all datas are stored.
>
> The next step was in the beginning step by step and in the end =20
> stupid try and error.
> This was one of the first actions:
>
> [root@hpserver1 ~]# vgreduce --removemissing myvol_vg
>     Logging initialised at Tue Jul  1 10:00:52 2008
>     Set umask to 0077
>     Finding volume group "myvol_vg"
>     Wiping cache of LVM-capable devices
>   WARNING: Inconsistent metadata found for VG myvol_vg - updating to =20=

> use version 229
>   Volume group "myvol_vg" is already consistent
>
> We tried to deactivate the volume via vgchange =96n y myvol_vg, we =20
> tried to =93removemissing=94 and sadly after a few concurrent tries =20=

> (dmsetup info =96c, dmsetup mknodes and vgchange =96n y myvol_vg) we =
can =20
> access our LVs, but we still get this message and we don=92t know why:
>
>   Volume group "myvol_vg" inconsistent
>   WARNING: Inconsistent metadata found for VG myvol_vg - updating to =20=

> use version 228
>
> I=92m a little bit worried about our data,
>
> Regards
> Andreas
>
> --
> Linux-cluster mailing list
> Linux-cluster@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-cluster


--Apple-Mail-18-477807454
Content-Type: text/html;
	charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><div>Spotted this message on =
linux-cluster...</div><div><br></div><div>It seems to me that the LVM =
label on /dev/sdh still needs to be wiped (pvremove /dev/sdh)... =
&nbsp;[Although, I'm not sure the PV has been removed from the VG yet... =
unless by chance it was failing when they did the 'vgreduce'... =
&nbsp;and that wouldn't explain why there were problems /before/ the =
vgreduce.] &nbsp;I'm not sure how it got to the point of having =
inconsistent metadata after running the pvmove. &nbsp;Also note that =
this is done using CLVM.</div><div><br></div><div>Anyone have =
ideas?</div><div><br></div><div>&nbsp;brassow</div><div><br><div>Begin =
forwarded message:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><font face=3D"Helvetica" size=3D"3" color=3D"#000000" =
style=3D"font: 12.0px Helvetica; color: #000000"><b>From: =
</b></font><font face=3D"Helvetica" size=3D"3" style=3D"font: 12.0px =
Helvetica">"Andreas Schneider" &lt;<a =
href=3D"mailto:andreas.schneider@f-it.biz">andreas.schneider@f-it.biz</a>>=
</font></div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; "><font face=3D"Helvetica" =
size=3D"3" color=3D"#000000" style=3D"font: 12.0px Helvetica; color: =
#000000"><b>Date: </b></font><font face=3D"Helvetica" size=3D"3" =
style=3D"font: 12.0px Helvetica">July 1, 2008 3:02:18 AM =
CDT</font></div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; "><font face=3D"Helvetica" =
size=3D"3" color=3D"#000000" style=3D"font: 12.0px Helvetica; color: =
#000000"><b>To: </b></font><font face=3D"Helvetica" size=3D"3" =
style=3D"font: 12.0px Helvetica">&lt;<a =
href=3D"mailto:linux-cluster@redhat.com">linux-cluster@redhat.com</a>></fo=
nt></div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; "><font face=3D"Helvetica" =
size=3D"3" color=3D"#000000" style=3D"font: 12.0px Helvetica; color: =
#000000"><b>Subject: </b></font><font face=3D"Helvetica" size=3D"3" =
style=3D"font: 12.0px Helvetica"><b>[Linux-cluster] inconsistend volume =
group after pvmove</b></font></div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><font =
face=3D"Helvetica" size=3D"3" color=3D"#000000" style=3D"font: 12.0px =
Helvetica; color: #000000"><b>Reply-To: </b></font><font =
face=3D"Helvetica" size=3D"3" style=3D"font: 12.0px Helvetica">linux =
clustering &lt;<a =
href=3D"mailto:linux-cluster@redhat.com">linux-cluster@redhat.com</a>></fo=
nt></div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><br></div> =
</div><span class=3D"Apple-style-span" style=3D"border-collapse: =
separate; color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
auto; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div lang=3D"DE" link=3D"blue" =
vlink=3D"purple"><div class=3D"Section1"><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">Hello,<o:p></o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">This is our setup: We have 3 Linux servers (2.6.18 Centos =
5), clustered, with a clvmd running one =93big=94 volume group (15 SCSI =
disks a 69,9 GB).<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">After we =
got an hardware I/O error on one disk out gfs filesystem began to =
loop.<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">So we =
stopped all services and we determined the corrupted disk (/dev/sdh) and =
my intention was to do the following:<o:p></o:p></span></div><div =
style=3D"text-indent: -18pt; margin-top: 0cm; margin-right: 0cm; =
margin-left: 36pt; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><span lang=3D"EN-US"><span>-<span =
style=3D"font: normal normal normal 7pt/normal 'Times New Roman'; =
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span></span></span></span><span =
lang=3D"EN-US">pvmove /dev/sdh<o:p></o:p></span></div><div =
style=3D"text-indent: -18pt; margin-top: 0cm; margin-right: 0cm; =
margin-left: 36pt; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><span lang=3D"EN-US"><span>-<span =
style=3D"font: normal normal normal 7pt/normal 'Times New Roman'; =
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span></span></span></span><span =
lang=3D"EN-US">vgreduce my_volumegroup =
/dev/sdh<o:p></o:p></span></div><div style=3D"text-indent: -18pt; =
margin-top: 0cm; margin-right: 0cm; margin-left: 36pt; margin-bottom: =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><span>-<span style=3D"font: normal normal normal =
7pt/normal 'Times New Roman'; =
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span></span></span></span><span =
lang=3D"EN-US">do an intensive hardware check on the =
volume<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">But: that=92s what happened during pvmove =96v =
/dev/sdh:<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">=85=85.<o:p></o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">/dev/sdh: Moved: 78,6%<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">&nbsp; /dev/sdh: Moved: =
79,1%<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
/dev/sdh: Moved: 79,7%<o:p></o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; /dev/sdh: Moved: 80,0%<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Updating volume =
group metadata<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Creating volume group backup =
"/etc/lvm/backup/myvol_vg" (seqno 46).<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">&nbsp; Error locking on node server1: =
device-mapper: reload ioctl failed: Das Argument ist =
ung=FCltig<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
Unable to reactivate logical volume =
"pvmove0"<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
ABORTING: Segment progression failed.<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Removing temporary =
pvmove LV<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Writing out final volume group after =
pvmove<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Creating volume group backup =
"/etc/lvm/backup/myvol_vg" (seqno 48).<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">[root@hpserver1 ~]# =
pvscan<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; PV =
/dev/cciss/c0d0p2&nbsp;&nbsp; VG VolGroup00&nbsp;&nbsp; lvm2 [33,81 GB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; PV =
/dev/sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; PV =
/dev/sdb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; PV =
/dev/sdc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; PV =
/dev/sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; PV =
/dev/sde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [66,75 GB / 46,75 GB =
free]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; PV =
/dev/sdf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; PV =
/dev/sdg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></div><div style=3D"margin-top:=
 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; PV =
/dev/sdh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / 58,36 GB =
free]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; PV =
/dev/sdj&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / 54,99 GB =
free]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; PV =
/dev/sdi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 VG fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / 15,09 GB =
free]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; PV =
/dev/sdk1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
fit_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [68,36 GB / 55,09 GB =
free]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
Total: 12 [784,20 GB] / in use: 12 [784,20 GB] / in no VG: 0 =
[0&nbsp;&nbsp; ]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">That sounded bad, and I didn=92t have any idea what to =
do, but read, that pvmove can start at the point it was, so I started =
pvmove againg and now pvmove could move all =
data.<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">pvscan =
and vgscan -vvv showed me, that all data were moved from the /dev/sdh =
volume to the other volumes.<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">To be sure I restarted my cluster =
nodes, but they encountered problems mounting the gfs =
filesystems.<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">I got =
this error:<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">[root@server1 ~]# /etc/init.d/clvmd =
stop<o:p></o:p></span></div><div style=3D"margin-top: 0cm; margin-right: =
0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><span lang=3D"EN-US">Deactivating VG =
myvol_vg:&nbsp;&nbsp; Volume group "myvol_vg" =
inconsistent<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
WARNING: Inconsistent metadata found for VG myvol_vg - updating to use =
version 148<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; 0 =
logical volume(s) in volume group "myvol_vg" now =
active<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
[&nbsp; OK&nbsp; ]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">Stopping =
clvm:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [&nbsp; OK&nbsp; =
]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; margin-right: =
0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><span lang=3D"EN-US">[root@server1 =
~]# /etc/init.d/clvmd start<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">Starting =
clvmd:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [&nbsp; OK&nbsp; =
]<o:p></o:p></span></div><div style=3D"margin-top: 0cm; margin-right: =
0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><span lang=3D"EN-US">Activating =
VGs:&nbsp;&nbsp; 2 logical volume(s) in volume group "VolGroup00" now =
active<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
Volume group "myvol_vg" inconsistent<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">&nbsp; WARNING: Inconsistent metadata =
found for VG myvol_vg - updating to use version =
151<o:p></o:p></span></div><div style=3D"margin-top: 0cm; margin-right: =
0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; Error =
locking on node server1: Volume group for uuid not found: =
tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtuFZZe8QKoX8sVA0XRTNoDQVWVftk8cSa<o:p></o:p=
></span></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; Error locking on node =
server1: Volume group for uuid not found: =
tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtqDfFtrJTFTGuju8nNjwtCdPGnzP3hh8k<o:p></o:p=
></span></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; Error locking on node =
server1: Volume group for uuid not found: =
tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtc22hBY40phdVvVdFBFX28PvfF7JrlIYz<o:p></o:p=
></span></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; Error locking on node =
server1: Volume group for uuid not found: =
tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtWfJ1EqXJ309gO3Gx0ZvpNekrmHFo9u2V<o:p></o:p=
></span></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; Error locking on node =
server1: Volume group for uuid not found: =
tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBtCP6czghnQFEjNdv9DF6bsUmnK3eJ5vKp<o:p></o:p=
></span></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; Error locking on node =
server1: Volume group for uuid not found: =
tGRfaK5aW00pFRXcLtrdHAw5a4GNDVBt0KNlnblpwOfcnqIjk4GJ662dxOsL70GF<o:p></o:p=
></span></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; 0 logical volume(s) =
in volume group "myvol_vg" now active<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span></span>[&nbsp; OK&nbsp; =
]<o:p></o:p></div><div style=3D"margin-top: 0cm; margin-right: 0cm; =
margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif; "><o:p>&nbsp;</o:p></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">As I take a look at it, these 6 volumes are exactly the =
LVs which should be found and where all datas are =
stored.<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">The next step was in the beginning step by step and in =
the end stupid try and error.<o:p></o:p></span></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; "><span lang=3D"EN-US">This was one of the first =
actions:<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">[root@hpserver1 ~]# vgreduce --removemissing =
myvol_vg<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Logging initialised at Tue Jul&nbsp; 1 =
10:00:52 2008<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Set umask to =
0077<o:p></o:p></span></div><div style=3D"margin-top: 0cm; margin-right: =
0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Finding volume group =
"myvol_vg"<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Wiping cache of LVM-capable =
devices<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
WARNING: Inconsistent metadata found for VG myvol_vg - updating to use =
version 229<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
Volume group "myvol_vg" is already =
consistent<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">We tried to deactivate the volume via vgchange =96n y =
myvol_vg, we tried to =93removemissing=94 and sadly after a few =
concurrent tries (dmsetup info =96c, dmsetup mknodes and vgchange =96n y =
myvol_vg) we can access our LVs, but we still get this message and we =
don=92t know why:<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">&nbsp; Volume group "myvol_vg" =
inconsistent<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span lang=3D"EN-US">&nbsp; =
WARNING: Inconsistent metadata found for VG myvol_vg - updating to use =
version 228<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">I=92m a little bit worried about our =
data,<o:p></o:p></span></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">Regards<o:p></o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US">Andreas<o:p></o:p></span></div><div style=3D"margin-top: =
0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif; "><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div></div>--<br>Linux-cluster =
mailing list<br><a href=3D"mailto:Linux-cluster@redhat.com" =
style=3D"color: blue; text-decoration: underline; =
">Linux-cluster@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-cluster" =
style=3D"color: blue; text-decoration: underline; =
">https://www.redhat.com/mailman/listinfo/linux-cluster</a></div></span></=
blockquote></div><br></body></html>=

--Apple-Mail-18-477807454--
