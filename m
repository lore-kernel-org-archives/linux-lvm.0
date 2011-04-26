Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3QBFTxQ032123
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 07:15:29 -0400
Received: from h1782359.stratoserver.net (h1782359.stratoserver.net
	[85.214.82.195])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3QBFPwA017556
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 07:15:25 -0400
Received: from imac-cmo.itso-berlin.de (dns.itso-berlin.de [62.96.12.227])
	(Authenticated sender: motschke@motschke.de)
	by h1782359.stratoserver.net (Postfix) with ESMTPSA id 7FEDBA6C07B
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 13:15:23 +0200 (CEST)
From: Christian Motschke <christian@motschke.de>
Content-Type: multipart/alternative; boundary=Apple-Mail-4--908191470
Date: Tue, 26 Apr 2011 13:15:22 +0200
Message-Id: <B352DF96-2DA3-4FE7-923B-1354575032BD@motschke.de>
Mime-Version: 1.0 (Apple Message framework v1084)
Subject: [linux-lvm] Clustered snapshots
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


--Apple-Mail-4--908191470
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I tried the unstable packages of lvm2 in debian with support for =
clustered snapshots (2.02.84). It is unusable (at least for me ;-).
I have corosync and clvm with openais support running. Locking type is =
set to 3 in lvm.conf. I have only 1 server with clvm in this test setup. =
I hope this is not the problem.

What I did:
gcc:~# vgchange -cy vgtest
 Volume group "vgtest" successfully changed
gcc:~# vgdisplay -C
 VG     #PV #LV #SN Attr   VSize VFree
 vgtest   1   1   0 wz--nc 4.00g 3.00g
gcc:~# lvdisplay -C
 LV      VG     Attr   LSize Origin Snap%  Move Log Copy%  Convert
 test-lv vgtest -wi-a- 1.00g                                     =20
gcc:~#=20

gcc:~# lvchange -aey vgtest/test-lv
gcc:~# lvcreate -s -n test-lv-snap -L 100m vgtest/test-lv
 Logical volume "test-lv-snap" created
gcc:~# lvdisplay -C
 LV           VG     Attr   LSize   Origin  Snap%  Move Log Copy%  =
Convert
 test-lv      vgtest owi-a-   1.00g                                      =
=20
 test-lv-snap vgtest swi-a- 100.00m test-lv 100.00                       =
=20

So, after I created the snapshot it is immediately disabled and 100% =
full. What am I doing wrong?

With kind regards.
Christian Motschke


--Apple-Mail-4--908191470
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
">Hi,</span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; "><br></span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; ">I tried =
the unstable packages of lvm2 in debian with support for clustered =
snapshots (2.02.84). It is unusable (at least for me ;-).</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">I have corosync and clvm with openais support running. =
Locking type is set to 3 in lvm.conf. I have only 1 server with clvm in =
this test setup. I hope this is not the problem.</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">What I did:</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">gcc:~# vgchange -cy vgtest</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">&nbsp;Volume group "vgtest" successfully =
changed</span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">gcc:~# vgdisplay -C</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">&nbsp;VG &nbsp;&nbsp;&nbsp;&nbsp;#PV #LV #SN Attr =
&nbsp;&nbsp;VSize VFree</span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; "><br></span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
">&nbsp;vgtest &nbsp;&nbsp;1 &nbsp;&nbsp;1 &nbsp;&nbsp;0 wz--nc 4.00g =
3.00g</span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">gcc:~# lvdisplay -C</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">&nbsp;LV &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG =
&nbsp;&nbsp;&nbsp;&nbsp;Attr &nbsp;&nbsp;LSize Origin Snap% &nbsp;Move =
Log Copy% &nbsp;Convert</span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; "><br></span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
">&nbsp;test-lv vgtest -wi-a- 1.00g =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
</span><span class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">gcc:~#</span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">&nbsp;</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">gcc:~# lvchange -aey =
vgtest/test-lv</span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; "><br></span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; ">gcc:~# =
lvcreate -s -n test-lv-snap -L 100m vgtest/test-lv</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">&nbsp;Logical volume "test-lv-snap" created</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">gcc:~# lvdisplay -C</span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; "><br></span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; ">&nbsp;LV =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG =
&nbsp;&nbsp;&nbsp;&nbsp;Attr &nbsp;&nbsp;LSize &nbsp;&nbsp;Origin =
&nbsp;Snap% &nbsp;Move Log Copy% &nbsp;Convert</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; ">&nbsp;test-lv &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vgtest owi-a- =
&nbsp;&nbsp;1.00g =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;</span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">&nbsp;test-lv-snap vgtest swi-a- =
100.00m test-lv 100.00 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><sp=
an class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">So, after I created the snapshot it =
is immediately disabled and 100% full. What am I doing =
wrong?</span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; "><br></span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; ">With kind =
regards.</span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "><br></span><span class=3D"Apple-style-span" =
style=3D"font-family: monospace; ">Christian Motschke</span><span =
class=3D"Apple-style-span" style=3D"font-family: monospace; =
"><br></span><span class=3D"Apple-style-span" style=3D"font-family: =
monospace; "></span><span class=3D"Apple-style-span" style=3D"font-family:=
 monospace; "><br></span></body></html>=

--Apple-Mail-4--908191470--
