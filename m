Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7LIuLHc008937
	for <linux-lvm@redhat.com>; Thu, 21 Aug 2014 14:56:21 -0400
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7LIuIqI015881
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 21 Aug 2014 14:56:19 -0400
Received: by mail-yk0-f173.google.com with SMTP id 131so7981474ykp.18
	for <linux-lvm@redhat.com>; Thu, 21 Aug 2014 11:56:18 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 Aug 2014 11:56:16 -0700
Message-ID: <CAAN_kG240oAowJJDNpmBQ7Q7Sjxc624RLoKz+EG9H3nV3ubKdg@mail.gmail.com>
From: Timur Alperovich <timur@maginatics.com>
Content-Type: multipart/alternative; boundary=20cf301b63df991919050128460f
Subject: [linux-lvm] 2.02.98: lvs returns "dm_report_object: report function
 failed for field data_percent" after issuing lvchange --discards
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
To: linux-lvm@redhat.com

--20cf301b63df991919050128460f
Content-Type: text/plain; charset=UTF-8

Hi there,

I noticed that there is a transient and benign (I can't discern any adverse
effects) error reported by lvs after running lvchange --discards passdown.
I wrote a simple script that eventually reproduces it (at the bottom of the
email).

I have also been performing these tests *without* thin_check being enabled
on volume activation. I don't know if it makes any difference, but with
thin_check I noticed that I frequently get device busy errors or that
lvchange can't change the state of an active volume (even though lvchange
-a n is issued for the pool beforehand).

The error itself is: dm_report_object: report function failed for field
data_percent. The output of the lvs command at that point is:
LV                                                   VG         Attr
 LSize  Pool Origin      Data%  Move Log Copy%  Convert
TrollVolume                                          TrollGroup Vwi-i-tz-
23.90g pool
pool                                                 TrollGroup twi-a-tz-
23.90g                    2.60
troll_snapshot_3_11_941fa1b380d748c5a5ee446ee5817960 TrollGroup Vwi---tz-
23.90g pool TrollVolume
troll_snapshot_3_13_e48750c4c0cc47e88a80f278cee8616d TrollGroup Vwi---tz-
23.90g pool TrollVolume
troll_snapshot_3_14_075ec8acaebb4964a1afa62c53fff7de TrollGroup Vwi---tz-
23.90g pool TrollVolume
troll_snapshot_3_17_59135a4db9c74fc8bb78346d976b6ba2 TrollGroup Vwi---tz-
23.90g pool TrollVolume
troll_snapshot_3_19_965c49f78f504e1cbe897f7de8c2e07d TrollGroup Vwi---tz-
23.90g pool TrollVolume
troll_snapshot_3_4_e77e18ec7faf4b8b987999588d3e01b7  TrollGroup Vwi---tz-
23.90g pool TrollVolume
troll_snapshot_3_5_d50e703f9cd94a1c93d77055fe4db2a8  TrollGroup Vwi---tz-
23.90g pool TrollVolume
troll_snapshot_3_7_80f0c30ae46e4bc696b650327b9923a0  TrollGroup Vwi---tz-
23.90g pool TrollVolume

Note that the first volume, TrollVolume, is in the inactive table state (mapped
device present with (i)nactive table). It looks like it's transitioning
into the active state at this point and there seems to be a race?

I'm doing all of this with kernel 3.8.0-32-generic on Ubuntu 12.04 LTS (lvm
tools were backported to the 12.04 release).

Does anyone know if this is a known issue and whether an upgrade to a newer
version of lvm tools (or kernel) would fix this?

One more question: I observe that lvchange --discards passdown activates
the pool and all volumes in it. It seems that one does not have to
explicitly do lvchange -a y after disabling the volumes and issuing
lvchange --discards. Does that seem right? I couldn't find any
documentation about this, however.

Thank you,
Timur

The script:

#!/bin/bash

set -e

while true; do
        echo 'deactivate'
        # /tmp/volumes is populated with the output of ls /dev/test_group
        for i in `cat /tmp/volumes`; do sudo lvchange -a n test_group/$i;
done
        echo 'ignore'
        sudo lvchange --discards ignore test_group/pool
        echo 'passdown'
        sudo lvchange --discards passdown test_group/pool
        echo 'lvs'
        sudo lvs
        echo 'activate'
        for i in `cat /tmp/volumes`; do sudo lvchange -a y test_group/$i;
done
done

--20cf301b63df991919050128460f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there,<div><br></div><div>I noticed that there is a tra=
nsient and benign (I can&#39;t discern any adverse effects) error reported =
by lvs after running lvchange --discards passdown. I wrote a simple script =
that eventually reproduces it (at the bottom of the email).</div>
<div><br>I have also been performing these tests *without* thin_check being=
 enabled on volume activation. I don&#39;t know if it makes any difference,=
 but with thin_check I noticed that I frequently get device busy errors or =
that lvchange can&#39;t change the state of an active volume (even though l=
vchange -a n is issued for the pool beforehand).</div>
<div><br></div><div>The error itself is:=C2=A0<font color=3D"#484848" style=
=3D"background-color:rgb(250,250,250)"><span style=3D"font-size:12px">dm_re=
port_object: report function failed for field data_percent. The output of t=
he lvs command at that point is:</span></font><br>
<div style=3D"background-color:rgb(250,250,250)"><font color=3D"#484848"><s=
pan style=3D"font-size:12px">LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Attr =C2=A0 =C2=A0 =C2=A0LSize =C2=A0Pool Origin =C2=A0 =
=C2=A0 =C2=A0Data% =C2=A0Move Log Copy% =C2=A0Convert</span></font></div>
<div style=3D"background-color:rgb(250,250,250)"><font color=3D"#484848"><s=
pan style=3D"font-size:12px">TrollVolume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TrollGroup Vwi-i-tz- 23.90g pool =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></font></div><div style=3D"bac=
kground-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">pool =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 TrollGroup twi-a-tz- 23.90g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.60 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></font></div><div style=
=3D"background-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_11_=
941fa1b380d748c5a5ee446ee5817960 TrollGroup Vwi---tz- 23.90g pool TrollVolu=
me =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></font></div><div style=3D"b=
ackground-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_13_=
e48750c4c0cc47e88a80f278cee8616d TrollGroup Vwi---tz- 23.90g pool TrollVolu=
me =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></font></div><div style=3D"b=
ackground-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_14_=
075ec8acaebb4964a1afa62c53fff7de TrollGroup Vwi---tz- 23.90g pool TrollVolu=
me =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></font></div><div style=3D"b=
ackground-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_17_=
59135a4db9c74fc8bb78346d976b6ba2 TrollGroup Vwi---tz- 23.90g pool TrollVolu=
me =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></font></div><div style=3D"b=
ackground-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_19_=
965c49f78f504e1cbe897f7de8c2e07d TrollGroup Vwi---tz- 23.90g pool TrollVolu=
me =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></font></div><div style=3D"b=
ackground-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_4_e=
77e18ec7faf4b8b987999588d3e01b7 =C2=A0TrollGroup Vwi---tz- 23.90g pool Trol=
lVolume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></font></div><div style=
=3D"background-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_5_d=
50e703f9cd94a1c93d77055fe4db2a8 =C2=A0TrollGroup Vwi---tz- 23.90g pool Trol=
lVolume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></font></div><div style=
=3D"background-color:rgb(250,250,250)">
<font color=3D"#484848"><span style=3D"font-size:12px">troll_snapshot_3_7_8=
0f0c30ae46e4bc696b650327b9923a0 =C2=A0TrollGroup Vwi---tz- 23.90g pool Trol=
lVolume</span></font></div><div style=3D"background-color:rgb(250,250,250)"=
><font color=3D"#484848"><span style=3D"font-size:12px"><br>
</span></font></div><div style=3D"background-color:rgb(250,250,250)"><font =
color=3D"#484848"><span style=3D"font-size:12px">Note that the first volume=
, TrollVolume, is in the inactive table state (</span></font><span style=3D=
"font-size:12px;background-color:rgb(255,255,255)"><font color=3D"#484848">=
mapped device present with (i)nactive table). It looks like it&#39;s transi=
tioning into the active state at this point and there seems to be a race?</=
font></span></div>
<div style=3D"background-color:rgb(250,250,250)"><span style=3D"font-size:1=
2px;background-color:rgb(255,255,255)"><font color=3D"#484848"><br></font><=
/span></div><div><font color=3D"#484848"><span style=3D"font-size:12px;back=
ground-color:rgb(255,255,255)">I&#39;m doing all of this with kernel 3.8.0-=
32-generic on Ubuntu 12.04 LTS (lvm tools were backported to the 12.04 rele=
ase).</span></font></div>
<div style=3D"background-color:rgb(250,250,250)"><span style=3D"font-size:1=
2px;background-color:rgb(255,255,255)"><font color=3D"#484848"><br></font><=
/span></div><div style=3D"background-color:rgb(250,250,250)"><span style=3D=
"font-size:12px;background-color:rgb(255,255,255)"><font color=3D"#484848">=
Does anyone know if this is a known issue and whether an upgrade to a newer=
 version of lvm tools (or kernel) would fix this?</font></span></div>
<div style=3D"background-color:rgb(250,250,250)"><span style=3D"font-size:1=
2px;background-color:rgb(255,255,255)"><font color=3D"#484848"><br></font><=
/span></div><div style=3D"background-color:rgb(250,250,250)"><span style=3D=
"font-size:12px;background-color:rgb(255,255,255)"><font color=3D"#484848">=
One more question: I observe that lvchange --discards passdown activates th=
e pool and all volumes in it. It seems that one does not have to explicitly=
 do lvchange -a y after disabling the volumes and issuing lvchange --discar=
ds. Does that seem right? I couldn&#39;t find any documentation about this,=
 however.</font></span></div>
<div style=3D"background-color:rgb(250,250,250)"><span style=3D"font-size:1=
2px;background-color:rgb(255,255,255)"><font color=3D"#484848"><br></font><=
/span></div><div style=3D"background-color:rgb(250,250,250)"><span style=3D=
"font-size:12px;background-color:rgb(255,255,255)"><font color=3D"#484848">=
Thank you,</font></span></div>
<div style=3D"background-color:rgb(250,250,250)"><span style=3D"font-size:1=
2px;background-color:rgb(255,255,255)"><font color=3D"#484848">Timur</font>=
</span></div><div style=3D"background-color:rgb(250,250,250)"><span style=
=3D"font-size:12px;background-color:rgb(255,255,255)"><font color=3D"#48484=
8"><br>
</font></span></div><div style=3D"background-color:rgb(250,250,250)"><span =
style=3D"font-size:12px;background-color:rgb(255,255,255)"><font color=3D"#=
484848">The script:</font></span></div><div style=3D"background-color:rgb(2=
50,250,250)">
<span style=3D"font-size:12px;background-color:rgb(255,255,255)"><font colo=
r=3D"#484848"><br></font></span></div><div style=3D"background-color:rgb(25=
0,250,250)"><span style=3D"font-size:12px;background-color:rgb(255,255,255)=
"><font color=3D"#484848"><div style=3D"background-color:rgb(250,250,250)">
#!/bin/bash</div><div style=3D"background-color:rgb(250,250,250)"><br></div=
><div style=3D"background-color:rgb(250,250,250)">set -e</div><div style=3D=
"background-color:rgb(250,250,250)"><br></div><div style=3D"background-colo=
r:rgb(250,250,250)">
while true; do</div><div style=3D"background-color:rgb(250,250,250)">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 echo &#39;deactivate&#39;</div><div style=3D"backgrou=
nd-color:rgb(250,250,250)">=C2=A0 =C2=A0 =C2=A0 =C2=A0 # /tmp/volumes is po=
pulated with the output of ls /dev/test_group</div>
<div style=3D"background-color:rgb(250,250,250)">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for i in `cat /tmp/volumes`; do sudo lvchange -a n test_group/$i; done<=
/div><div style=3D"background-color:rgb(250,250,250)">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo &#39;ignore&#39;<br></div><div style=3D"background-color:rgb(25=
0,250,250)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sudo lvchange --discards ignore test_group/pool=
</div><div style=3D"background-color:rgb(250,250,250)">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 echo &#39;passdown&#39;</div><div style=3D"background-color:rgb(250=
,250,250)">=C2=A0 =C2=A0 =C2=A0 =C2=A0 sudo lvchange --discards passdown te=
st_group/pool</div>
<div style=3D"background-color:rgb(250,250,250)">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &#39;lvs&#39;</div><div style=3D"background-color:rgb(250,250,250)=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 sudo lvs</div><div style=3D"background-color:=
rgb(250,250,250)">=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;activate&#39;</div>
<div style=3D"background-color:rgb(250,250,250)">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for i in `cat /tmp/volumes`; do sudo lvchange -a y test_group/$i; done<=
/div><div style=3D"background-color:rgb(250,250,250)">done</div></font></sp=
an></div></div></div>

--20cf301b63df991919050128460f--
