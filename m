Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4NJoWSJ005070
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 15:50:32 -0400
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.172])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4NJoH9t011625
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 15:50:17 -0400
Received: by wf-out-1314.google.com with SMTP id 25so644257wfc.6
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 12:50:17 -0700 (PDT)
Message-ID: <451e777b0805231250l1e8c4798wce2927754c61a7fd@mail.gmail.com>
Date: Fri, 23 May 2008 15:50:16 -0400
From: "Phillip Michalak" <pdmichalak@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9963_30913313.1211572217137"
Subject: [linux-lvm] trouble resizing / activating lvm volume
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

------=_Part_9963_30913313.1211572217137
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I recently resized an active volume. In preparation for resizing the JFS
file system, I unmounted the device and deactivated the volume (I thought I
remembered that being necessary), though it appears that I needn't have
according to the following instructions from
http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html:

>Just like XFS the JFS file system must be mounted to be resized and the
mount-point is specified rather than the device name. You need at least
Version 1.0.21 of the jfs-utils to do this.
>*# mount -o remount,resize /home*

So I tried to mount the drive but failed, and since then have not been able
to activate the volume, resize the filesystem, or do anything remotely
useful.
I've seen a lot of search results with similar symptoms (device-mapper:
reload ioctl failed: Invalid argument), but the solutions have all been
situation specific and I'm missing the general principal and the specific
application for this situation.
I've included some information below, and would appreciate any
help/pointers.

Thanks,
Phil

# sudo lvchange -ay -v /dev/vg_share/lv_share
    Using logical volume(s) on command line
    Activating logical volume "lv_share"
    Found volume group "vg_share"
    Creating vg_share-lv_share
    Loading vg_share-lv_share table
  device-mapper: reload ioctl failed: Invalid argument
---------------------------------------------------------------------------

# dmesg | tail
[  181.331807] /dev/vmnet: open called by PID 7002 (vmnet-dhcpd)
[  181.331823] /dev/vmnet: port on hub 1 successfully opened
[  181.336824] /dev/vmnet: open called by PID 7003 (vmnet-dhcpd)
[  181.336840] /dev/vmnet: port on hub 2 successfully opened
[  186.907623] vmnet2: no IPv6 routers present
[  187.107349] vmnet1: no IPv6 routers present
[  187.571087] eth0: no IPv6 routers present
[  595.959391] device-mapper: table: device 8:9 too small for target
[  595.959397] device-mapper: table: 254:7: linear: dm-linear: Device lookup
failed
[  595.959401] device-mapper: ioctl: error adding target to table
---------------------------------------------------------------------------

# sudo lvm lvs
  LV          VG         Attr   LSize   Origin Snap%  Move Log Copy%
  lv_home     vg_fs      -wi-ao  14.00G
  lv_opt      vg_fs      -wi-ao   6.00G
  lv_root     vg_fs      -wi-ao   1.00G
  lv_usr      vg_fs      -wi-ao  10.00G
  lv_var      vg_fs      -wi-ao   5.00G
  lv_mythrec1 vg_mythtv  -wi-ao  93.13G
  lv_mythrec2 vg_mythtv2 -wi-ao 143.06G
  lv_share    vg_share   -wi-d- 144.00G
---------------------------------------------------------------------------

# sudo vgdisplay -v /dev/vg_share
    Using volume group(s) on command line
    Finding volume group "vg_share"
  --- Volume group ---
  VG Name               vg_share
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  41
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               186.36 GB
  PE Size               4.00 MB
  Total PE              47708
  Alloc PE / Size       36864 / 144.00 GB
  Free  PE / Size       10844 / 42.36 GB
  VG UUID               IpRQvV-EBVB-T32r-wuju-AL3M-9PEv-P0i0rz

  --- Logical volume ---
  LV Name                /dev/vg_share/lv_share
  VG Name                vg_share
  LV UUID                Mm4Vve-9AJc-Pr1u-6RnO-bzLs-m0js-q8bf3m
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                144.00 GB
  Current LE             36864
  Segments               4
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:7

  --- Physical volumes ---
  PV Name               /dev/sda7
  PV UUID               rWpPc9-wQGk-0V7W-CxO9-RYJo-dcOJ-emUerb
  PV Status             allocatable
  Total PE / Free PE    11921 / 10844

  PV Name               /dev/sda8
  PV UUID               fiKdbI-mGve-GYYi-4Lbn-Q3SR-3Nda-a9qQxW
  PV Status             allocatable
  Total PE / Free PE    11921 / 0

  PV Name               /dev/sda9
  PV UUID               MqYeap-DFiH-eNWM-nhfa-TXcw-5mCi-ClCXEg
  PV Status             allocatable
  Total PE / Free PE    23866 / 0
---------------------------------------------------------------------------

# sudo pvdisplay -v /dev/sda{7,8,9}
    Using physical volume(s) on command line
  --- Physical volume ---
  PV Name               /dev/sda7
  VG Name               vg_share
  PV Size               46.57 GB / not usable 1.09 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              11921
  Free PE               10844
  Allocated PE          1077
  PV UUID               rWpPc9-wQGk-0V7W-CxO9-RYJo-dcOJ-emUerb

  --- Physical volume ---
  PV Name               /dev/sda8
  VG Name               vg_share
  PV Size               46.57 GB / not usable 1.09 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              11921
  Free PE               0
  Allocated PE          11921
  PV UUID               fiKdbI-mGve-GYYi-4Lbn-Q3SR-3Nda-a9qQxW

  --- Physical volume ---
  PV Name               /dev/sda9
  VG Name               vg_share
  PV Size               93.23 GB / not usable 357.00 KB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              23866
  Free PE               0
  Allocated PE          23866
  PV UUID               MqYeap-DFiH-eNWM-nhfa-TXcw-5mCi-ClCXEg
---------------------------------------------------------------------------

------=_Part_9963_30913313.1211572217137
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I recently resized an active volume. In preparation for resizing the
JFS file system, I unmounted the device and deactivated the volume (I
thought I remembered that being necessary), though it appears that I
needn&#39;t have according to the following instructions from
<a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html" target=3D"_blank"=
>http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html</a>:<br>
<br>&gt;Just like XFS the JFS file system must be mounted to be
=09    resized and the mount-point is specified rather than the
=09    device name.  You need at least Version 1.0.21 of the
=09    jfs-utils to do this.<br>&gt;<b><font color=3D"#000000">#</font> mou=
nt -o remount,resize /home</b><br><br>So
I tried to mount the drive but failed, and since then have not been
able to activate the volume, resize the filesystem, or do anything
remotely useful.<br>
I&#39;ve seen a lot of search results with similar symptoms (device-mapper:
reload ioctl failed: Invalid argument), but the solutions have all been
situation specific and I&#39;m missing the general principal and the
specific application for this situation.<br>
I&#39;ve included some information below, and would appreciate any help/poi=
nters.<br><br>Thanks,<br>Phil<br><br># sudo lvchange -ay -v /dev/vg_share/l=
v_share<br>&nbsp;&nbsp;&nbsp; Using logical volume(s) on command line<br>&n=
bsp;&nbsp;&nbsp; Activating logical volume &quot;lv_share&quot;<br>

&nbsp;&nbsp;&nbsp; Found volume group &quot;vg_share&quot;<br>&nbsp;&nbsp;&=
nbsp; Creating vg_share-lv_share<br>&nbsp;&nbsp;&nbsp; Loading vg_share-lv_=
share table<br>&nbsp; device-mapper: reload ioctl failed: Invalid argument<=
br>------------------------------<div id=3D"1eqe" class=3D"ArwC7c ckChnd">
---------------------------------------------<br>
<br># dmesg | tail<br>[&nbsp; 181.331807] /dev/vmnet: open called by PID 70=
02 (vmnet-dhcpd)<br>[&nbsp; 181.331823] /dev/vmnet: port on hub 1 successfu=
lly opened<br>[&nbsp; 181.336824] /dev/vmnet: open called by PID 7003 (vmne=
t-dhcpd)<br>

[&nbsp; 181.336840] /dev/vmnet: port on hub 2 successfully opened<br>[&nbsp=
; 186.907623] vmnet2: no IPv6 routers present<br>[&nbsp; 187.107349] vmnet1=
: no IPv6 routers present<br>[&nbsp; 187.571087] eth0: no IPv6 routers pres=
ent<br>[&nbsp; 595.959391] device-mapper: table: device 8:9 too small for t=
arget<br>

[&nbsp; 595.959397] device-mapper: table: 254:7: linear: dm-linear: Device =
lookup failed<br>[&nbsp; 595.959401] device-mapper: ioctl: error adding tar=
get to table<br>
---------------------------------------------------------------------------=
<br>
<br># sudo lvm lvs<br>&nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nb=
sp; LSize&nbsp;&nbsp; Origin Snap%&nbsp; Move Log Copy% <br>&nbsp; lv_home&=
nbsp;&nbsp;&nbsp;&nbsp; vg_fs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi-ao&nbsp; 14=
.00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; lv_opt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; vg_fs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi-ao&nbsp;&nbsp; 6.00G&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; <br>

&nbsp; lv_root&nbsp;&nbsp;&nbsp;&nbsp; vg_fs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
-wi-ao&nbsp;&nbsp; 1.00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; lv_usr&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; vg_fs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi-ao&nbsp; 10.0=
0G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; lv_var&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
vg_fs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi-ao&nbsp;&nbsp; 5.00G&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <br>&nbsp; lv_mythrec1 vg_mythtv&nbsp; -wi-ao&nbsp; 93.13G&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <br>

&nbsp; lv_mythrec2 vg_mythtv2 -wi-ao 143.06G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&n=
bsp; lv_share&nbsp;&nbsp;&nbsp; vg_share&nbsp;&nbsp; -wi-d- 144.00G&nbsp;&n=
bsp;&nbsp; <br>------------------------------------------------------------=
---------------<br><br># sudo vgdisplay -v /dev/vg_share<br>

&nbsp;&nbsp;&nbsp; Using volume group(s) on command line<br>&nbsp;&nbsp;&nb=
sp; Finding volume group &quot;vg_share&quot;<br>&nbsp; --- Volume group --=
-<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vg_share<br>&nbsp; System ID&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; Format&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; lvm2<br>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 3<br>

&nbsp; Metadata Sequence No&nbsp; 41<br>&nbsp; VG Access&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>&nbsp; =
VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; resizable<br>&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur LV&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 1<br>&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Max PV&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br=
>

&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>&nbsp; =
VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 186.36 GB<br>&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00 MB<br>&nbsp; Tot=
al PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 47708<br>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 36864 / 144.00 GB<br>&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 10844 / 42.36 GB<br>

&nbsp; VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; IpRQvV-EBVB-T32r-wuju-AL3M-9PEv-P0i0rz<br>&nbsp;&nb=
sp; <br>&nbsp; --- Logical volume ---<br>&nbsp; LV Name&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev=
/vg_share/lv_share<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg_share<br>&nbsp; LV U=
UID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Mm4Vve-9AJc-Pr1u-6RnO-bzLs-m0js-q8bf3m<br>

&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; available<br>&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<b=
r>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 144.00 GB<br>&nbsp; Current LE&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 36864<br>&nbsp;=
 Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 4<br>&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<br>

&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Block device&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 254:7<br>&nbsp;=
&nbsp; <br>&nbsp; --- Physical volumes ---<br>&nbsp; PV Name&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/=
sda7&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rWpPc9-wQGk-0V7W-C=
xO9-RYJo-dcOJ-emUerb<br>&nbsp; PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; allocatable<br>

&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 11921 / 10844<br>&nbsp;&nbsp; <=
br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda8&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; PV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; fiKdbI-mGve-GYYi-4Lbn-Q3SR-3Nda-a9qQxW<br>&nbsp; PV Status&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alloc=
atable<br>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 11921 / 0<br>

&nbsp;&nbsp; <br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda9&nbsp;&nbsp;&nbsp;&nbsp; =
<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; MqYeap-DFiH-eNWM-nhfa-TXcw-5mCi-ClCXEg<br>&nbsp=
; PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; allocatable<br>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 23866 /=
 0<br>---------------------------------------------------------------------=
------<br>

<br># sudo pvdisplay -v /dev/sda{7,8,9}<br>&nbsp;&nbsp;&nbsp; Using physica=
l volume(s) on command line<br>&nbsp; --- Physical volume ---<br>&nbsp; PV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /dev/sda7<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg_share<br>&nbsp; PV Si=
ze&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 46.57 GB / not usable 1.09 MB<br>

&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; yes <br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096=
<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 11921<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10844<br>&nbsp; All=
ocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1077<br>&nb=
sp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; rWpPc9-wQGk-0V7W-CxO9-RYJo-dcOJ-emUerb<br>

&nbsp;&nbsp; <br>&nbsp; --- Physical volume ---<br>&nbsp; PV Name&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/dev/sda8<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg_share<br>&nbsp; PV Size&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 46=
.57 GB / not usable 1.09 MB<br>&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<br>&nbsp; PE Size (KByte)=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>

&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 11921<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Allocated P=
E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11921<br>&nbsp; PV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; fiKdbI-mGve-GYYi-4Lbn-Q3SR-3Nda-a9qQxW<br>&nbsp;&nbsp; <br>&n=
bsp; --- Physical volume ---<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda9<br>

&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vg_share<br>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 93.23 GB / not =
usable 357.00 KB<br>&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<br>&nbsp; PE Size (KByte)&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23866<br>&nbsp; Free P=
E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0<br>

&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2=
3866<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MqYeap-DFiH-eNWM-nhfa-TXcw-5mCi-ClCXEg<br>-=
--------------------------------------------------------------------------<=
/div>

------=_Part_9963_30913313.1211572217137--
