Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o682kmHZ004887
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 22:46:48 -0400
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o682kaOO032472
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 22:46:36 -0400
Received: by pwi5 with SMTP id 5so145405pwi.33
	for <linux-lvm@redhat.com>; Wed, 07 Jul 2010 19:46:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100706161745.GB31734@us.ibm.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
	<20100706161745.GB31734@us.ibm.com>
Date: Wed, 7 Jul 2010 19:46:36 -0700
Message-ID: <AANLkTinATF8nv02K4F0SQiR1OGg0rZ3P5lpsITcB-RYb@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd32be8809910048ad74bc3
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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

--000e0cd32be8809910048ad74bc3
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 6, 2010 at 9:17 AM, Malahal Naineni <malahal@us.ibm.com> wrote:


> If everything went right, he should have the new PV in the LV, but looks
> like something failed while activating the LV. Run 'dmsetup table' to
> find out if the LV currently has new PV or old PV. You need
> device-mapper knowledge for this.
>
> I will have to try that out. Will let you know.


>
> The best course of action would have been 'reading what ever data
> available' from old disk to new disk. If the disk is absolutely
> thrashed, then zero'ing the new PV may be better.
>
>
I did try to read anything I could out of the old disk. I do believe there
is still some data on it that wasn't trashed. The problem is how to find it
and reconstruct it without any of the LVM or ext4 filesystem  information
(as I said, I couldn't find any superblocks). Are there any utilities to do
something like that?

Then there are the remaining drives that weren't affected. Unfortunately
without the first drive, I can't get to anything on the others. Or can I?
I've tried several things, but I haven't found anything that works. Are
there any utilities for that?

I found an app that will scan a disk looking for lost partitions, and then
looking for various filesystems within them - and it does recognize ext2/3.
It will then recover files at that point. But it runs on windows (won't work
with wine), and it is taking several days to scan the entire drive (100G).
Also, there could be several hundred files, and trying to identify all of
those (possibly) recovered files would be excrutiating :-( .

As always, thx everyone for your help.

ken

--000e0cd32be8809910048ad74bc3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Tue, Jul 6, 2010 at 9:17 AM, Malahal =
Naineni <span dir=3D"ltr">&lt;<a href=3D"mailto:malahal@us.ibm.com">malahal=
@us.ibm.com</a>&gt;</span> wrote:<br><div>=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(20=
4, 204, 204); padding-left: 1ex;">
If everything went right, he should have the new PV in the LV, but looks<br=
>
like something failed while activating the LV. Run &#39;dmsetup table&#39; =
to<br>
find out if the LV currently has new PV or old PV. You need<br>
device-mapper knowledge for this.<br>
<div class=3D"im"><br></div></blockquote><div>I will have to try that out. =
Will let you know.<br>=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
<div class=3D"im">
<br>
</div>The best course of action would have been &#39;reading what ever data=
<br>
available&#39; from old disk to new disk. If the disk is absolutely<br>
thrashed, then zero&#39;ing the new PV may be better.<br>
<div><div></div><div class=3D"h5"><br></div></div></blockquote><div>=A0</di=
v></div>I did try to read anything I could out of the old disk. I do believ=
e there is still some data on it that wasn&#39;t trashed. The problem is ho=
w to find it and reconstruct it without any of the LVM or ext4 filesystem=
=A0 information (as I said, I couldn&#39;t find any superblocks). Are there=
 any utilities to do something like that?<br>
<br>Then there are the remaining drives that weren&#39;t affected. Unfortun=
ately without the first drive, I can&#39;t get to anything on the others. O=
r can I? I&#39;ve tried several things, but I haven&#39;t found anything th=
at works. Are there any utilities for that?<br>
<br>I found an app that will scan a disk looking for lost partitions, and t=
hen looking for various filesystems within them - and it does recognize ext=
2/3. It will then recover files at that point. But it runs on windows (won&=
#39;t work with wine), and it is taking several days to scan the entire dri=
ve (100G). Also, there could be several hundred files, and trying to identi=
fy all of those (possibly) recovered files would be excrutiating :-( .<br>
<br>As always, thx everyone for your help.<br><br>ken<br>

--000e0cd32be8809910048ad74bc3--
