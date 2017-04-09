Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 301BF4F9A5
	for <linux-lvm@redhat.com>; Sun,  9 Apr 2017 07:17:27 +0000 (UTC)
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61BEA4E4C6
	for <linux-lvm@redhat.com>; Sun,  9 Apr 2017 07:17:26 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id e132so2995952ite.1
	for <linux-lvm@redhat.com>; Sun, 09 Apr 2017 00:17:26 -0700 (PDT)
MIME-Version: 1.0
From: Roger Morton <ttguy1@gmail.com>
Date: Sun, 9 Apr 2017 17:17:25 +1000
Message-ID: <CAC=a5kw1oa1w-6OmHe5tuVwtok_qd=tr26pYTk-FK-_+6zf2Zg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1145f6028e052e054cb6a658
Subject: [linux-lvm] root: Failed query for merging percentage. Aborting
	merge
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

--001a1145f6028e052e054cb6a658
Content-Type: text/plain; charset=UTF-8

I wanted to merge a old snap shot (root_snap10) of my root file system back
into root.


    LV          VG         Attr       LSize    Pool Origin Data%  Meta%
 Move Log Cpy%Sync Convert
  home_lv     kubuntu-vg rwi-aor--- 1000.00g
     100.00
  root        kubuntu-vg owi-aor---   50.00g
     100.00
  root_snap10 kubuntu-vg swi-a-s---   50.00g      root   28.42
  root_snap14 kubuntu-vg swi-a-s---   50.00g      root   0.00


So I boot from a USB and ensure /dev/kubuntu-vg/root is not mounted and I
issue the lvconvert command below.
And it errors with "Failed query for merging percentage. Aborting merge"

sudo lvconvert --merge /dev/kubuntu-vg/root_snap10
Merging of volume root_snap10 started
root: Failed query for merging percentage. Aborting merge

root_snap10 would  appear to be gone.
I can boot to this system and the system does appear to have been restored
to the state it was when the snapshot was taken.

However, if I try snapshot root now

sudo lvcreate -s -n root_snap10b -L 50G /dev/kubuntu-vg/root
  Snapshots of an origin that has a merging snapshot is not supported

So the system still thinks   /dev/kubuntu-vg/root is in the middle of
merging.
Which worries me - my root file system might be in some half and half state
between two different snapshots

*     Is there a way out of this conundrum?       *

I do have a snapshot I took just before attempting the merge (root_snap14).
I guess I could try and  merge that to root.

I am on kubuntu 16.04

lvm version
 LVM version:     2.02.133(2) (2015-10-30)
 Library version: 1.02.110 (2015-10-30)

--001a1145f6028e052e054cb6a658
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace, monospace">I wanted to merge a ol=
d snap shot (</font><span style=3D"font-family:monospace,monospace">root_sn=
ap10)</span><font face=3D"monospace, monospace">=C2=A0of my root file syste=
m back into root.</font><div><font face=3D"monospace, monospace"><br></font=
></div><div><br style=3D"font-family:monospace,monospace"><span style=3D"fo=
nt-family:monospace,monospace">=C2=A0 =C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=
=A0 =C2=A0Pool Origin Data% =C2=A0Meta% =C2=A0Move Log Cpy%Sync Convert</sp=
an><br style=3D"font-family:monospace,monospace"><span style=3D"font-family=
:monospace,monospace">=C2=A0 home_lv =C2=A0 =C2=A0 kubuntu-vg rwi-aor--- 10=
00.00g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0100.00 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0</span><br style=3D"font-family:monospace,monosp=
ace"><span style=3D"font-family:monospace,monospace">=C2=A0 root =C2=A0 =C2=
=A0 =C2=A0 =C2=A0kubuntu-vg owi-aor--- =C2=A0 50.00g =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0100.00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</s=
pan><br style=3D"font-family:monospace,monospace"><span style=3D"font-famil=
y:monospace,monospace">=C2=A0 root_snap10 kubuntu-vg swi-a-s--- =C2=A0 50.0=
0g =C2=A0 =C2=A0 =C2=A0root =C2=A0 28.42</span><br style=3D"font-family:mon=
ospace,monospace"></div><div><font face=3D"monospace, monospace">=C2=A0 roo=
t_snap14 kubuntu-vg swi-a-s--- =C2=A0 50.00g =C2=A0 =C2=A0 =C2=A0root =C2=
=A0 0.00</font><br></div><div><font face=3D"monospace, monospace"><br></fon=
t></div><div><font face=3D"monospace, monospace"><br></font><div><font face=
=3D"monospace, monospace">So I boot from a USB and ensure /dev/kubuntu-vg/r=
oot is not mounted and I issue the lvconvert command below.=C2=A0</font></d=
iv><div><font face=3D"monospace, monospace">And it errors with &quot;</font=
><span style=3D"font-family:monospace,monospace">Failed query for merging p=
ercentage. Aborting merge&quot;</span><font face=3D"monospace, monospace"><=
br></font><div><font face=3D"monospace, monospace"><br></font></div><div><f=
ont face=3D"monospace, monospace"><div>sudo lvconvert --merge /dev/kubuntu-=
vg/root_snap10</div><div>Merging of volume root_snap10 started</div><div>ro=
ot: Failed query for merging percentage. Aborting merge</div><div><br></div=
><div>root_snap10 would =C2=A0appear to be gone.</div><div>I can boot to th=
is system and the system does appear to have been restored to the state it =
was when the snapshot was taken.</div><div><br></div><div>However, if I try=
 snapshot root now=C2=A0</div><div><br></div><div><div>sudo lvcreate -s -n =
root_snap10b -L 50G /dev/kubuntu-vg/root</div><div>=C2=A0 Snapshots of an o=
rigin that has a merging snapshot is not supported</div></div><div><font fa=
ce=3D"monospace, monospace"><br></font></div>So the system still thinks =C2=
=A0</font><span style=3D"font-family:monospace,monospace">=C2=A0</span><spa=
n style=3D"font-family:monospace,monospace">/dev/kubuntu-vg/root is in the =
middle of merging.</span></div><div><span style=3D"font-family:monospace,mo=
nospace">Which worries me - my root file system might be in some half and h=
alf state between two different snapshots</span></div><div><span style=3D"f=
ont-family:monospace,monospace"><br></span></div><div><span style=3D"font-f=
amily:monospace,monospace">* =C2=A0 =C2=A0 Is there a way out of this conun=
drum? =C2=A0 =C2=A0 =C2=A0 * =C2=A0</span></div><div><span style=3D"font-fa=
mily:monospace,monospace"><br></span></div><div><span style=3D"font-family:=
monospace,monospace">I do have a snapshot I took just before attempting the=
 merge (</span><span style=3D"font-family:monospace,monospace">root_snap14<=
/span><span style=3D"font-family:monospace,monospace">).=C2=A0</span></div>=
<div><span style=3D"font-family:monospace,monospace">I guess I could try an=
d =C2=A0merge that to root.=C2=A0</span></div><div><span style=3D"font-fami=
ly:monospace,monospace"><br></span></div><div><span style=3D"font-family:mo=
nospace,monospace">I am on kubuntu 16.04</span></div><div><font face=3D"mon=
ospace, monospace"><br>lvm version<br>=C2=A0LVM version: =C2=A0 =C2=A0 2.02=
.133(2) (2015-10-30)<br>=C2=A0Library version: 1.02.110 (2015-10-30)</font>=
</div></div></div></div>

--001a1145f6028e052e054cb6a658--
