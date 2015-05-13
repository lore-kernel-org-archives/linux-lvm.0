Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4DAA1OR021737
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 13 May 2015 06:10:01 -0400
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mx1.redhat.com (Postfix) with ESMTPS id 63359B599E
	for <linux-lvm@redhat.com>; Wed, 13 May 2015 10:09:58 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so25597970lab.2
	for <linux-lvm@redhat.com>; Wed, 13 May 2015 03:09:56 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 13 May 2015 18:09:56 +0800
Message-ID: <CANX1XTU1TaGDj6f39EVaPF9C9LWbG_0+aYE4JgSiqML0Wum_sA@mail.gmail.com>
From: Hank Tsai <hanktsai@qnap.com>
Content-Type: multipart/alternative; boundary=001a11c3eba62005520515f3d080
Subject: [linux-lvm] Why it suggest to disable "write_cache_state" when
 using DRBD as physical volumes
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

--001a11c3eba62005520515f3d080
Content-Type: text/plain; charset=UTF-8

Hi All,

I want to use DRBD devices as LVM physical volumes.
I'm curious about why the the DRBD manual suggest
to disable "write_cache_state" in this scenario:
https://drbd.linbit.com/users-guide/s-lvm-drbd-as-pv.html

I can only find a few articles that explain the reason.
For example, this book said that could prevent error while the DRBD devices
are down:
https://books.google.com/books?id=d1ZwAgAAQBAJ&pg=PT192&lpg=PT192&dq=drbd+lvm+
"write_cache_state"
But, as I know, LVM can handle the case if the device listed in device cache
are not available. In LVM2.2.02.105, function lvmcache_device_from_pvid()
invokes lvmcache_label_scan() to refresh the cache if PV is missing.

This document also suggest to disable device cache, but I think that
LVM nowadays can handle the issue it described, such as "duplicate
physical volumes being displayed". For example, if we build /dev/drbd1 on
the
top of /dev/sda1, and create PV using /dev/drbd1, then LVM won't display
/dev/sda1 as physical volumes.
http://www.linux-iscsi.org/Doc/RTS%20OS%20Admin%20Manual.pdf

Also, the device cache feature is automatically disabled if lvmetad is
enabled. So, is it necessary to disable "write_cache_state" while
"use_lvmetad" was enabled?

Any help would be appreciate!


Ming-Hung Tsai

--001a11c3eba62005520515f3d080
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I want to use DRBD d=
evices as LVM physical volumes.</div><div>I&#39;m curious about why the the=
 DRBD manual suggest</div><div>to disable &quot;write_cache_state&quot; in =
this scenario:</div><div><a href=3D"https://drbd.linbit.com/users-guide/s-l=
vm-drbd-as-pv.html">https://drbd.linbit.com/users-guide/s-lvm-drbd-as-pv.ht=
ml</a></div><div><br></div><div>I can only find a few articles that explain=
 the reason.</div><div>For example, this book said that could prevent error=
 while the DRBD devices</div><div>are down:</div><div><a href=3D"https://bo=
oks.google.com/books?id=3Dd1ZwAgAAQBAJ&amp;pg=3DPT192&amp;lpg=3DPT192&amp;d=
q=3Ddrbd+lvm+">https://books.google.com/books?id=3Dd1ZwAgAAQBAJ&amp;pg=3DPT=
192&amp;lpg=3DPT192&amp;dq=3Ddrbd+lvm+</a>&quot;write_cache_state&quot;</di=
v><div>But, as I know, LVM can handle the case if the device listed in devi=
ce cache</div><div>are not available. In LVM2.2.02.105, function lvmcache_d=
evice_from_pvid()</div><div>invokes lvmcache_label_scan() to refresh the ca=
che if PV is missing.</div><div><br></div><div>This document also suggest t=
o disable device cache, but I think that</div><div>LVM nowadays can handle =
the issue it described, such as &quot;duplicate</div><div>physical volumes =
being displayed&quot;. For example, if we build /dev/drbd1 on the</div><div=
>top of /dev/sda1, and create PV using /dev/drbd1, then LVM won&#39;t displ=
ay</div><div>/dev/sda1 as physical volumes.</div><div><a href=3D"http://www=
.linux-iscsi.org/Doc/RTS%20OS%20Admin%20Manual.pdf">http://www.linux-iscsi.=
org/Doc/RTS%20OS%20Admin%20Manual.pdf</a></div><div><br></div><div>Also, th=
e device cache feature is automatically disabled if lvmetad is</div><div>en=
abled. So, is it necessary to disable &quot;write_cache_state&quot; while</=
div><div>&quot;use_lvmetad&quot; was enabled?</div><div><br></div><div>Any =
help would be=C2=A0appreciate!<br></div><div><br></div><div><br></div><div>=
Ming-Hung Tsai</div><div><br></div></div>

--001a11c3eba62005520515f3d080--
