Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4SIevUh006466
	for <linux-lvm@redhat.com>; Mon, 28 May 2012 14:40:57 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4SIeX3G028559
	for <linux-lvm@redhat.com>; Mon, 28 May 2012 14:40:56 -0400
Received: by mail-ey0-f174.google.com with SMTP id k11so866385eaa.33
	for <linux-lvm@redhat.com>; Mon, 28 May 2012 11:40:56 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 29 May 2012 00:10:56 +0530
Message-ID: <CAGQjrKZ0CD7O8_KYBd+KvBmK0nnxxoWc+5sm0Pk+XYkZEq3vOQ@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=90e6ba5bbb65f9210704c11d0ef9
Subject: [linux-lvm] LVM2 recovery on IP-SAN after OS re-install
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

--90e6ba5bbb65f9210704c11d0ef9
Content-Type: text/plain; charset=ISO-8859-1

Hi,
 We had an OS crash on x86_64 CentOS , LVM2 and it had 6TB LUN  via  IP
SCSI SAN mounted to it and after the OS reinstall on a crash we had hard
time to mount the original SAN volume as you can imagine 6TB
of marketing data with 3 LVM partitions as data data1 and data2 . After
troubleshooting almost for a day I was able to get the LVM metadata using
dd from the SAN LUN /dev/sdd1 which I used to recreate and restore all LVM
partitions back to original state , we sure became the raving fans of LVM
today ! however after all the recovery I see this annoying warning each
time I execute any of the lvm commands ..

lvs
*  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using
/dev/sdd1 not/dev/sdc1
*
  LV    VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
  data  vg0  -wi-ao 2.00T
  data1 vg0  -wi-ao 2.00T
  data2 vg0  -wi-ao 1.44T


I believe previously we had  created PV using /dev/sdd1 and /dev/sdc1
although from the same LUN but now I was able to restore everything using
just /dev/sdd1 and everything looks intact (until I hear marketing whine
tom:)

vgs -o +devices
  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not
/dev/sdc1
  VG   #PV #LV #SN Attr   VSize VFree Devices
  vg0    1   3   0 wz--n- 5.45T 8.06G /dev/sdd1(0)
  vg0    1   3   0 wz--n- 5.45T 8.06G /dev/sdd1(524288)
  vg0    1   3   0 wz--n- 5.45T 8.06G /dev/sdd1(1048576)


 lvs -P -a -o +devices
  Partial mode. Incomplete logical volumes will be processed.
  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not
/dev/sdc1
  LV    VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert Devices

  data  vg0  -wi-ao 2.00T
/dev/sdd1(0)
  data1 vg0  -wi-ao 2.00T
/dev/sdd1(524288)
  data2 vg0  -wi-ao 1.44T
/dev/sdd1(1048576)

I tried to fix this by but it just won't go..
vgreduce --removemissing vg0
  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not
/dev/sdc1
  Volume group "vg0" is already consistent

why does LVM think that it's still using PV ( /dev/sdc1 ) when it no more
exists ? and how do i get rid of it ?

I also see some of these in syslog messages

hfs: unable to find HFS+ superblock
hfs: unable to find HFS+ superblock
VFS: Can't find ext3 filesystem on dev sdc1.
VFS: Can't find ext3 filesystem on dev sdc1.
hfs: unable to find HFS+ superblock
VFS: Can't find ext3 filesystem on dev sdc1.
VFS: Can't find ext3 filesystem on dev sdc1.
VFS: Can't find ext3 filesystem on dev sdd1.

thx,
Tariq

--90e6ba5bbb65f9210704c11d0ef9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,
<div>=A0We had an OS crash on=A0x86_64 CentOS , LVM2 and it had 6TB LUN =A0=
via =A0IP SCSI SAN mounted to it and after the OS reinstall on a crash we h=
ad hard time to mount the original SAN volume as you can imagine 6TB of=A0m=
arketing=A0data with 3 LVM partitions as data data1 and data2 . After troub=
leshooting almost for a day I was able to get the LVM metadata using dd fro=
m the SAN LUN=A0/dev/sdd1 which I used to recreate and restore all LVM part=
itions back to original state , we sure became the raving fans of LVM today=
 ! however after all the recovery I see this annoying warning each time I e=
xecute any of the lvm commands ..</div>
<div><br></div><div>lvs</div><div><b>=A0 Found duplicate PV XtGmeFOiCTWpLBc=
kKZKlGtYKPVdBgVJn: using /dev/sdd1 not<span style=3D"background-color:rgb(2=
55,255,255)"><font color=3D"#ff0000"> /dev/sdc1</font></span></b></div><div=
>=A0 LV =A0 =A0VG =A0 Attr =A0 LSize Origin Snap% =A0Move Log Copy% =A0Conv=
ert</div>
<div>=A0 data =A0vg0 =A0-wi-ao 2.00T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>=A0 data1 vg0 =A0-wi-ao 2=
.00T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0</div><div>=A0 data2 vg0 =A0-wi-ao 1.44T =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
<div>=A0</div><div><br></div><div>I believe previously we had =A0created PV=
 using /dev/sdd1 and /dev/sdc1 although from the same LUN but now I was abl=
e to restore everything using just /dev/sdd1 and everything looks intact (u=
ntil I hear marketing whine tom:)</div>
<div><br></div><div><div>vgs -o +devices</div><div>=A0 Found duplicate PV X=
tGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not /dev/sdc1</div><div>=
=A0 VG =A0 #PV #LV #SN Attr =A0 VSize VFree Devices =A0 =A0 =A0 =A0 =A0=A0<=
/div><div>=A0 vg0 =A0 =A01 =A0 3 =A0 0 wz--n- 5.45T 8.06G /dev/sdd1(0) =A0 =
=A0 =A0</div>
<div>=A0 vg0 =A0 =A01 =A0 3 =A0 0 wz--n- 5.45T 8.06G /dev/sdd1(524288)=A0</=
div><div>=A0 vg0 =A0 =A01 =A0 3 =A0 0 wz--n- 5.45T 8.06G /dev/sdd1(1048576)=
</div><div><br></div></div><div><br></div><div><div>=A0lvs -P -a -o +device=
s</div><div>=A0 Partial mode. Incomplete logical volumes will be processed.=
</div>
<div>=A0 Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sd=
d1 not /dev/sdc1</div><div>=A0 LV =A0 =A0VG =A0 Attr =A0 LSize Origin Snap%=
 =A0Move Log Copy% =A0Convert Devices =A0 =A0 =A0 =A0 =A0=A0</div><div>=A0 =
data =A0vg0 =A0-wi-ao 2.00T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdd1(0) =A0 =A0 =A0</div>
<div>=A0 data1 vg0 =A0-wi-ao 2.00T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdd1(524288)=A0</div><div>=A0 data=
2 vg0 =A0-wi-ao 1.44T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 /dev/sdd1(1048576)</div><div><br></div></div><div>I=
 tried to fix this by but it just won&#39;t go..</div>
<div><div>vgreduce --removemissing vg0</div><div>=A0 Found duplicate PV XtG=
meFOiCTWpLBckKZKlGtYKPVdBgVJn: using /dev/sdd1 not /dev/sdc1</div><div>=A0 =
Volume group &quot;vg0&quot; is already consistent</div></div><div><br></di=
v>
<div>why does LVM think that it&#39;s still using PV (=A0/dev/sdc1 ) when i=
t no more exists ? and how do i get rid of it ?</div><div><br></div><div>I =
also see some of these in syslog messages</div><div><br></div><div><div>hfs=
: unable to find HFS+ superblock</div>
<div>hfs: unable to find HFS+ superblock</div><div>VFS: Can&#39;t find ext3=
 filesystem on dev sdc1.</div><div>VFS: Can&#39;t find ext3 filesystem on d=
ev sdc1.</div><div>hfs: unable to find HFS+ superblock</div><div>VFS: Can&#=
39;t find ext3 filesystem on dev sdc1.</div>
<div>VFS: Can&#39;t find ext3 filesystem on dev sdc1.</div><div>VFS: Can&#3=
9;t find ext3 filesystem on dev sdd1.</div></div><div><br></div><div>thx,</=
div><div>Tariq</div><div><br></div></div>

--90e6ba5bbb65f9210704c11d0ef9--
