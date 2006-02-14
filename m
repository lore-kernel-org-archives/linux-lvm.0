Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1E0ew104856
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 19:40:58 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.205])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1E0et4S009964
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 19:40:55 -0500
Received: by zproxy.gmail.com with SMTP id 16so1123011nzp
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 16:40:54 -0800 (PST)
Message-ID: <1417e79c0602131640l47b21c37o4ababa566bb53bf9@mail.gmail.com>
Date: Mon, 13 Feb 2006 21:40:54 -0300
From: Garcia JR <garciajr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_24342_22739761.1139877654372"
Subject: [linux-lvm] Recognizing VG in another machine
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

------=_Part_24342_22739761.1139877654372
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi PPL, little question.

Supposing i have 1 HD with 2 pvs (hda1 and hda3) in VG named VG01 and LV
named lv01 working successfully in MACHINE1.

root@solid:/etc/lvmconf# lvscan
lvscan -- ACTIVE            "/dev/vg01/lv01" [704 MB]
lvscan -- 1 logical volumes with 704 MB total in 1 volume group
lvscan -- 1 active logical volumes

root@solid:/etc/lvmconf# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda1" of VG "vg01" [1.41 GB / 1.41 GB free]
pvscan -- ACTIVE   PV "/dev/hda3" of VG "vg01" [1.41 GB / 736 MB free]
pvscan -- total: 2 [2.91 GB] / in use: 2 [2.91 GB] / in no VG: 0 [0]

Supposing again: MACHINE1 is down and I need to put VG above in another
server, named MACHINE2. I Will remove HD from MACHINE1 and put in MACHINE2.

What the nexts steps i will have to follow to make VG be recognized by
MACHINE2 exactly how was in MACHINE1 without lose data?

regards,

------=_Part_24342_22739761.1139877654372
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi PPL, little question.</div>
<div>&nbsp;</div>
<div>Supposing i have 1 HD with 2 pvs (hda1 and hda3) in VG named VG01 and =
LV named lv01 working successfully in MACHINE1.</div>
<div>&nbsp;</div>
<div><a href=3D"mailto:root@solid:/etc/lvmconf">root@solid:/etc/lvmconf</a>=
# lvscan<br>lvscan -- ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &quot;/dev/vg01/lv01&quot; [704 MB]<br>lvscan -- 1 logi=
cal volumes with 704 MB total in 1 volume group<br>lvscan -- 1 active logic=
al volumes
</div>
<div>
<p><a href=3D"mailto:root@solid:/etc/lvmconf">root@solid:/etc/lvmconf</a># =
pvscan<br>pvscan -- reading all physical volumes (this may take a while...)=
<br>pvscan -- ACTIVE&nbsp;&nbsp; PV &quot;/dev/hda1&quot; of VG &quot;vg01&=
quot; [
1.41 GB / 1.41 GB free]<br>pvscan -- ACTIVE&nbsp;&nbsp; PV &quot;/dev/hda3&=
quot; of VG &quot;vg01&quot; [1.41 GB / 736 MB free]<br>pvscan -- total: 2 =
[2.91 GB] / in use: 2 [2.91 GB] / in no VG: 0 [0]</p>
<p>Supposing again: MACHINE1 is down and I need to put VG above in another =
server, named MACHINE2. I Will remove HD from MACHINE1 and put in MACHINE2.=
&nbsp;</p>
<p>What the nexts steps i will have to follow to make VG be recognized by M=
ACHINE2 exactly&nbsp;how was in MACHINE1 without lose data?</p>
<p>regards,</p></div>

------=_Part_24342_22739761.1139877654372--
