Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAFEZHvd028134
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 09:35:18 -0500
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFEZ2tA018375
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 09:35:03 -0500
Received: by qwj8 with SMTP id 8so113528qwj.33
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 06:35:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
Date: Mon, 15 Nov 2010 23:35:02 +0900
Message-ID: <AANLkTi=76kmpsTY=wFdW3HAje47ovanTT7LQEqF4f5Dd@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Content-Type: multipart/alternative; boundary=0016362839fa70768c0495185848
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0016362839fa70768c0495185848
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 13, 2010 at 06:52, chris (fool) mccraw <gently@gmail.com> wrote:

however, snapshots really shoot my system in the foot.  in my (12
> processor, 12GB RAM, x86_64 centos 5.5) server, i have two pricey
> areca hardware raid cards that give me ridiculous write performance:
> i can sustain over 700MByte/sec write speeds (writing a file with dd
> if=/dev/zero bs=1M, twice the size of the raid card's onboard memory
> and timing the write + a sync afterwards) to the volumes on either
> card (both backed by 7 or more fast disks).  enabling a single
> snapshot reduces that speed by a factor of 10!  enabling more
> snapshots isn't as drastic but still doesn't really scale well:
>


Once you have snapshots and are doing new dd's are you creating new files or
dd'ing over the old file?


> no snapshot  = ~11sec (727MB/sec)
> 1 snapshot   = ~102sec (78MB/sec)
> 2 snapshots  = ~144sec (55MB/sec)
> 3 snapshots  = ~313sec (25MB/sec)
> 4 snapshots  = ~607sec (15MB/sec)
>

I would assume a "yes", but does your write performance return to normal
after you remove all the snapshots?

Romeo

--0016362839fa70768c0495185848
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sat, Nov 13, 2010 at 06:52, chris (fo=
ol) mccraw <span dir=3D"ltr">&lt;<a href=3D"mailto:gently@gmail.com">gently=
@gmail.com</a>&gt;</span> wrote:</div><div class=3D"gmail_quote"><br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex;">

however, snapshots really shoot my system in the foot. =A0in my (12<br>
processor, 12GB RAM, x86_64 centos 5.5) server, i have two pricey<br>
areca hardware raid cards that give me ridiculous write performance:<br>
i can sustain over 700MByte/sec write speeds (writing a file with dd<br>
if=3D/dev/zero bs=3D1M, twice the size of the raid card&#39;s onboard memor=
y<br>
and timing the write + a sync afterwards) to the volumes on either<br>
card (both backed by 7 or more fast disks). =A0enabling a single<br>
snapshot reduces that speed by a factor of 10! =A0enabling more<br>
snapshots isn&#39;t as drastic but still doesn&#39;t really scale well:<br>=
</blockquote><div><br></div><div><br></div><div>Once you have snapshots and=
 are doing new dd&#39;s are you creating new files or dd&#39;ing over the o=
ld file?</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex;">
no snapshot =A0=3D ~11sec (727MB/sec)<br>
1 snapshot =A0 =3D ~102sec (78MB/sec)<br>
2 snapshots =A0=3D ~144sec (55MB/sec)<br>
3 snapshots =A0=3D ~313sec (25MB/sec)<br>
4 snapshots =A0=3D ~607sec (15MB/sec)<br></blockquote><div><br></div><div>I=
 would assume a &quot;yes&quot;, but does your write performance return to =
normal after you remove all the snapshots?</div><div><br></div><div>Romeo</=
div>
</div>

--0016362839fa70768c0495185848--
