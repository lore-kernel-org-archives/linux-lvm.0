Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8SHN0ID006155
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2009 13:23:00 -0400
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.25])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8SHMgW1023253
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2009 13:22:42 -0400
Received: by qw-out-2122.google.com with SMTP id 5so589794qwi.39
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2009 10:22:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0909281307510.30380@bmsred.bmsi.com>
References: <3b0f6ce80909281005h60e9a49bk215ede38716ee0ea@mail.gmail.com>
	<Pine.LNX.4.64.0909281307510.30380@bmsred.bmsi.com>
Date: Mon, 28 Sep 2009 10:22:41 -0700
Message-ID: <3b0f6ce80909281022x278fac22s385c889c43b3ca1@mail.gmail.com>
Subject: Re: [linux-lvm] lvm can not be extended
From: Yu Huang <paulhybryant@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd6b2ee9472d50474a68b58
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--000e0cd6b2ee9472d50474a68b58
Content-Type: text/plain; charset=ISO-8859-1

That helps a lot.

Thank you very much!

On Mon, Sep 28, 2009 at 10:10 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Mon, 28 Sep 2009, Yu Huang wrote:
>
> > I am new to lvm. I have installed my ubuntu 8.04 on LVM in my machine.
> >
> > I created a volume for the root partition. I used lvextend to extend the
> > size of the root volume.
> > In lvdisplay, it shows the LV size is 25.00G. But when I use df, it shows
> > the size of the root volume is
> > 5.00G, which is the original size I allocated to it.
> >
> > Am I missing something here?
>
> Definitely.  Df shows the filesystem size, not the LV size.  You probably
> want to extend the filesystem to match the LV.  In EL5, 'resize2fs' will
> resize a filesystem while it is mounted (Leave out the size, and it will
> resize
> to match the LV).  If the version on your Ubuntu doesn't know how to
> resize online, then you'll have to boot from CD or USB and run resize2fs.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000e0cd6b2ee9472d50474a68b58
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

That helps a lot. <br><br>Thank you very much!<br><br><div class=3D"gmail_q=
uote">On Mon, Sep 28, 2009 at 10:10 AM, Stuart D. Gathman <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;</span> wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div><div></div><=
div class=3D"h5">On Mon, 28 Sep 2009, Yu Huang wrote:<br>
<br>
&gt; I am new to lvm. I have installed my ubuntu 8.04 on LVM in my machine.=
<br>
&gt;<br>
&gt; I created a volume for the root partition. I used lvextend to extend t=
he<br>
&gt; size of the root volume.<br>
&gt; In lvdisplay, it shows the LV size is 25.00G. But when I use df, it sh=
ows<br>
&gt; the size of the root volume is<br>
&gt; 5.00G, which is the original size I allocated to it.<br>
&gt;<br>
&gt; Am I missing something here?<br>
<br>
</div></div>Definitely. =A0Df shows the filesystem size, not the LV size. =
=A0You probably<br>
want to extend the filesystem to match the LV. =A0In EL5, &#39;resize2fs&#3=
9; will<br>
resize a filesystem while it is mounted (Leave out the size, and it will re=
size<br>
to match the LV). =A0If the version on your Ubuntu doesn&#39;t know how to<=
br>
resize online, then you&#39;ll have to boot from CD or USB and run resize2f=
s.<br>
<br>
--<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0Stuart D. Gathman &lt;<a href=3D"mailto:stuart@=
bmsi.com">stuart@bmsi.com</a>&gt;<br>
 =A0 =A0Business Management Systems Inc. =A0Phone: 703 591-0911 Fax: 703 59=
1-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background so=
ng for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commer=
cial.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--000e0cd6b2ee9472d50474a68b58--
