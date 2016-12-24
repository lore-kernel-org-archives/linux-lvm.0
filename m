Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBOA82k5013172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 24 Dec 2016 05:08:02 -0500
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0196D8553C
	for <linux-lvm@redhat.com>; Sat, 24 Dec 2016 10:08:01 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id c20so154777321itb.0
	for <linux-lvm@redhat.com>; Sat, 24 Dec 2016 02:08:00 -0800 (PST)
MIME-Version: 1.0
From: Matt Joyce <mttjocy@gmail.com>
Date: Sat, 24 Dec 2016 10:07:39 +0000
Message-ID: <CAKGZFcgdtkwV9G_4fOWkk+ritm1Ef_mLA--r=WpBSNe_28dqFA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11449bbe649d09054464ad21
Subject: [linux-lvm] LVM cache "Manual Repair Required"
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

--001a11449bbe649d09054464ad21
Content-Type: text/plain; charset=UTF-8

I am having some issues with the cache on my LV preventing the LV from
activating correctly usually some time on google gives me answers to the
problem but this time I am having no luck everything I try results in the
same "Manual repair required!" error.

$ sudo lvchange -ay hdd-vg/data-lv
  Check of pool hdd-vg/data-lv_cache failed (status:1). Manual repair
required!

$ sudo lvconvert --repair hdd-vg/data-lv
  Can't repair LV "data-lv" of segtype cache.

$ sudo lvconvert --repair hdd-vg/data-lv_cache
  Internal error: pool_is_active called with non-pool LV data-lv_cache.
bad checksum in superblock
  Repair of thin metadata volume of thin pool hdd-vg/data-lv_cache failed
(status:1). Manual repair required!

$ sudo lvremove hdd-vg/data-lv_cache
Do you really want to remove and DISCARD logical volume data-lv_cache?
[y/n]: y
  Check of pool hdd-vg/data-lv_cache failed (status:1). Manual repair
required!
  Failed to active cache locally hdd-vg/data-lv.

I have even tried resorting to removing the entire origin LV and even the
VG since the data on it is completely replaceable but nothing works due to
the manual repair required error I am at a loss what else to try here.

--001a11449bbe649d09054464ad21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am having some issues with the cache on my LV preve=
nting the LV from activating correctly usually some time on google gives me=
 answers to the problem but this time I am having no luck everything I try =
results in the same &quot;Manual repair required!&quot; error.</div><div><b=
r></div><div>$ sudo lvchange -ay hdd-vg/data-lv</div><div>=C2=A0 Check of p=
ool hdd-vg/data-lv_cache failed (status:1). Manual repair required!</div><d=
iv><br></div><div><div>$ sudo lvconvert --repair hdd-vg/data-lv</div><div>=
=C2=A0 Can&#39;t repair LV &quot;data-lv&quot; of segtype cache.</div></div=
><div><br></div><div><div>$ sudo lvconvert --repair hdd-vg/data-lv_cache</d=
iv><div>=C2=A0 Internal error: pool_is_active called with non-pool LV data-=
lv_cache.</div><div>bad checksum in superblock</div><div>=C2=A0 Repair of t=
hin metadata volume of thin pool hdd-vg/data-lv_cache failed (status:1). Ma=
nual repair required!</div></div><div><br></div><div><div>$ sudo lvremove h=
dd-vg/data-lv_cache</div><div>Do you really want to remove and DISCARD logi=
cal volume data-lv_cache? [y/n]: y</div><div>=C2=A0 Check of pool hdd-vg/da=
ta-lv_cache failed (status:1). Manual repair required!</div><div>=C2=A0 Fai=
led to active cache locally hdd-vg/data-lv.</div></div><div><br></div><div>=
I have even tried resorting to removing the entire origin LV and even the V=
G since the data on it is completely replaceable but nothing works due to t=
he manual repair required error I am at a loss what else to try here.</div>=
</div>

--001a11449bbe649d09054464ad21--
