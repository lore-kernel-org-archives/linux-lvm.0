Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1824160E37
	for <linux-lvm@redhat.com>; Sun,  3 Jun 2018 20:13:37 +0000 (UTC)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 108732FE554
	for <linux-lvm@redhat.com>; Sun,  3 Jun 2018 20:13:26 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p126-v6so2710512wmb.2
	for <linux-lvm@redhat.com>; Sun, 03 Jun 2018 13:13:25 -0700 (PDT)
MIME-Version: 1.0
From: Inbox <jimhaddad46@gmail.com>
Date: Sun, 3 Jun 2018 13:13:24 -0700
Message-ID: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000093bac056dc27364"
Subject: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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

--000000000000093bac056dc27364
Content-Type: text/plain; charset="UTF-8"

I'm aware I can't let my thin volume get full.  I'm actually about to
delete a lot of things.



I don't understand why it gave the sdh3 then sdh3, sdg3, sdf3 no space left
on device errors.  sdf3 has 366G left in its thin pool, and I asked to
create a virtual 200G within it.

I don't understand why it failed to write VG, or an MDA of VG.

I'm most concerned if anything's corrupted now, or if I can ignore this
other than that I couldn't create a volume.

disk1thin is on sdh3
disk2thin is on sdg3
disk3thin is on sdf3
disk4thin is on sde3

# lvs
...
  disk1thin                       lvm    twi-aot---  <4.53t
     84.13  76.33
  disk2thin                       lvm    twi-aot---  <4.53t
     85.98  78.09
  disk3thin                       lvm    twi-aot---  <4.53t
     92.10  83.47
  disk4thin                       lvm    twi-aot---   4.53t
     80.99  36.91
...
# lvcreate -V200G lvm/disk3thin -n test3
  WARNING: Sum of all thin volume sizes (21.22 TiB) exceeds the size of
thin pools and the size of whole volume group (<18.17 TiB).
  WARNING: You have not turned on protection against thin pools running out
of space.
  WARNING: Set activation/thin_pool_autoextend_threshold below 100 to
trigger automatic extension of thin pools before they get full.
  /dev/sdh3: write failed after 24064 of 24576 at 4993488961536: No space
left on device
  Failed to write VG lvm.
  Failed to write VG lvm.
  Manual intervention may be required to remove abandoned LV(s) before
retrying.
# lvremove lvm/test3
  /dev/sdh3: write failed after 24064 of 24576 at 4993488961536: No space
left on device
  WARNING: Failed to write an MDA of VG lvm.
  /dev/sdg3: write failed after 24064 of 24576 at 4993488961536: No space
left on device
  WARNING: Failed to write an MDA of VG lvm.
  /dev/sdf3: write failed after 24064 of 24576@4993488961536: No space
left on device
  WARNING: Failed to write an MDA of VG lvm.
  Logical volume "test3" successfully removed
# lvs --- shows test3 is gone

# pvs
  PV             VG     Fmt  Attr PSize    PFree
  /dev/sde3      lvm    lvm2 a--     4.54t <10.70g
  /dev/sdf3      lvm    lvm2 a--     4.54t      0
  /dev/sdg3      lvm    lvm2 a--     4.54t      0
  /dev/sdh3      lvm    lvm2 a--     4.54t      0
# vgs
  VG     #PV #LV #SN Attr   VSize   VFree
  lvm      4  51   0 wz--n- <18.17t <10.70g

--000000000000093bac056dc27364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m aware I can&#39;t let my thin volume get full=
.=C2=A0 I&#39;m actually about to delete a lot of things.</div><div><br></d=
iv><div><br></div><div><br></div><div>I don&#39;t understand why it gave th=
e sdh3 then sdh3, sdg3, sdf3 no space left on device errors.=C2=A0 sdf3 has=
 366G left in its thin pool, and I asked to create a virtual 200G within it=
.</div><div><br></div><div>I don&#39;t understand why it failed to write VG=
, or an MDA of VG.</div><div><br></div><div>I&#39;m most concerned if anyth=
ing&#39;s corrupted now, or if I can ignore this other than that I couldn&#=
39;t create a volume.</div><div><br></div><div>disk1thin is on sdh3</div><d=
iv>disk2thin is on sdg3</div><div>disk3thin is on sdf3</div><div>disk4thin =
is on sde3</div><div><br></div><div># lvs</div><div>...</div><div>=C2=A0 di=
sk1thin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0lvm=C2=A0 =C2=A0 twi-aot---=C2=A0 &lt;4.53t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A084.13=C2=A0 7=
6.33</div><div>=C2=A0 disk2thin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lvm=C2=A0 =C2=A0 twi-aot---=C2=A0 =
&lt;4.53t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A085.98=C2=A0 78.09</div><div>=C2=A0 disk3thin=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lvm=C2=A0 =C2=
=A0 twi-aot---=C2=A0 &lt;4.53t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A092.10=C2=A0 83.47</div><div>=C2=A0 disk4thin=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lvm=C2=A0 =C2=A0 twi-aot---=C2=A0 =C2=A04.53t=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A080.99=C2=A0 36.91</=
div><div>...<br></div><div># lvcreate -V200G lvm/disk3thin -n test3</div><d=
iv>=C2=A0 WARNING: Sum of all thin volume sizes (21.22 TiB) exceeds the siz=
e of thin pools and the size of whole volume group (&lt;18.17 TiB).</div><d=
iv>=C2=A0 WARNING: You have not turned on protection against thin pools run=
ning out of space.</div><div>=C2=A0 WARNING: Set activation/thin_pool_autoe=
xtend_threshold below 100 to trigger automatic extension of thin pools befo=
re they get full.</div><div>=C2=A0 /dev/sdh3: write failed after 24064 of 2=
4576 at 4993488961536: No space left on device</div><div>=C2=A0 Failed to w=
rite VG lvm.</div><div>=C2=A0 Failed to write VG lvm.</div><div>=C2=A0 Manu=
al intervention may be required to remove abandoned LV(s) before retrying.<=
/div><div># lvremove lvm/test3</div><div>=C2=A0 /dev/sdh3: write failed aft=
er 24064 of 24576 at 4993488961536: No space left on device</div><div>=C2=
=A0 WARNING: Failed to write an MDA of VG lvm.</div><div>=C2=A0 /dev/sdg3: =
write failed after 24064 of 24576 at 4993488961536: No space left on device=
</div><div>=C2=A0 WARNING: Failed to write an MDA of VG lvm.</div><div>=C2=
=A0 /dev/sdf3: write failed after 24064 of 24576 at 4993488961536: No space=
 left on device</div><div>=C2=A0 WARNING: Failed to write an MDA of VG lvm.=
</div><div>=C2=A0 Logical volume &quot;test3&quot; successfully removed</di=
v><div># lvs --- shows test3 is gone</div><div><br></div><div># pvs</div><d=
iv><div>=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 =
=C2=A0 =C2=A0Fmt=C2=A0 Attr PSize=C2=A0 =C2=A0 PFree</div></div><div>=C2=A0=
 /dev/sde3=C2=A0 =C2=A0 =C2=A0 lvm=C2=A0 =C2=A0 lvm2 a--=C2=A0 =C2=A0 =C2=
=A04.54t &lt;10.70g<br></div><div><div>=C2=A0 /dev/sdf3=C2=A0 =C2=A0 =C2=A0=
 lvm=C2=A0 =C2=A0 lvm2 a--=C2=A0 =C2=A0 =C2=A04.54t=C2=A0 =C2=A0 =C2=A0 0</=
div><div>=C2=A0 /dev/sdg3=C2=A0 =C2=A0 =C2=A0 lvm=C2=A0 =C2=A0 lvm2 a--=C2=
=A0 =C2=A0 =C2=A04.54t=C2=A0 =C2=A0 =C2=A0 0</div><div>=C2=A0 /dev/sdh3=C2=
=A0 =C2=A0 =C2=A0 lvm=C2=A0 =C2=A0 lvm2 a--=C2=A0 =C2=A0 =C2=A04.54t=C2=A0 =
=C2=A0 =C2=A0 0</div></div><div># vgs</div><div><div>=C2=A0 VG=C2=A0 =C2=A0=
 =C2=A0#PV #LV #SN Attr=C2=A0 =C2=A0VSize=C2=A0 =C2=A0VFree</div><div>=C2=
=A0 lvm=C2=A0 =C2=A0 =C2=A0 4=C2=A0 51=C2=A0 =C2=A00 wz--n- &lt;18.17t &lt;=
10.70g</div></div><div><br></div></div>

--000000000000093bac056dc27364--
