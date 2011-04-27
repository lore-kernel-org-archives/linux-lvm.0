Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3RM3Vm2000791
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 18:03:32 -0400
Received: from mail-yw0-f46.google.com (mail-yw0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3RM3SvJ020425
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 18:03:28 -0400
Received: by ywj3 with SMTP id 3so1057838ywj.33
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 15:03:28 -0700 (PDT)
MIME-Version: 1.0
Sender: cjstreeter@gmail.com
In-Reply-To: <20110427095728.6317526d@bettercgi.com>
References: <BANLkTinf5PWmfm2YOMshbOUvh3+ht89jhA@mail.gmail.com>
	<alpine.LRH.2.00.1104262338440.3338@bmsred.bmsi.com>
	<BANLkTinZzxt2c01=uN6VUXVHFsbXK2Mm6A@mail.gmail.com>
	<20110427095728.6317526d@bettercgi.com>
From: Chris Streeter <chris@chrisstreeter.com>
Date: Wed, 27 Apr 2011 15:02:58 -0700
Message-ID: <BANLkTinqheB0NkHcM8ruT0Rxs-01xfnPgA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001485f90c6447497304a1ed9c5e
Subject: Re: [linux-lvm] Recovering Accidentally Destroyed LVM2 Information
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

--001485f90c6447497304a1ed9c5e
Content-Type: text/plain; charset=ISO-8859-1

Wow, thanks so much guys. I restored the config and then was able to run
fsck.ext3 on the device. It took a while to run and had to fix a bunch of
stuff, but it looks like my data is back. Very, very grateful.

Cheers!

- Chris

On Wed, Apr 27, 2011 at 07:57, Ray Morris <support@bettercgi.com> wrote:

> vgcfgrestore -f /etc/lvm/archive/FILENAME VGNAME
>
> But see "man vgcfgrestore"
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
> On Tue, 26 Apr 2011 20:58:25 -0700
> Chris Streeter <chris@chrisstreeter.com> wrote:
>
> > > What you *should* have done is restore the metadata to the point
> > > before your errant command.  You can still do that (if it is still
> > > in the archive), but the several K of zeros written to the start of
> > > the LV you created will require recovery.
> >
> > So I still have all the files in the archive of the form
> > raid_vg_0000*.vg
> >
> > If have those files, how would I go about restoring the metadata to
> > the device? If I were to loose several K of data, I'm totally fine
> > with that.
> >
> > Thanks!
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001485f90c6447497304a1ed9c5e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Wow, thanks so much guys. I restored the config and then was able to run fs=
ck.ext3 on the device. It took a while to run and had to fix a bunch of stu=
ff, but it looks like my data is back. Very, very grateful.<div><br></div>

<div>Cheers!</div><div><br></div><div>- Chris<br><br><div class=3D"gmail_qu=
ote">On Wed, Apr 27, 2011 at 07:57, Ray Morris <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:support@bettercgi.com">support@bettercgi.com</a>&gt;</span> wro=
te:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">vgcfgrestore -f /etc/lvm/archive/FILENAME V=
GNAME<br>
<br>
But see &quot;man vgcfgrestore&quot;<br>
--<br>
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
<div><div></div><div class=3D"h5"><br>
<br>
<br>
<br>
On Tue, 26 Apr 2011 20:58:25 -0700<br>
Chris Streeter &lt;<a href=3D"mailto:chris@chrisstreeter.com">chris@chrisst=
reeter.com</a>&gt; wrote:<br>
<br>
&gt; &gt; What you *should* have done is restore the metadata to the point<=
br>
&gt; &gt; before your errant command. =A0You can still do that (if it is st=
ill<br>
&gt; &gt; in the archive), but the several K of zeros written to the start =
of<br>
&gt; &gt; the LV you created will require recovery.<br>
&gt;<br>
&gt; So I still have all the files in the archive of the form<br>
&gt; raid_vg_0000*.vg<br>
&gt;<br>
&gt; If have those files, how would I go about restoring the metadata to<br=
>
&gt; the device? If I were to loose several K of data, I&#39;m totally fine=
<br>
&gt; with that.<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
</div></div><div><div></div><div class=3D"h5">&gt; ________________________=
_______________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=
=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" ta=
rget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
&gt;<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></div></div></blockquote></=
div><br></div>

--001485f90c6447497304a1ed9c5e--
