Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t48ADNC8007319
	for <linux-lvm@redhat.com>; Fri, 8 May 2015 06:13:23 -0400
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t48ADKim001274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 8 May 2015 06:13:21 -0400
Received: by igbpi8 with SMTP id pi8so16705351igb.1
	for <linux-lvm@redhat.com>; Fri, 08 May 2015 03:13:20 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 8 May 2015 11:13:20 +0100
Message-ID: <CAKthVDZQ7-w-TpvvP1AN1VU=zt5RDFLvxiweo7pLVC1ZK0Eceg@mail.gmail.com>
From: Andrew Thorburn <athorburn@pivotal.io>
Content-Type: multipart/alternative; boundary=047d7b10c8890da33e05158f4714
Subject: [linux-lvm] sequential_threshold=0 turns lvmcache into write-around
	cache
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

--047d7b10c8890da33e05158f4714
Content-Type: text/plain; charset=UTF-8

Hey folks,

We're currently looking at DM Cache (and LVM Cache over it) as a way of
dealing with write latencies on AWS, basically by using the ephemeral
storage on an AWS VM as the cache, and EBS as the origin / long-term device.

As such, it's necessary to disable the sequential detection, as it will
never be more efficient to write to the EBS backing device.

However, from some testing we've done, it seems that setting
sequential_threshold to zero actually turns the cache into a write-around
cache (i.e. it never writes to the cache - it only writes to the device
directly), which suggests that either we've misunderstood the
documentation, or there is a bug in how the code works.

The documentation states:

"If sequential threshold is set to 0 the sequential I/O detection is
disabled and sequential I/O will no longer implicitly bypass the cache."

I took that to mean it will always write to the cache and will never bypass
it, but perhaps it was intended to mean that it now explicitly bypasses the
cache all the time?

A quick sample of what I mean:

root@ip-0.0.0.0:~# lvchange --cachesettings 'sequential_threshold=512'
vg/OriginLV
  Logical volume "OriginLV" changed.
root@ip-0.0.0.0:~# dd if=/dev/zero of=/mnt/cache/out29 oflag=direct bs=8M
count=200
200+0 records in
200+0 records out
1677721600 bytes (1.7 GB) copied, 5.88239 s, 285 MB/s
root@ip-0.0.0.0:~# lvchange --cachesettings 'sequential_threshold=0'
vg/OriginLV
  Logical volume "OriginLV" changed.
root@ip-0.0.0.0:~# dd if=/dev/zero of=/mnt/cache/out30 oflag=direct bs=8M
count=200
200+0 records in
200+0 records out
1677721600 bytes (1.7 GB) copied, 59.3204 s, 28.3 MB/s

While this was running, I was keeping an eye on the "Cpy%Sync" field from
the lvs command, and when running the dd with sequential_threshold=0, it
*never* moved - it stayed as 0.00 the entire time, suggesting that the
write never touched the cache.

In addition, the speed of the first write is consistent with the speed we
saw when writing directly to the cache device (formatted and mounted
without LVM), while the speed of the second write is consistent with what
we saw when writing directly to the backing device (formatted and mounted
without LVM).

Thanks,

- Andrew


-- 
Andrew Thorburn
Senior Software Engineer
Pivotal Labs
London
United Kingdom

--047d7b10c8890da33e05158f4714
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey folks,</div><div><br></div><div>We&#39;re current=
ly looking at DM Cache (and LVM Cache over it) as a way of dealing with wri=
te latencies on AWS, basically by using the ephemeral storage on an AWS VM =
as the cache, and EBS as the origin / long-term device.</div><div><br></div=
><div>As such, it&#39;s necessary to disable the sequential detection, as i=
t will never be more efficient to write to the EBS backing device.</div><di=
v><br></div><div>However, from some testing we&#39;ve done, it seems that s=
etting sequential_threshold to zero actually turns the cache into a write-a=
round cache (i.e. it never writes to the cache - it only writes to the devi=
ce directly), which suggests that either we&#39;ve misunderstood the docume=
ntation, or there is a bug in how the code works.</div><div><br></div><div>=
The documentation states:</div><div><br></div><div>&quot;If sequential thre=
shold is set to 0 the sequential I/O detection is disabled and sequential I=
/O will no longer implicitly bypass the cache.&quot;</div><div><br></div><d=
iv>I took that to mean it will always write to the cache and will never byp=
ass it, but perhaps it was intended to mean that it now explicitly bypasses=
 the cache all the time?</div><div><br></div><div>A quick sample of what I =
mean:</div><div><br></div><div>root@ip-0.0.0.0:~# lvchange --cachesettings =
&#39;sequential_threshold=3D512&#39; vg/OriginLV</div><div>=C2=A0 Logical v=
olume &quot;OriginLV&quot; changed.</div><div>root@ip-0.0.0.0:~# dd if=3D/d=
ev/zero of=3D/mnt/cache/out29 oflag=3Ddirect bs=3D8M count=3D200</div><div>=
200+0 records in</div><div>200+0 records out</div><div>1677721600 bytes (1.=
7 GB) copied, 5.88239 s, 285 MB/s</div><div>root@ip-0.0.0.0:~# lvchange --c=
achesettings &#39;sequential_threshold=3D0&#39; vg/OriginLV</div><div>=C2=
=A0 Logical volume &quot;OriginLV&quot; changed.</div><div>root@ip-0.0.0.0:=
~# dd if=3D/dev/zero of=3D/mnt/cache/out30 oflag=3Ddirect bs=3D8M count=3D2=
00</div><div>200+0 records in</div><div>200+0 records out</div><div>1677721=
600 bytes (1.7 GB) copied, 59.3204 s, 28.3 MB/s</div><div><br></div><div>Wh=
ile this was running, I was keeping an eye on the &quot;Cpy%Sync&quot; fiel=
d from the lvs command, and when running the dd with sequential_threshold=
=3D0, it *never* moved - it stayed as 0.00 the entire time, suggesting that=
 the write never touched the cache.</div><div><br></div><div>In addition, t=
he speed of the first write is consistent with the speed we saw when writin=
g directly to the cache device (formatted and mounted without LVM), while t=
he speed of the second write is consistent with what we saw when writing di=
rectly to the backing device (formatted and mounted without LVM).</div><div=
><br></div><div>Thanks,</div><div><br></div><div>- Andrew</div><div><br></d=
iv><div><br></div><div>--=C2=A0</div><div>Andrew Thorburn</div><div>Senior =
Software Engineer</div><div>Pivotal Labs</div><div>London</div><div>United =
Kingdom</div><div>
</div></div>

--047d7b10c8890da33e05158f4714--
