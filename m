Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2MDoEu8022571
	for <linux-lvm@redhat.com>; Fri, 22 Mar 2013 09:50:16 -0400
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2MDo5ei031452
	for <linux-lvm@redhat.com>; Fri, 22 Mar 2013 09:50:12 -0400
Received: by mail-wg0-f52.google.com with SMTP id 15so3229464wgd.7
	for <linux-lvm@redhat.com>; Fri, 22 Mar 2013 06:50:04 -0700 (PDT)
Sender: Andres Toomsalu <andres.toomsalu@activesys.org>
From: Andres Toomsalu <andres@active.ee>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B2E3D904-EBEC-4559-8337-0DA1BF3200ED"
Date: Fri, 22 Mar 2013 15:50:00 +0200
Message-Id: <48C1195E-5279-4B23-8F43-6E23BAD8EE25@active.ee>
Mime-Version: 1.0 (Apple Message framework v1283)
Subject: [linux-lvm] LVM thin LV filesystem superblock corruption
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail=_B2E3D904-EBEC-4559-8337-0DA1BF3200ED
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

We stumbled on strange lvm thinly provisioned LV filesystem corruption =
case - here are steps that reproduce the issue:

lvcreate --thinpool pool -L 8T --poolmetadatasize 16G VolGroupL1
lvcreate -T VolGroupL1/pool -V 2T --name thin_storage
mkfs.ext4 /dev/VolGroupL1/thin_storage
mount /dev/VolGroupL1/thin_storage /storage/
reboot

# NB! without host reboot unmount/mount succeeds!

[root@node3 ~]# mount /dev/VolGroupL1/thin_storage /storage/
mount: you must specify the filesystem type

Tried also to set poolmetadatasize to 2G, 14G, 15G and pool size to 1T, =
2T - no change - corruption still happens.

Hardware setup:=20
* Underlaying block device (sdb) is hosted by PERC H800 controller and =
disks are coming from SAS disk expansion box (DELL MD1200).

Some debug info:
[root@node3 ~]# lvs
  LV           VG         Attr     LSize   Pool Origin Data%  Move Log =
Copy%  Convert
  lv_root      VolGroup   -wi-ao--  50.00g
  lv_swap      VolGroup   -wi-ao--   4.00g
  pool         VolGroupL1 twi-a-tz   1.00t               0.00
  thin_storage VolGroupL1 Vwi-a-tz 100.00g pool          0.00

[root@node3 ~]# lvdisplay /dev/VolGroupL1/thin_storage
  --- Logical volume ---
  LV Path                /dev/VolGroupL1/thin_storage
  LV Name                thin_storage
  VG Name                VolGroupL1
  LV UUID                qla8Zf-FOdU-WB0j-SSdv-Xzpk-c9MS-gc97fc
  LV Write Access        read/write
  LV Creation host, time node3.oncloud.int, 2013-03-22 15:38:08 +0200
  LV Pool name           pool
  LV Status              available
  # open                 0
  LV Size                100.00 GiB
  Mapped size            0.00%
  Current LE             800
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:6

[root@node3 ~]# vgs
  VG         #PV #LV #SN Attr   VSize  VFree
  VolGroup     1   2   0 wz--n-  3.27t 3.22t
  VolGroupL1   1   2   0 wz--n- 10.91t 9.91t

[root@node3 ~]# vgdisplay VolGroupL1
  --- Volume group ---
  VG Name               VolGroupL1
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  61
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               10.91 TiB
  PE Size               128.00 MiB
  Total PE              89399
  Alloc PE / Size       8208 / 1.00 TiB
  Free  PE / Size       81191 / 9.91 TiB
  VG UUID               2cHIOM-Rs9u-B5Mv-FaZv-KORq-mrTk-QIGfoG

[root@node3 ~]# pvs
  PV         VG         Fmt  Attr PSize  PFree
  /dev/sda2  VolGroup   lvm2 a--   3.27t 3.22t
  /dev/sdb   VolGroupL1 lvm2 a--  10.91t 9.91t

[root@node3 ~]# pvdisplay /dev/sdb
  --- Physical volume ---
  PV Name               /dev/sdb
  VG Name               VolGroupL1
  PV Size               10.91 TiB / not usable 128.00 MiB
  Allocatable           yes
  PE Size               128.00 MiB
  Total PE              89399
  Free PE               81191
  Allocated PE          8208
  PV UUID               l3ROps-Aar9-wSUO-ypGj-Wwi1-G0Wu-VqDs1a

What could be the issue here?

regards,
--=20
----------------------------------------------
Andres Toomsalu, andres@active.ee





--Apple-Mail=_B2E3D904-EBEC-4559-8337-0DA1BF3200ED
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">We =
stumbled on strange lvm thinly provisioned LV filesystem corruption case =
- here are steps that reproduce the issue:<div><br></div><div><pre =
class=3D"code-java" style=3D"margin: 0px; padding: 0px; font-size: 13px; =
line-height: 1.3em; font-family: monospace; max-height: 30em; overflow: =
auto; word-wrap: normal; color: rgb(0, 0, 0); font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: left; text-indent: 0px; text-transform: none; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;">lvcreate --thinpool pool -L 8T =
--poolmetadatasize 16G VolGroupL1
lvcreate -T VolGroupL1/pool -V 2T --name thin_storage
mkfs.ext4 /dev/VolGroupL1/thin_storage
mount /dev/VolGroupL1/thin_storage /storage/
reboot</pre><pre class=3D"code-java" style=3D"margin: 0px; padding: 0px; =
font-size: 13px; line-height: 1.3em; font-family: monospace; max-height: =
30em; overflow: auto; word-wrap: normal; color: rgb(0, 0, 0); =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: left; text-indent: =
0px; text-transform: none; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: =
0px;"><br></pre><pre class=3D"code-java" style=3D"margin: 0px; padding: =
0px; font-size: 13px; line-height: 1.3em; font-family: monospace; =
max-height: 30em; overflow: auto; word-wrap: normal; color: rgb(0, 0, =
0); font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: left; text-indent: =
0px; text-transform: none; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;"># NB! =
without host reboot unmount/mount succeeds!</pre><pre class=3D"code-java" =
style=3D"margin: 0px; padding: 0px; font-size: 13px; line-height: 1.3em; =
font-family: monospace; max-height: 30em; overflow: auto; word-wrap: =
normal; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
left; text-indent: 0px; text-transform: none; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;"><br></pre><pre class=3D"code-java" =
style=3D"margin: 0px; padding: 0px; font-size: 13px; line-height: 1.3em; =
font-family: monospace; max-height: 30em; overflow: auto; word-wrap: =
normal; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
left; text-indent: 0px; text-transform: none; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;">[root@node3 ~]# mount =
/dev/VolGroupL1/thin_storage /storage/
mount: you must specify the filesystem =
type</pre><div><br></div><div>Tried also to set&nbsp;<span =
class=3D"Apple-style-span" style=3D"font-family: monospace; font-size: =
13px; line-height: 16px; white-space: pre; ">poolmetadatasize to 2G, =
14G, 15G and pool size to 1T, 2T - no change - corruption still =
happens.</span></div><div><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; font-size: 13px; line-height: 16px; =
white-space: pre; "><br></span></div><div><span class=3D"Apple-style-span"=
 style=3D"font-family: monospace; font-size: 13px; line-height: 16px; =
white-space: pre; ">Hardware setup: </span></div><div><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; font-size: =
13px; line-height: 16px; white-space: pre; ">* </span><span =
style=3D"color: rgb(0, 0, 0); font-family: Arial, FreeSans, Helvetica, =
sans-serif; font-size: 13px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: =
auto; text-align: left; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
background-color: rgb(255, 255, 255); display: inline !important; float: =
none;">Underlaying block device (sdb) is hosted by PERC H800 controller =
and disks are coming from SAS disk expansion box (DELL =
MD1200).</span></div><div><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; font-size: 13px; line-height: 16px; =
white-space: pre; "><br></span></div><div><span class=3D"Apple-style-span"=
 style=3D"font-family: monospace; font-size: 13px; line-height: 16px; =
white-space: pre; ">Some debug info:</span></div><div><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; font-size: =
13px; line-height: 16px; white-space: pre; ">[root@node3 ~]# lvs
  LV           VG         Attr     LSize   Pool Origin Data%  Move Log =
Copy%  Convert
  lv_root      VolGroup   -wi-ao--  50.00g
  lv_swap      VolGroup   -wi-ao--   4.00g
  pool         VolGroupL1 twi-a-tz   1.00t               0.00
  thin_storage VolGroupL1 Vwi-a-tz 100.00g pool          =
0.00</span></div><div><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; font-size: 13px; line-height: 16px; =
white-space: pre; "><br></span></div><div><span class=3D"Apple-style-span"=
 style=3D"font-family: monospace; font-size: 13px; line-height: 16px; =
white-space: pre; ">[root@node3 ~]# lvdisplay =
/dev/VolGroupL1/thin_storage
  --- Logical volume ---
  LV Path                /dev/VolGroupL1/thin_storage
  LV Name                thin_storage
  VG Name                VolGroupL1
  LV UUID                qla8Zf-FOdU-WB0j-SSdv-Xzpk-c9MS-gc97fc
  LV Write Access        read/write
  LV Creation host, time node3.oncloud.int, 2013-03-22 15:38:08 +0200
  LV Pool name           pool
  LV Status              available
  # open                 0
  LV Size                100.00 GiB
  Mapped size            0.00%
  Current LE             800
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           =
253:6</span></div><div><br></div><div><div>[root@node3 ~]# =
vgs</div><div>&nbsp; VG &nbsp; &nbsp; &nbsp; &nbsp; #PV #LV #SN Attr =
&nbsp; VSize &nbsp;VFree</div><div>&nbsp; VolGroup &nbsp; &nbsp; 1 =
&nbsp; 2 &nbsp; 0 wz--n- &nbsp;3.27t 3.22t</div><div>&nbsp; VolGroupL1 =
&nbsp; 1 &nbsp; 2 &nbsp; 0 wz--n- 10.91t =
9.91t</div></div><div><br></div><div><div>[root@node3 ~]# vgdisplay =
VolGroupL1</div><div>&nbsp; --- Volume group ---</div><div>&nbsp; VG =
Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
VolGroupL1</div><div>&nbsp; System ID</div><div>&nbsp; Format &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lvm2</div><div>&nbsp; =
Metadata Areas &nbsp; &nbsp; &nbsp; &nbsp;1</div><div>&nbsp; Metadata =
Sequence No &nbsp;61</div><div>&nbsp; VG Access &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; read/write</div><div>&nbsp; VG Status &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; resizable</div><div>&nbsp; MAX LV &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0</div><div>&nbsp; Cur =
LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;2</div><div>&nbsp; Open LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 0</div><div>&nbsp; Max PV &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;0</div><div>&nbsp; Cur PV &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1</div><div>&nbsp; Act PV =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;1</div><div>&nbsp; VG Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 10.91 TiB</div><div>&nbsp; PE Size &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 128.00 MiB</div><div>&nbsp; Total PE &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;89399</div><div>&nbsp; Alloc PE =
/ Size &nbsp; &nbsp; &nbsp; 8208 / 1.00 TiB</div><div>&nbsp; Free =
&nbsp;PE / Size &nbsp; &nbsp; &nbsp; 81191 / 9.91 TiB</div><div>&nbsp; =
VG UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
2cHIOM-Rs9u-B5Mv-FaZv-KORq-mrTk-QIGfoG</div></div><div><br></div><div><div=
>[root@node3 ~]# pvs</div><div>&nbsp; PV &nbsp; &nbsp; &nbsp; &nbsp; VG =
&nbsp; &nbsp; &nbsp; &nbsp; Fmt &nbsp;Attr PSize =
&nbsp;PFree</div><div>&nbsp; /dev/sda2 &nbsp;VolGroup &nbsp; lvm2 a-- =
&nbsp; 3.27t 3.22t</div><div>&nbsp; /dev/sdb &nbsp; VolGroupL1 lvm2 a-- =
&nbsp;10.91t 9.91t</div></div><div><br></div><div><div>[root@node3 ~]# =
pvdisplay /dev/sdb</div><div>&nbsp; --- Physical volume =
---</div><div>&nbsp; PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/sdb</div><div>&nbsp; VG Name &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; VolGroupL1</div><div>&nbsp; PV Size &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 10.91 TiB / not usable 128.00 =
MiB</div><div>&nbsp; Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
yes</div><div>&nbsp; PE Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 128.00 MiB</div><div>&nbsp; Total PE &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;89399</div><div>&nbsp; Free PE &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 81191</div><div>&nbsp; Allocated PE &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;8208</div><div>&nbsp; PV UUID &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
l3ROps-Aar9-wSUO-ypGj-Wwi1-G0Wu-VqDs1a</div></div><div><br></div><div>What=
 could be the issue here?</div><div><br></div><div>regards,</div><div =
apple-content-edited=3D"true">
<div style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><div><div style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: =
normal normal normal 12px/normal Helvetica; "><div style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: =
normal normal normal 12px/normal Helvetica; font-size: medium; "><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">--&nbsp;</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; =
">----------------------------------------------</div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">Andres Toomsalu, <a =
href=3D"mailto:andres@active.ee">andres@active.ee</a></div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
"><br></div></div></div></div></div></div></div></div><br =
class=3D"Apple-interchange-newline"><br =
class=3D"Apple-interchange-newline">
</div>


<br></div></body></html>=

--Apple-Mail=_B2E3D904-EBEC-4559-8337-0DA1BF3200ED--
