Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o65LGpkw027032
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 17:16:51 -0400
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o65LGfKW022556
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 17:16:41 -0400
Received: by pwi5 with SMTP id 5so1860271pwi.33
	for <linux-lvm@redhat.com>; Mon, 05 Jul 2010 14:16:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
Date: Mon, 5 Jul 2010 14:16:40 -0700
Message-ID: <AANLkTilNg_vFrTgoVXP40r6wZ5PyhwFC06jx_msWDauv@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd32f10f05182048aaa73b0
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

--000e0cd32f10f05182048aaa73b0
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 5, 2010 at 11:27 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Mon, 5 Jul 2010, Ken Bass wrote:
>
> > But what bothers me is this message I get when I run e2fsck (which runs
> > fsck.ext4):
> > "e2fsck: Invalid argument while trying to open
> > /dev/mapper/VolGroupX-LogVolX"
> >
> > Why am I getting that?
>
> Not an expert, just a user, but I suspect that the ioerr is because the
> metadata for that LV is still pointing to the missing PV.  (I know you
> replaced
> it, but that doesn't update the LV.)  I also noticed that the lvdisplay
> you posted says LogVolX belongs to VolGroupW, not VolGroupX.  Perhaps you
> sanitized the names and that is a typo - otherwise, there is something
> screwy.
>
>
Yes, I guess my sanitizing wasn't 100% sterile :-(.


> I suspect recovering the remaining data will require skipping the (huge)
> chuck of LV that was on the missing PV.  Or maybe the experts here
> will recommend editing the metadata to move the extent from the missing
> PV to the new PV.
>

That is what I am really trying to do. As I said early on, I was hoping to
find a backup superblock on the remaining part of the LV that might help
restore some of the data.. I have also looked at the metadata files, and was
wondering if I could manually rearrange the PVs. Any expert opinion on that?


FWIW: I found some utilities that supposedly will scan a drive with an
ext2/3 filesystem and recover files from it - although it only runs on
windows. It's free, so maybe worth a try.

thx to all for the help.

ken

--000e0cd32f10f05182048aaa73b0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Jul 5, 2010 at 11:27 AM, Stuart =
D. Gathman <span dir=3D"ltr">&lt;<a href=3D"mailto:stuart@bmsi.com">stuart@=
bmsi.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
<div class=3D"im">On Mon, 5 Jul 2010, Ken Bass wrote:<br>
<br>
&gt; But what bothers me is this message I get when I run e2fsck (which run=
s<br>
&gt; fsck.ext4):<br>
&gt; &quot;e2fsck: Invalid argument while trying to open<br>
&gt; /dev/mapper/VolGroupX-LogVolX&quot;<br>
&gt;<br>
&gt; Why am I getting that?<br>
<br>
</div>Not an expert, just a user, but I suspect that the ioerr is because t=
he<br>
metadata for that LV is still pointing to the missing PV. =A0(I know you re=
placed<br>
it, but that doesn&#39;t update the LV.) =A0I also noticed that the lvdispl=
ay<br>
you posted says LogVolX belongs to VolGroupW, not VolGroupX. =A0Perhaps you=
<br>
sanitized the names and that is a typo - otherwise, there is something scre=
wy.<br>
<br></blockquote><div><br>Yes, I guess my sanitizing wasn&#39;t 100% steril=
e :-(.<br>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: =
1ex;">

I suspect recovering the remaining data will require skipping the (huge)<br=
>
chuck of LV that was on the missing PV. =A0Or maybe the experts here<br>
will recommend editing the metadata to move the extent from the missing<br>
PV to the new PV.=A0 <br></blockquote><div><br>That is what I am really try=
ing to do. As I said early on, I was hoping to find a backup superblock on =
the remaining part of the LV that might help restore some of the data.. I h=
ave also looked at the metadata files, and was wondering if I could manuall=
y rearrange the PVs. Any expert opinion on that? <br>
<br>FWIW: I found some utilities that supposedly will scan a drive with an =
ext2/3 filesystem and recover files from it - although it only runs on wind=
ows. It&#39;s free, so maybe worth a try.<br><br>thx to all for the help.<b=
r>
<br>ken<br><br></div></div><br>

--000e0cd32f10f05182048aaa73b0--
