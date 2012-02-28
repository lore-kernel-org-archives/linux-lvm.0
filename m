Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1SN85iZ010096
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2012 18:08:05 -0500
Received: from mail-vx0-f174.google.com (mail-vx0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1SN841S019941
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2012 18:08:04 -0500
Received: by vcqp1 with SMTP id p1so4397820vcq.33
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2012 15:08:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120227140821.3a093536@bettercgi.com>
References: <CANSbrroLh0NW1BRAeFGzC2J9EcdQZ8+FX-Hvh+ASPZ5CKJGZmg@mail.gmail.com>
	<20120227140821.3a093536@bettercgi.com>
From: Anuj Goel <talk2anuj@gmail.com>
Date: Tue, 28 Feb 2012 18:07:43 -0500
Message-ID: <CANSbrrr-uEoraG1OqQWQuzAeEH6XEtmEHh5wd9nucgZW-Kq==w@mail.gmail.com>
Content-Type: multipart/alternative; boundary=bcaec51869ea88bca204ba0e4c40
Subject: Re: [linux-lvm] [Linux-lvm] Need help in understanding the logical
 to physical mapping by LVM
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
To: Ray Morris <support@bettercgi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--bcaec51869ea88bca204ba0e4c40
Content-Type: text/plain; charset=ISO-8859-1

Hi Ray,

I see that the /etc/lvm/backup has only one file which gives some basic
information about the physical volumes and logical volumes.

I am looking for some hints on where to look in the LVM code if I want to
see the entire sequence of address translation from a logical address given
by the application to the physical address on the underlying RAID5..
Any pointers to a document or paper explaining this would also be
appreciated !!

On Mon, Feb 27, 2012 at 3:08 PM, Ray Morris <support@bettercgi.com> wrote:

> > I want to understand how LVM maps a logical address to physical
> > address.
>
> Look in /etc/lvm/backup/* to see the actual map.
> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
>
>
> On Sat, 25 Feb 2012 16:53:42 -0500
> Anuj Goel <talk2anuj@gmail.com> wrote:
>
> > Hi guys,
> > I want to understand how LVM maps a logical address to physical
> > address. I have downloaded the LVM code, but cannot figure out which
> > files to look into.
> >
> > Can you please give some suggestions.
> >
>
>

--bcaec51869ea88bca204ba0e4c40
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Ray,<div><br></div><div>I see that the /etc/lvm/backup has only one file=
 which gives some basic information about the physical volumes and logical =
volumes.</div><div><br></div><div>I am looking for some hints on where to l=
ook in the LVM code if I want to see the entire sequence of address transla=
tion from a logical address given by the application to the physical addres=
s on the underlying RAID5..</div>

<div>Any pointers to a document or paper explaining this would also be appr=
eciated !!<br><br><div class=3D"gmail_quote">On Mon, Feb 27, 2012 at 3:08 P=
M, Ray Morris <span dir=3D"ltr">&lt;<a href=3D"mailto:support@bettercgi.com=
">support@bettercgi.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">&gt; I want to understand =
how LVM maps a logical address to physical<br>
&gt; address.<br>
<br>
</div>Look in /etc/lvm/backup/* to see the actual map.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Ray Morris<br>
<a href=3D"mailto:support@bettercgi.com">support@bettercgi.com</a><br>
<br>
Strongbox - The next generation in site security:<br>
<a href=3D"http://www.bettercgi.com/strongbox/" target=3D"_blank">http://ww=
w.bettercgi.com/strongbox/</a><br>
<br>
Throttlebox - Intelligent Bandwidth Control<br>
<a href=3D"http://www.bettercgi.com/throttlebox/" target=3D"_blank">http://=
www.bettercgi.com/throttlebox/</a><br>
<br>
Strongbox / Throttlebox affiliate program:<br>
<a href=3D"http://www.bettercgi.com/affiliates/user/register.php" target=3D=
"_blank">http://www.bettercgi.com/affiliates/user/register.php</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<br>
On Sat, 25 Feb 2012 16:53:42 -0500<br>
Anuj Goel &lt;<a href=3D"mailto:talk2anuj@gmail.com">talk2anuj@gmail.com</a=
>&gt; wrote:<br>
<br>
&gt; Hi guys,<br>
&gt; I want to understand how LVM maps a logical address to physical<br>
&gt; address. I have downloaded the LVM code, but cannot figure out which<b=
r>
&gt; files to look into.<br>
&gt;<br>
&gt; Can you please give some suggestions.<br>
&gt;<br>
<br>
</div></div></blockquote></div><br>
</div>

--bcaec51869ea88bca204ba0e4c40--
