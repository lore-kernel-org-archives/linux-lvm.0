Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u151Losx015896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 4 Feb 2016 20:21:50 -0500
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mx1.redhat.com (Postfix) with ESMTPS id DC2E03F3B2
	for <linux-lvm@redhat.com>; Fri,  5 Feb 2016 01:21:48 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id l143so47925640lfe.2
	for <linux-lvm@redhat.com>; Thu, 04 Feb 2016 17:21:48 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 5 Feb 2016 09:21:46 +0800
Message-ID: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
From: Mars <kirapangzi@gmail.com>
Content-Type: multipart/alternative; boundary=001a113fbf92bb8838052afbaca8
Subject: [linux-lvm] Repair thin pool
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

--001a113fbf92bb8838052afbaca8
Content-Type: text/plain; charset=UTF-8

Hi there,

We're using Centos 7.0 with lvm 2.02.105 and met a problem as underlying:
After a electricity powerdown in the datacenter room, thin provision
volumes came up with wrong states:

*[root@storage ~]# lvs -a*
*  dm_report_object: report function failed for field data_percent*
*  LV                              VG               Attr       LSize
Pool        Origin           Data%  Move Log Cpy%Sync Convert*
*  DailyBuild                      vgg145155121036c Vwi-d-tz--   5.00t
pool_nas                                     *
*  dat                             vgg145155121036c Vwi-d-tz--  10.00t
pool_nas                                         *
*  lvol0                           vgg145155121036c -wi-a-----
15.36g                                                              *
*  [lvol3_pmspare]                 vgg145155121036c ewi-------  15.27g*
*  market                          vgg145155121036c Vwi-d-tz--   3.00t
pool_nas                    *
*  pool_nas                        vgg145155121036c twi-a-tz--
14.90t                                0.00                          *
*  [pool_nas_tdata]                vgg145155121036c Twi-ao----
14.90t                                                              *
*  [pool_nas_tmeta]                vgg145155121036c ewi-ao----  15.27g

                                       *
*  share                           vgg145155121036c Vwi-d-tz--  10.00t
pool_nas*


 the thin pool "pool_nas" and general lv "lvol0" are active, but thin
provision volumes cannot be actived even with cmd "lvchange -ay
thin_volume_name".

To recover it, we tried following ways refer to these mail conversations:
http://www.spinics.net/lists/lvm/msg22629.html and
http://comments.gmane.org/gmane.linux.lvm.general/14828.

1, USE: "lvconvert --repair vgg145155121036c/pool_nas"
output as below and thin volumes still cannot be active.
WARNING: If everything works, remove "vgg145155121036c/pool_nas_tmeta0".
WARNING: Use pvmove command to move "vgg145155121036c/pool_nas_tmeta" on
the best fitting PV.

2, USE manual repair steps:
2a: inactive thin pool.
2b: create a temp lv "metabak".
2c: swap the thin pool's metadata lv: "lvconvert --thinpool vgg145155121036
c/pool_nas --poolmetadata metabak -y", only with "-y" option can submit the
command.
2d: active temp lv "metabak" and create another bigger lv "metabak1".
2e: repair metadata: "thin_restore -i /dev/vgg145155121036c/metabak-o /dev/
vgg145155121036c/metabak1", and got segment fault.

So, is there any other way to recover this or some steps we do wrong?

Thank you very much.
Mars

--001a113fbf92bb8838052afbaca8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Gra=
nde&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8p=
x">Hi there,</div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Gr=
ande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8=
px"><br></div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande=
&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px">=
We&#39;re using Centos 7.0 with lvm 2.02.105 and met a problem as underlyin=
g:</div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,=
Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px">After =
a electricity powerdown in the datacenter room, thin provision volumes came=
 up with wrong states:</div><blockquote style=3D"color:rgb(0,0,0);font-fami=
ly:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px=
;line-height:23.8px;margin:0px 0px 0px 40px;border:none;padding:0px"><div><=
span style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;line-height:=
normal;text-align:-webkit-auto;font-size:medium"><i>[root@storage ~]# lvs -=
a</i></span></div><div><span style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91;line-height:normal;text-align:-webkit-auto;font-size:medium"><=
i>=C2=A0 dm_report_object: report function failed for field data_percent</i=
></span></div><div><span style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91;line-height:normal;text-align:-webkit-auto;font-size:medium"><i>=
=C2=A0 LV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0 VG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 Attr=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 L=
Size =C2=A0 Pool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 Origin=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 Data%=C2=A0 Move Log Cpy%Sync Conv=
ert</i></span></div><div><i><span style=3D"font-family:=E5=BE=AE=E8=BD=AF=
=E9=9B=85=E9=BB=91;line-height:normal;text-align:-webkit-auto;font-size:med=
ium">=C2=A0 DailyBuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<=
span data=3D"145155121036" style=3D"border-bottom-width:1px;border-bottom-s=
tyle:dashed;border-bottom-color:rgb(204,204,204)">145155121036</span>c Vwi-=
d-tz-- =C2=A0 5.00t pool_nas=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0</span><sp=
an style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;line-height:no=
rmal;text-align:-webkit-auto;font-size:medium">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></i></div><div><i><span style=3D"f=
ont-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;line-height:normal;text-ali=
gn:-webkit-auto;font-size:medium">=C2=A0 dat=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<span data=3D=
"145155121036" style=3D"border-bottom-width:1px;border-bottom-style:dashed;=
border-bottom-color:rgb(204,204,204)">145155121036</span>c Vwi-d-tz--=C2=A0=
 10.00t pool_nas</span><span style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91;line-height:normal;text-align:-webkit-auto;font-size:medium">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</=
span></i></div><div><span style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91;line-height:normal;text-align:-webkit-auto;font-size:medium"><i>=
=C2=A0 lvol0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0 vgg<span data=3D"145155121036" style=3D"border-bottom-width:1=
px;border-bottom-style:dashed;border-bottom-color:rgb(204,204,204)">1451551=
21036</span>c -wi-a-----=C2=A0 15.36g=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0 =C2=A0</i></span></div><div><div><span style=3D"font-fa=
mily:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;line-height:normal;text-align:-we=
bkit-auto;font-size:medium"><i>=C2=A0 [lvol3_pmspare]=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<=
span data=3D"145155121036" style=3D"border-bottom-width:1px;border-bottom-s=
tyle:dashed;border-bottom-color:rgb(204,204,204)">145155121036</span>c ewi-=
------=C2=A0 15.27g</i></span></div><div><i><span style=3D"font-family:=E5=
=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size:medium;line-height:normal;text-=
align:-webkit-auto">=C2=A0 market=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<span data=3D"145155121036" style=3D"border=
-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:rgb(204,20=
4,204)">145155121036</span>c Vwi-d-tz-- =C2=A0 3.00t pool_nas =C2=A0 =C2=A0=
=C2=A0</span><span style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=
=91;line-height:normal;text-align:-webkit-auto;font-size:medium">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></i></div></div><div><s=
pan style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;line-height:n=
ormal;text-align:-webkit-auto;font-size:medium"><i>=C2=A0 pool_nas=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<span data=3D"14515512=
1036" style=3D"border-bottom-width:1px;border-bottom-style:dashed;border-bo=
ttom-color:rgb(204,204,204)">145155121036</span>c twi-a-tz--=C2=A0 14.90t=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0</i></span></div><div><span style=3D"font-f=
amily:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;line-height:normal;text-align:-w=
ebkit-auto;font-size:medium"><i>=C2=A0 [pool_nas_tdata]=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<spa=
n data=3D"145155121036" style=3D"border-bottom-width:1px;border-bottom-styl=
e:dashed;border-bottom-color:rgb(204,204,204)">145155121036</span>c Twi-ao-=
---=C2=A0 14.90t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =
=C2=A0</i></span></div><div><i><span style=3D"font-family:=E5=BE=AE=E8=BD=
=AF=E9=9B=85=E9=BB=91;line-height:normal;text-align:-webkit-auto;font-size:=
medium">=C2=A0 [pool_nas_tmeta]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<span data=3D"145155121036" =
style=3D"border-bottom-width:1px;border-bottom-style:dashed;border-bottom-c=
olor:rgb(204,204,204)">145155121036</span>c ewi-ao----=C2=A0 15.27g =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span =
style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size:medium;=
line-height:normal;text-align:-webkit-auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0</span></i></div><div><span style=3D"font-family:=
=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;line-height:normal;text-align:-webkit-=
auto;font-size:medium"><i>=C2=A0 share=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 vgg<span data=3D"145155121036" sty=
le=3D"border-bottom-width:1px;border-bottom-style:dashed;border-bottom-colo=
r:rgb(204,204,204)">145155121036</span>c Vwi-d-tz--=C2=A0 10.00t pool_nas</=
i></span></div></blockquote><div style=3D"color:rgb(0,0,0);font-family:&#39=
;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-h=
eight:23.8px"><br></div><div style=3D"color:rgb(0,0,0);font-family:&#39;luc=
ida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-heigh=
t:23.8px">=C2=A0the thin pool &quot;pool_nas&quot; and general lv &quot;lvo=
l0&quot; are active, but thin provision volumes cannot be actived even with=
 cmd &quot;lvchange -ay thin_volume_name&quot;.</div><div style=3D"color:rg=
b(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#=
39;;font-size:14px;line-height:23.8px"><br></div><div style=3D"color:rgb(0,=
0,0);font-family:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;=
font-size:14px;line-height:23.8px">To recover it, we tried following ways r=
efer to these mail conversations:=C2=A0<a href=3D"http://www.spinics.net/li=
sts/lvm/msg22629.html" target=3D"_blank" style=3D"outline:none;color:rgb(42=
,88,111)">http://www.spinics.net/lists/lvm/msg22629.html</a>=C2=A0and=C2=A0=
<a href=3D"http://comments.gmane.org/gmane.linux.lvm.general/14828" target=
=3D"_blank" style=3D"outline:none;color:rgb(42,88,111)">http://comments.gma=
ne.org/gmane.linux.lvm.general/14828</a>.</div><div style=3D"color:rgb(0,0,=
0);font-family:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;fo=
nt-size:14px;line-height:23.8px"><br></div><div style=3D"color:rgb(0,0,0);f=
ont-family:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-s=
ize:14px;line-height:23.8px">1, USE: &quot;lvconvert --repair vgg<span data=
=3D"145155121036" style=3D"border-bottom-width:1px;border-bottom-style:dash=
ed;border-bottom-color:rgb(204,204,204)">145155121036</span>c/pool_nas&quot=
;</div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,V=
erdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px"><span s=
tyle=3D"line-height:1.5">output as below and thin volumes still cannot be a=
ctive.</span></div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida G=
rande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.=
8px">WARNING: If everything works, remove &quot;vgg<span data=3D"1451551210=
36" style=3D"border-bottom-width:1px;border-bottom-style:dashed;border-bott=
om-color:rgb(204,204,204)">145155121036</span>c/pool_nas_tmeta0&quot;.</div=
><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana=
,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px">WARNING: Use =
pvmove command to move &quot;vgg<span data=3D"145155121036" style=3D"border=
-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:rgb(204,20=
4,204)">145155121036</span>c/pool_nas_tmeta&quot; on the best fitting PV.</=
div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verd=
ana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px"><br></div>=
<div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana,=
&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px">2, USE manual =
repair steps:</div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida G=
rande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.=
8px">2a: inactive thin pool.</div><div style=3D"color:rgb(0,0,0);font-famil=
y:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;=
line-height:23.8px">2b: create a temp lv &quot;metabak&quot;.</div><div sty=
le=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana,&#39;Mic=
rosoft YaHei&#39;;font-size:14px;line-height:23.8px">2c: swap the thin pool=
&#39;s metadata lv: &quot;<span style=3D"color:rgb(34,34,34);line-height:24=
px;text-align:justify;white-space:pre-wrap">lvconvert --thinpool </span>vgg=
<span data=3D"145155121036" style=3D"border-bottom-width:1px;border-bottom-=
style:dashed;border-bottom-color:rgb(204,204,204)">145155121036</span>c/poo=
l_nas<span style=3D"color:rgb(34,34,34);line-height:24px;text-align:justify=
;white-space:pre-wrap"> --poolmetadata metabak -y</span><span style=3D"line=
-height:1.5">&quot;, only with &quot;-y&quot; option can submit the command=
.</span></div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande=
&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px">=
<span style=3D"line-height:1.5">2d: active temp lv &quot;metabak&quot; and =
create another bigger lv &quot;metabak1&quot;.</span></div><div style=3D"co=
lor:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft Y=
aHei&#39;;font-size:14px;line-height:23.8px"><span style=3D"line-height:1.5=
">2e: repair metadata: &quot;</span><span style=3D"color:rgb(34,34,34);line=
-height:24px;text-align:justify;white-space:pre-wrap">thin_restore -i /dev/=
</span>vgg<span data=3D"145155121036" style=3D"border-bottom-width:1px;bord=
er-bottom-style:dashed;border-bottom-color:rgb(204,204,204)">145155121036</=
span>c<span style=3D"color:rgb(34,34,34);line-height:24px;text-align:justif=
y;white-space:pre-wrap">/</span>metabak<span style=3D"color:rgb(34,34,34);l=
ine-height:24px;text-align:justify;white-space:pre-wrap">-o /dev/</span>vgg=
<span data=3D"145155121036" style=3D"border-bottom-width:1px;border-bottom-=
style:dashed;border-bottom-color:rgb(204,204,204)">145155121036</span>c<spa=
n style=3D"color:rgb(34,34,34);line-height:24px;text-align:justify;white-sp=
ace:pre-wrap">/</span>metabak1<span style=3D"line-height:1.5">&quot;, and g=
ot segment fault.</span></div><div style=3D"color:rgb(0,0,0);font-family:&#=
39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line=
-height:23.8px"><br></div><div style=3D"color:rgb(0,0,0);font-family:&#39;l=
ucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-hei=
ght:23.8px"></div><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Gr=
ande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8=
px"><span style=3D"line-height:1.5">So, is there any other way to recover t=
his or some steps we do wrong?</span></div><div style=3D"color:rgb(0,0,0);f=
ont-family:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&#39;;font-s=
ize:14px;line-height:23.8px"><span style=3D"line-height:1.5"><br></span></d=
iv><div style=3D"color:rgb(0,0,0);font-family:&#39;lucida Grande&#39;,Verda=
na,&#39;Microsoft YaHei&#39;;font-size:14px;line-height:23.8px"><span style=
=3D"line-height:1.5">Thank you very much.</span></div><div style=3D"color:r=
gb(0,0,0);font-family:&#39;lucida Grande&#39;,Verdana,&#39;Microsoft YaHei&=
#39;;font-size:14px;line-height:23.8px">Mars</div></div>

--001a113fbf92bb8838052afbaca8--
