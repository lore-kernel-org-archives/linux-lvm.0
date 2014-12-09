Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB99qwq9029386
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2014 04:52:58 -0500
Received: from relay16.mail.ox.ac.uk (relay16.mail.ox.ac.uk [163.1.2.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB99qscn030249
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2014 04:52:55 -0500
Received: from exchange-cas2.physics.ox.ac.uk ([163.1.74.83])
	by relay16.mail.ox.ac.uk with esmtp (Exim 4.80)
	(envelope-from <s.brisbane1@physics.ox.ac.uk>) id 1XyHTS-0004e5-pr
	for linux-lvm@redhat.com; Tue, 09 Dec 2014 09:52:54 +0000
From: Sean Brisbane <s.brisbane1@physics.ox.ac.uk>
Date: Tue, 9 Dec 2014 09:52:53 +0000
Message-ID: <C6A70F0B3785A04BA88C056A0B39627C21937A26@EXCHNG15.physics.ox.ac.uk>
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_C6A70F0B3785A04BA88C056A0B39627C21937A26EXCHNG15physics_"
MIME-Version: 1.0
Subject: [linux-lvm] thin provisioned volume failed - perhaps issues
	extending metadata?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_C6A70F0B3785A04BA88C056A0B39627C21937A26EXCHNG15physics_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Last night a thin provisioned volume with snapshots failed with errors. I a=
m not sure how to proceed with debugging this.

Errors such as this written to the console:

Buffer I/O error on device dm-6, logical block 153616394
lost page write due to I/O error on dm-6

I cant see what happened initially as the logs were not preserved after har=
d reboot. Now, when I try to mount (full logs at base of mail):

Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: reached low wa=
ter mark for metadata device: sending event.

So, I suspect I need to extend the metadata on the pool. The pool itself ha=
s plenty of space, and I, perhaps naively, assumed that combining metadata =
and data into one volume would avoid any metadata space issues.

So, I tried:

> ls /dev/mapper/VGData-thinpool1*
/dev/mapper/VGData-thinpool1
/dev/mapper/VGData-thinpool1_tdata
/dev/mapper/VGData-thinpool1_tmeta
/dev/mapper/VGData-thinpool1-tpool

> lvresize --poolmetadata +12M /dev/mapper/VGData-thinpool1

But when I try to mount:
Dec  9 09:37:04 pplxfs13 lvm[1698]: Thin metadata VGData-thinpool1-tpool is=
 now 99% full.

The lvresize operation had some effect:

diff dmsetup_table_post dmsetup_table_pre
11c11
< VGData-thinpool1_tmeta: 163840 98304 linear 8:16 76229298176
---
> VGData-thinpool1_tmeta: 163840 73728 linear 8:16 76229298176


In addition, the snapshots of this volume refuse to activate, so I appear t=
o be unable to delete any of the 40 or so snapshots.

Is there anything I can do to recover from this or other things I can try t=
o help debug the issue?

Thanks in advance,
Sean

Full logs

messages:

Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: reached low wa=
ter mark for metadata device: sending event.
Dec  9 08:52:22 pplxfs13 kernel: device-mapper: space map metadata: unable =
to allocate new metadata block
Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: metadata opera=
tion 'dm_thin_insert_block' failed: error =3D -28
Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: aborting curre=
nt metadata transaction
Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: switching pool=
 to read-only mode
Dec  9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logical b=
lock 153616394
Dec  9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on dm-6
Dec  9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logical b=
lock 153616395
Dec  9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on dm-6
[...more of these...]
Dec  9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logical b=
lock 154140676
Dec  9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on dm-6
Dec  9 08:52:22 pplxfs13 kernel: JBD: recovery failed
Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-6): error loading journal
Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-14): recovery complete
Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-14): mounted filesystem with o=
rdered data mode. Opts:
Dec  9 08:52:22 pplxfs13 kernel: JBD: recovery failed
Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-6): error loading journal


lvscan | grep thin
  thin-lwfa        VGData Vwi-a-tz--   9.20t thinpool1            99.10
  thin-lwfa-141025 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141026 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141027 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141028 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141029 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141030 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141031 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141101 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141102 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141103 VGData Vri---tz-k   9.00t thinpool1 thin-lwfa
  thin-lwfa-141104 VGData Vri---tz-k   9.10t thinpool1 thin-lwfa
  thin-lwfa-141105 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141106 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141107 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141108 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141109 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141110 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141111 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141112 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141113 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141114 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141115 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141116 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141117 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141118 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141119 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141120 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141121 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141122 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141123 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141124 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141125 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141126 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141127 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141128 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141129 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141130 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141201 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141202 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141203 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141204 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141205 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141206 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141207 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141208 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thin-lwfa-141209 VGData Vri---tz-k   9.20t thinpool1 thin-lwfa
  thinpool1        VGData twi-a-tz--  20.00t                      64.07


--_000_C6A70F0B3785A04BA88C056A0B39627C21937A26EXCHNG15physics_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi,<br>
<br>
Last night a thin provisioned volume with snapshots failed with errors. I a=
m not sure how to proceed with debugging this.<br>
<br>
Errors such as this written to the console:<br>
<br>
Buffer I/O error on device dm-6, logical block 153616394<br>
lost page write due to I/O error on dm-6<br>
<br>
I cant see what happened initially as the logs were not preserved after har=
d reboot. Now, when I try to mount (full logs at base of mail):<br>
<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: reached l=
ow water mark for metadata device: sending event.<br>
<br>
So, I suspect I need to extend the metadata on the pool. The pool itself ha=
s plenty of space, and I, perhaps naively, assumed that combining metadata =
and data into one volume would avoid any metadata space issues.<br>
<br>
So, I tried:<br>
<br>
&gt; ls /dev/mapper/VGData-thinpool1*<br>
/dev/mapper/VGData-thinpool1&nbsp; <br>
/dev/mapper/VGData-thinpool1_tdata&nbsp; <br>
/dev/mapper/VGData-thinpool1_tmeta&nbsp; <br>
/dev/mapper/VGData-thinpool1-tpool<br>
<br>
&gt; lvresize --poolmetadata &#43;12M /dev/mapper/VGData-thinpool1<br>
<br>
But when I try to mount:<br>
Dec&nbsp; 9 09:37:04 pplxfs13 lvm[1698]: Thin metadata VGData-thinpool1-tpo=
ol is now 99% full.<br>
<br>
The lvresize operation had some effect:<br>
<br>
diff dmsetup_table_post dmsetup_table_pre<br>
11c11<br>
&lt; VGData-thinpool1_tmeta: 163840 98304 linear 8:16 76229298176<br>
---<br>
&gt; VGData-thinpool1_tmeta: 163840 73728 linear 8:16 76229298176<br>
<br>
<br>
In addition, the snapshots of this volume refuse to activate, so I appear t=
o be unable to delete any of the 40 or so snapshots.<br>
<br>
Is there anything I can do to recover from this or other things I can try t=
o help debug the issue?<br>
<br>
Thanks in advance,<br>
Sean<br>
<br>
Full logs <br>
<br>
messages:<br>
<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: reached l=
ow water mark for metadata device: sending event.<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: device-mapper: space map metadata: un=
able to allocate new metadata block<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: metadata =
operation 'dm_thin_insert_block' failed: error =3D -28<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: aborting =
current metadata transaction<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: switching=
 pool to read-only mode<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logi=
cal block 153616394<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on d=
m-6<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logi=
cal block 153616395<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on d=
m-6<br>
[...more of these...]<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logi=
cal block 154140676<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on d=
m-6<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: JBD: recovery failed<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-6): error loading journal=
<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-14): recovery complete<br=
>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-14): mounted filesystem w=
ith ordered data mode. Opts:
<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: JBD: recovery failed<br>
Dec&nbsp; 9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-6): error loading journal=
<br>
<br>
<br>
lvscan | grep thin<br>
&nbsp; thin-lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VGData Vwi-a-tz-=
-&nbsp;&nbsp; 9.20t thinpool1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 99.10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141025 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141026 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141027 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141028 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141029 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141030 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141031 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141101 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141102 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141103 VGData Vri---tz-k&nbsp;&nbsp; 9.00t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141104 VGData Vri---tz-k&nbsp;&nbsp; 9.10t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141105 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141106 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141107 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141108 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141109 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141110 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141111 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141112 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141113 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141114 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141115 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141116 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141117 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141118 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141119 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141120 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141121 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141122 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141123 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141124 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141125 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141126 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141127 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141128 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141129 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141130 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141201 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141202 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141203 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141204 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141205 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141206 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141207 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141208 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thin-lwfa-141209 VGData Vri---tz-k&nbsp;&nbsp; 9.20t thinpool1 thin-=
lwfa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp; thinpool1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VGData twi-a-tz-=
-&nbsp; 20.00t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.07&nbs=
p; <br>
<br>
</div>
</body>
</html>

--_000_C6A70F0B3785A04BA88C056A0B39627C21937A26EXCHNG15physics_--
