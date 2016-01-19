Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0JNN9BT008812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2016 18:23:09 -0500
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54]) by mx1.redhat.com (Postfix) with ESMTPS id 0475A742
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2016 23:23:09 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id h129so154468787lfh.3
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2016 15:23:08 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 19 Jan 2016 23:23:07 +0000
Message-ID: <CAD=NvSb8TsprJPuOTwCPALPiv9+LRCECy0WUNPx-iobCK5EJUg@mail.gmail.com>
From: Daniel Leong <daniel.leong@gmail.com>
Content-Type: multipart/alternative; boundary=001a113fb958ee95060529b826ad
Subject: [linux-lvm] Accessing LVM cache origin
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

--001a113fb958ee95060529b826ad
Content-Type: text/plain; charset=UTF-8

Hello,

I'm struggling to find information about lvmcache recovery after the cache
fails. Is it possible to access an LVcache origin if the PV for the cache
has failed?

If I try partial mode :
  lvchange -a y -P fedora/home

Then it just hangs.

If I try the home_corig directly :
  lvchange -a y -P fedora/home_corig

  "Unable to change internal LV home_corig directly"

I can see the LVs with :
   lvs -a -o +devices fedora

The home_corig is still on /dev/sdb3 so I can probably find the blocks if
needed ... but that seems like hard work!

At the moment [cache_cdata] and [cache_cmeta] are on "unknown device"
because it failed. Can I just extend to a new PV for the cache?

Thanks for any tips, and apologies if I'm being stupid.

Dan

--001a113fb958ee95060529b826ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m struggling to find infor=
mation about lvmcache recovery after the cache fails. Is it possible to acc=
ess an LVcache origin if the PV for the cache has failed?</div><div><br></d=
iv><div>If I try partial mode :</div><div>=C2=A0 lvchange -a y -P fedora/ho=
me</div><div><br></div><div>Then it just hangs.</div><div><br></div><div><d=
iv>If I try the home_corig directly :</div><div>=C2=A0 lvchange -a y -P fed=
ora/home_corig</div></div><div><br></div><div>=C2=A0 &quot;Unable to change=
 internal LV home_corig directly&quot;</div><div><br></div><div>I can see t=
he LVs with :</div><div>=C2=A0 =C2=A0lvs -a -o +devices fedora</div><div><b=
r></div><div>The home_corig is still on /dev/sdb3 so I can probably find th=
e blocks if needed ... but that seems like hard work!</div><div><br></div><=
div>At the moment [cache_cdata] and [cache_cmeta] are on &quot;unknown devi=
ce&quot; because it failed. Can I just extend to a new PV for the cache?=C2=
=A0</div><div><br></div><div>Thanks for any tips, and apologies if I&#39;m =
being stupid.</div><div><br></div><div>Dan</div><div><br></div></div>

--001a113fb958ee95060529b826ad--
