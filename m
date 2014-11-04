Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA4GGr3g022247
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2014 11:16:53 -0500
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA4GGYv2018161
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2014 11:16:36 -0500
Received: by mail-lb0-f176.google.com with SMTP id 10so497822lbg.21
	for <linux-lvm@redhat.com>; Tue, 04 Nov 2014 08:16:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <A61B185A3ECC9B42B8B4B761DDA0523BE4E58BB2@CORPOWM-24.cgiclients.com>
References: <CAHDsjKtjVuOVsEtzPpt-7x8BV1ficT7RQb5TVyUenutnuAnqMw@mail.gmail.com>
	<545893A6.2020503@redhat.com>
	<A61B185A3ECC9B42B8B4B761DDA0523BE4E58BB2@CORPOWM-24.cgiclients.com>
From: Daniel Savard <daniel.savard@gmail.com>
Date: Tue, 4 Nov 2014 11:10:13 -0500
Message-ID: <CAHDsjKtqkfqVz+UMkwNZdJJnd15qKrbFzxAnumNfoeCFZ=juEQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7b3a8238fda66b05070ab3ae
Subject: Re: [linux-lvm] Volume "avg/alv" is not active locally.
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

--047d7b3a8238fda66b05070ab3ae
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks guys,

the problem was with volume_list in /etc/lvm/lvm.conf missing the new LV.

-----------------
Daniel Savard

2014-11-04 8:18 GMT-05:00 Aubin, Jean-Francois <jean-francois.aubin@cgi.com=
>
:

> Hi Daniel,
>
> Post your lvm.conf. All disk sdX is on SAN or  Local disk? If in SAN, do
> you use multiphating? If yes, watch your blacklist in multipath.conf or
> other typo error.
>
> Bonne journ=C3=A9e!
>
> J-F Aubin
>
> -----Message d'origine-----
> De : linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> De la part de Peter Rajnoha
> Envoy=C3=A9 : 4 novembre 2014 03:52
> =C3=80 : daniel.savard@gmail.com
> Cc : LVM general discussion and development
> Objet : Re: [linux-lvm] Volume "avg/alv" is not active locally.
>
> On 11/04/2014 02:15 AM, Daniel Savard wrote:
> > Hi,
> >
> > I am running LVM2 on linux (Gentoo) with systemd and dracut. I ran
> > into a problem I am unable to find the cause.
> >
> > I am trying to create a LV and I received an error as per the subject
> > of this post.
> >
> > For example:
> >
> > feynman ~ # lvcreate -a y --contiguous y --size 1G --name db2data
> > donneesvg   Volume "donneesvg/db2data" is not active locally.
> >   Aborting. Failed to wipe start of new LV.
> >
> > What is going on? Any hints? What does it mean "not active locally"?
>
> LVM tries to wipe the LV - zero out first 4KiB of data and also any old
> signatures it may find on any newly created LV for it to be properly
> initialized.
>
> But this LV has not been activated. One reason may be that you have
> activation/volume_list set in LVM configuration (/etc/lvm/lvm.conf) and i=
t
> does not include the name of the LV you're just creating.
>
> The "lvcreate -vvvv ...." should provide more info on why the activation
> has been skipped.
>
> --
> Peter
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--047d7b3a8238fda66b05070ab3ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks guys,<br><br>the problem was with volume_list in /e=
tc/lvm/lvm.conf missing the new LV.<br></div><div class=3D"gmail_extra"><br=
 clear=3D"all"><div><div class=3D"gmail_signature">-----------------<br>Dan=
iel Savard</div></div>
<br><div class=3D"gmail_quote">2014-11-04 8:18 GMT-05:00 Aubin, Jean-Franco=
is <span dir=3D"ltr">&lt;<a href=3D"mailto:jean-francois.aubin@cgi.com" tar=
get=3D"_blank">jean-francois.aubin@cgi.com</a>&gt;</span>:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Hi Daniel,<br>
<br>
Post your lvm.conf. All disk sdX is on SAN or=C2=A0 Local disk? If in SAN, =
do you use multiphating? If yes, watch your blacklist in multipath.conf or =
other typo error.<br>
<br>
Bonne journ=C3=A9e!<br>
<br>
J-F Aubin<br>
<br>
-----Message d&#39;origine-----<br>
De=C2=A0: <a href=3D"mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces=
@redhat.com</a> [mailto:<a href=3D"mailto:linux-lvm-bounces@redhat.com">lin=
ux-lvm-bounces@redhat.com</a>] De la part de Peter Rajnoha<br>
Envoy=C3=A9=C2=A0: 4 novembre 2014 03:52<br>
=C3=80=C2=A0: <a href=3D"mailto:daniel.savard@gmail.com">daniel.savard@gmai=
l.com</a><br>
Cc=C2=A0: LVM general discussion and development<br>
Objet=C2=A0: Re: [linux-lvm] Volume &quot;avg/alv&quot; is not active local=
ly.<br>
<div><div class=3D"h5"><br>
On 11/04/2014 02:15 AM, Daniel Savard wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am running LVM2 on linux (Gentoo) with systemd and dracut. I ran<br>
&gt; into a problem I am unable to find the cause.<br>
&gt;<br>
&gt; I am trying to create a LV and I received an error as per the subject<=
br>
&gt; of this post.<br>
&gt;<br>
&gt; For example:<br>
&gt;<br>
&gt; feynman ~ # lvcreate -a y --contiguous y --size 1G --name db2data<br>
&gt; donneesvg=C2=A0 =C2=A0Volume &quot;donneesvg/db2data&quot; is not acti=
ve locally.<br>
&gt;=C2=A0 =C2=A0Aborting. Failed to wipe start of new LV.<br>
&gt;<br>
&gt; What is going on? Any hints? What does it mean &quot;not active locall=
y&quot;?<br>
<br>
LVM tries to wipe the LV - zero out first 4KiB of data and also any old sig=
natures it may find on any newly created LV for it to be properly initializ=
ed.<br>
<br>
But this LV has not been activated. One reason may be that you have activat=
ion/volume_list set in LVM configuration (/etc/lvm/lvm.conf) and it does no=
t include the name of the LV you&#39;re just creating.<br>
<br>
The &quot;lvcreate -vvvv ....&quot; should provide more info on why the act=
ivation has been skipped.<br>
<br>
--<br>
Peter<br>
<br>
</div></div>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></div>

--047d7b3a8238fda66b05070ab3ae--
