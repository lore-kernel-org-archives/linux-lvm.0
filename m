Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t989HIgj002411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 8 Oct 2015 05:17:18 -0400
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mx1.redhat.com (Postfix) with ESMTPS id 7EB89C07585F
	for <linux-lvm@redhat.com>; Thu,  8 Oct 2015 09:17:17 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so10490393igb.0
	for <linux-lvm@redhat.com>; Thu, 08 Oct 2015 02:17:16 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 8 Oct 2015 12:17:16 +0300
Message-ID: <CADxRZqwQ4u66WWDCRQXe-zGrnhzxZjmFgNB27c0eFgYop9++uw@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bdc0cd84e595805219454eb
Subject: [linux-lvm] mirror volume split
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

--047d7bdc0cd84e595805219454eb
Content-Type: text/plain; charset=UTF-8

Hello!

Trying to split one of mirror volumes :

# lvs
  LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
Move Log Cpy%Sync Convert
  gatewayVol          vg1  rwi-aor---
8.00g                                    100.00

# lvconvert --splitmirrors 1 -n split1 vg1/gatewayVol
# lvs
  LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
Move Log Cpy%Sync Convert
  gatewayVol          vg1  -wi-ao----   8.00g
  split1              vg1  -wi-a-----   8.00g

converting original volume back to mirror configuration, leaving split1
volume intact:

# lvconvert -m1 vg1/gatewayVol
  device-mapper: create ioctl on vg1-gatewayVol_rimage_1 failed: Device or
resource busy
  Failed to lock logical volume vg1/gatewayVol.

# lvs
  LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
Move Log Cpy%Sync Convert
  gatewayVol          vg1  -wi-ao----   8.00g
  gatewayVol_rimage_1 vg1  -wi-------   8.00g
  gatewayVol_rmeta_0  vg1  -wi-a-----   4.00m
  gatewayVol_rmeta_1  vg1  -wi-a-----   4.00m
  split1              vg1  -wi-a-----   8.00g

So, what I should do now? What is rimage* and rmeta* ? How do I get rid of
them, preserving data on gatewayVol and split1 volumes?

Thanks.

PS: opensuse 13.2

# lvm version
  LVM version:     2.02.114(2) (2014-11-28)
  Library version: 1.03.01 (2014-11-28)
  Driver version:  4.27.0

--047d7bdc0cd84e595805219454eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hello!<br><br></div><div class=3D"gmail_default" style=3D"font-=
family:verdana,sans-serif">Trying to split one of mirror volumes :<br><br><=
span style=3D"font-family:monospace,monospace"># lvs<br></span><span style=
=3D"font-family:monospace,monospace"><span style=3D"font-family:monospace,m=
onospace">=C2=A0 LV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=C2=A0 Attr=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LSize=C2=A0=C2=A0 Pool Origin Data%=C2=A0 Me=
ta%=C2=A0 Move Log Cpy%Sync Convert</span>=C2=A0 <br>=C2=A0 gatewayVol=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vg1=C2=A0 rwi-aor---=C2=
=A0=C2=A0 8.00g=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 100.00<br><br></span></div><div class=3D"gmail_default" style=3D"font-fami=
ly:verdana,sans-serif"><span style=3D"font-family:monospace,monospace"># lv=
convert --splitmirrors 1 -n split1 vg1/gatewayVol<br># lvs<br>=C2=A0 LV=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=C2=A0 Attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 LSize=C2=A0=C2=A0 Pool Origin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%S=
ync Convert<br>=C2=A0 gatewayVol=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 vg1=C2=A0 -wi-ao----=C2=A0=C2=A0 8.00g<br>=C2=A0 split1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vg=
1=C2=A0 -wi-a-----=C2=A0=C2=A0 8.00g</span><br><br></div><div class=3D"gmai=
l_default" style=3D"font-family:verdana,sans-serif">converting original vol=
ume back to mirror configuration, leaving split1 volume intact:<br><br><spa=
n style=3D"font-family:monospace,monospace"># lvconvert -m1 vg1/gatewayVol<=
br>=C2=A0 device-mapper: create ioctl on vg1-gatewayVol_rimage_1 failed: De=
vice or resource busy<br>=C2=A0 Failed to lock logical volume vg1/gatewayVo=
l.<br></span><br><span style=3D"font-family:monospace,monospace"># lvs<br>=
=C2=A0 LV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=C2=A0 Attr=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 LSize=C2=A0=C2=A0 Pool Origin Data%=C2=A0 Meta%=C2=A0 Mo=
ve Log Cpy%Sync Convert<br>=C2=A0 gatewayVol=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 vg1=C2=A0 -wi-ao----=C2=A0=C2=A0 8.00g<br>=C2=A0 g=
atewayVol_rimage_1 vg1=C2=A0 -wi-------=C2=A0=C2=A0 8.00g<br>=C2=A0 gateway=
Vol_rmeta_0=C2=A0 vg1=C2=A0 -wi-a-----=C2=A0=C2=A0 4.00m<br>=C2=A0 gatewayV=
ol_rmeta_1=C2=A0 vg1=C2=A0 -wi-a-----=C2=A0=C2=A0 4.00m<br>=C2=A0 split1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 vg1=C2=A0 -wi-a-----=C2=A0=C2=A0 8.00g<br>=C2=A0 <br></span></div><div cla=
ss=3D"gmail_default" style=3D"font-family:verdana,sans-serif">So, what I sh=
ould do now? What is rimage* and rmeta* ? How do I get rid of them, preserv=
ing data on gatewayVol and split1 volumes? <br><br></div><div class=3D"gmai=
l_default" style=3D"font-family:verdana,sans-serif">Thanks.<br><br></div><d=
iv class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">PS: ope=
nsuse 13.2<br><br># lvm version=C2=A0 <br>=C2=A0 LVM version:=C2=A0=C2=A0=
=C2=A0=C2=A0 2.02.114(2) (2014-11-28)<br>=C2=A0 Library version: 1.03.01 (2=
014-11-28)<br>=C2=A0 Driver version:=C2=A0 4.27.0<br></div></div>

--047d7bdc0cd84e595805219454eb--
