Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2RBWGSa004491
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2014 07:32:16 -0400
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2RBWE8K007508
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2014 07:32:14 -0400
Received: by mail-qg0-f47.google.com with SMTP id 63so2577358qgz.34
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2014 04:32:14 -0700 (PDT)
MIME-Version: 1.0
Sender: derek.dongray@gmail.com
Date: Thu, 27 Mar 2014 11:32:14 +0000
Message-ID: <CANfzhCZOM3xUdVfG74RtxtDa5tHE6MhnHo=LmNS_G9DR5WwYqQ@mail.gmail.com>
From: Derek Dongray <derek@inverchapel.me.uk>
Content-Type: multipart/alternative; boundary=001a11c3cefccf0e2b04f594ef71
Subject: [linux-lvm] How do I remove a locked Logical Volume ([pvmove0])
 left over after a disk error?
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

--001a11c3cefccf0e2b04f594ef71
Content-Type: text/plain; charset=ISO-8859-1

Following some disk errors while I was moving some extents, I now have a
hidden locked [pvmove0] which doesn't seem to have any physical extents
assigned, although it is shown as 4Mb long.

    # lvs -a -o+seg_pe_ranges a/pvmove0
      LV        VG   Attr       LSize Pool Origin Data%  Move Log Cpy%Sync
Convert PE Ranges
      [pvmove0] a    vwC---v--- 4.00m

The simple 'lvremove a/pvmove0' (optionally with '--force') results in the
message 'Can't remove locked LV pvmove0'.

'pvmove --abort' does nothing. The presence of this volume doesn't seem to
affect other moves (which simply use [pvmove1]).

In the config, the LV shows:

                pvmove0 {
                        id = "54veYD-hM8r-j214-MOD1-FGnV-3g7t-jRlZ7W"
                        status = ["READ", "WRITE", "LOCKED"]
                        flags = []
                        creation_host = "zotac"
                        creation_time = 1394764593      # 2014-03-14
02:36:33 +0000
                        allocation_policy = "contiguous"
                        segment_count = 1

                        segment1 {
                                start_extent = 0
                                extent_count = 1        # 4 Megabytes

                                type = "error"
                        }
                }

I noticed there's no physical volume associate with the LV although the
extent count of 1 explains why it's reported as 4Mb in size.

I suspect that the only fix is to manually edit the config file to remove
the offending LV and then use `vgcfgrestore` (or possible simply edit the
config file from a rescue system) but would assume that I'm not the only
person to have this problem and would think there's a series of (possibly
undocumented) commands to clean this up.

[FYI: the 'disk errors' were the almost simultaneous failure of 2 out of 3
disks in a RAID array; fortunately one the drives only had a few bad blocks
so I was able to recover all but a few megabytes of a 500Gb volume using
'ddrescue']

-- 
Derek.

--001a11c3cefccf0e2b04f594ef71
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Following some disk errors while I was moving some ex=
tents, I now have a hidden locked [pvmove0] which doesn&#39;t seem to have =
any physical extents assigned, although it is shown as 4Mb long.</div><div>
<br></div><div>=A0 =A0 # lvs -a -o+seg_pe_ranges a/pvmove0</div><div>=A0 =
=A0 =A0 LV =A0 =A0 =A0 =A0VG =A0 Attr =A0 =A0 =A0 LSize Pool Origin Data% =
=A0Move Log Cpy%Sync Convert PE Ranges</div><div>=A0 =A0 =A0 [pvmove0] a =
=A0 =A0vwC---v--- 4.00m</div><div><br></div>
<div>The simple &#39;lvremove a/pvmove0&#39; (optionally with &#39;--force&=
#39;) results in the message &#39;Can&#39;t remove locked LV pvmove0&#39;.<=
br></div><div><br></div><div>&#39;pvmove --abort&#39; does nothing. The pre=
sence of this volume doesn&#39;t seem to affect other moves (which simply u=
se [pvmove1]).</div>
<div><br></div><div>In the config, the LV shows:</div><div><br></div><div>=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pvmove0 {</div><div>=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 id =3D &quot;54veYD-hM8r-j214-MOD1-FGnV-3g7t-jRlZ7=
W&quot;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =
=3D [&quot;READ&quot;, &quot;WRITE&quot;, &quot;LOCKED&quot;]</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags =3D []</div><div=
>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 creation_host =3D &quot;zo=
tac&quot;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 creatio=
n_time =3D 1394764593 =A0 =A0 =A0# 2014-03-14 02:36:33 +0000</div><div>=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 allocation_policy =3D &quot;con=
tiguous&quot;</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 segment_count =3D 1</d=
iv><div><br></div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 segm=
ent1 {</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 start_extent =3D 0</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 extent_count =3D 1 =A0 =A0 =A0 =A0# 4 Megabytes=
</div>
<div><br></div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 type =3D &quot;error&quot;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 }</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }</div><div=
><br></div><div>I noticed there&#39;s no physical volume associate with the=
 LV although the extent count of 1 explains why it&#39;s reported as 4Mb in=
 size.</div>
<div><br></div><div>I suspect that the only fix is to manually edit the con=
fig file to remove the offending LV and then use `vgcfgrestore` (or possibl=
e simply edit the config file from a rescue system) but would assume that I=
&#39;m not the only person to have this problem and would think there&#39;s=
 a series of (possibly undocumented) commands to clean this up.<br>
</div><div><br></div><div>[FYI: the &#39;disk errors&#39; were the almost s=
imultaneous failure of 2 out of 3 disks in a RAID array; fortunately one th=
e drives only had a few bad blocks so I was able to recover all but a few m=
egabytes of a 500Gb volume using &#39;ddrescue&#39;]</div>
<div><br></div>-- <br>Derek.
</div>

--001a11c3cefccf0e2b04f594ef71--
