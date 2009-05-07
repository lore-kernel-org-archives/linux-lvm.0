Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n47Ge99P003528
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 12:40:09 -0400
Received: from mail-gx0-f206.google.com (mail-gx0-f206.google.com
	[209.85.217.206])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n47Gcrgv007059
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 12:38:53 -0400
Received: by gxk2 with SMTP id 2so1743711gxk.3
	for <linux-lvm@redhat.com>; Thu, 07 May 2009 09:38:53 -0700 (PDT)
MIME-Version: 1.0
Sender: jgspratt@gmail.com
In-Reply-To: <011d01c9cee6$f9873f00$ec95bd00$@no>
References: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>
	<4A02268F.8010105@whgl.uni-frankfurt.de>
	<1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
	<011d01c9cee6$f9873f00$ec95bd00$@no>
Date: Thu, 7 May 2009 09:38:53 -0700
Message-ID: <1f04f6fa0905070938u2a24f78q4e33f97da122aba4@mail.gmail.com>
Subject: Re: [linux-lvm] LVM and Truecrypt
From: Gordon Fogus <gordon.fogus@gmail.com>
Content-Type: multipart/alternative; boundary=001e680f10ecc227a1046955259b
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

--001e680f10ecc227a1046955259b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Gaute Lund: "I might add: You're aware that block-level/disk-level
encryption offers only
protection against someone stealing your box/disks, or otherwise compromise
it physically?"

I am not concerned with physical security of the machine while it is running
nor with using encryption to protect myself against remote attacks.
Excellent point though.

Sven Eschenberg: "Concerning encryption, I was asking, because if you use
linux as OS on your NAS and linux solely, you could use dmcrypt (which is
used by truecrypt on linux too, if available) which gives you more options
on encryption etc. (Choose any cipher from the kernel crypto api, luks key
managment ...). This is usually integrated far better into distributions,
than truecrypt."

Wow, Linux has built in crypto.  Windows has... :(  I will check this out.
I guess this means I need to get used to typing into the command box to do
everything.  I am using a 6TB RAID5 currently (5TB usable).  I find it
unbearably slow compared to my 4TB RAID0+1 (2TB usable).

Sven Eschenberg: "In case you want to avoid the luks header (since it
indicates some info on the crypted volume, offers multiple key slots etc.)
you can still revert to non-luks mode with dm-crypt and still enjoy all the
ciphers from the kernel (and modes of operation)."

Yes, I would definitely prefer not to have a header that says: "Secrets lurk
beyond".

Sven Eschenberg: "Concerning truecrypt: Truecrypt always uses XTS afaik, you
certainly would not want to encrypt a 10 TB volume with that.
(http://en.wikipedia.org/wiki/XTS#XTS)"

Ohhhh bother!  You sound like you know crypto better than I.  What mode of
operation do you recommend?  Is there a distro you would recommend for
crypto above others?  I was thinking of using Ubuntu because it has such a
large support base.

Sorry, I didn't look at your address.  I was in Frankfurt a few years ago.
Have you been to CCC ever?

Gordon


On Thu, May 7, 2009 at 12:39 AM, Gaute Lund <gaute@idrift.no> wrote:

> Gordon Fogus wrote Thursday, May 07, 2009 4:20 AM
>
> > On the other hand, if you were asking, "Why use encryption?", then you
> might be
> > interested in Sans news bites:
> http://www.sans.org/newsletters/newsbites/.
> > Sans covers many data leaks.
>
> I might add: You're aware that block-level/disk-level encryption offers
> only
> protection against someone stealing your box/disks, or otherwise compromise
> it physically?
>
> Remote "attacks" will be just as effective against a box with
> truecrypt/dm-crypt!
>
> -gaute
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001e680f10ecc227a1046955259b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Gaute Lund: &quot;I might add: You&#39;re aware that block-level/disk-level=
 encryption offers only<br>
protection against someone stealing your box/disks, or otherwise compromise=
<br>
it physically?&quot;<br><br>I am not concerned with physical security of th=
e machine while it is running nor with using encryption to protect myself a=
gainst remote attacks.=A0 Excellent point though.<br><br>Sven Eschenberg: &=
quot;Concerning encryption, I was asking, because if you use linux as OS on
your NAS and linux solely, you could use dmcrypt (which is used by
truecrypt on linux too, if available) which gives you more options on
encryption etc. (Choose any cipher from the kernel crypto api, luks key
managment ...). This is usually integrated far better into
distributions, than truecrypt.&quot;<br><br>Wow, Linux has built in crypto.=
=A0 Windows has... :(=A0 I will check this out.=A0 I guess this means I nee=
d to get used to typing into the command box to do everything.=A0 I am usin=
g a 6TB RAID5 currently (5TB usable).=A0 I find it unbearably slow compared=
 to my 4TB RAID0+1 (2TB usable).<br>
<br>
Sven Eschenberg: &quot;In case you want to avoid the luks header (since it =
indicates some info
on the crypted volume, offers multiple key slots etc.) you can still
revert to non-luks mode with dm-crypt and still enjoy all the ciphers
from the kernel (and modes of operation).&quot;<br><br>Yes, I would definit=
ely prefer not to have a header that says: &quot;Secrets lurk beyond&quot;.=
<br><br>
Sven Eschenberg: &quot;Concerning truecrypt: Truecrypt always uses XTS afai=
k, you certainly would not want to encrypt a 10 TB volume with that.<br>
(<a href=3D"http://en.wikipedia.org/wiki/XTS#XTS" target=3D"_blank">http://=
en.wikipedia.org/wiki/XTS#XTS</a>)&quot;<br><br>Ohhhh bother!=A0 You sound =
like you know crypto better than I.=A0 What mode of operation do you recomm=
end?=A0 Is there a distro you would recommend for crypto above others?=A0 I=
 was thinking of using Ubuntu because it has such a large support base.<br>
<br>Sorry, I didn&#39;t look at your address.=A0 I was in Frankfurt a few y=
ears ago.=A0 Have you been to CCC ever?<br><br>Gordon<br><br><br><div class=
=3D"gmail_quote">On Thu, May 7, 2009 at 12:39 AM, Gaute Lund <span dir=3D"l=
tr">&lt;<a href=3D"mailto:gaute@idrift.no">gaute@idrift.no</a>&gt;</span> w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Gordon Fogus wrot=
e Thursday, May 07, 2009 4:20 AM<br>
<div class=3D"im"><br>
&gt; On the other hand, if you were asking, &quot;Why use encryption?&quot;=
, then you<br>
might be<br>
&gt; interested in Sans news bites:<br>
<a href=3D"http://www.sans.org/newsletters/newsbites/" target=3D"_blank">ht=
tp://www.sans.org/newsletters/newsbites/</a>.=A0<br>
&gt; Sans covers many data leaks.<br>
<br>
</div>I might add: You&#39;re aware that block-level/disk-level encryption =
offers only<br>
protection against someone stealing your box/disks, or otherwise compromise=
<br>
it physically?<br>
<br>
Remote &quot;attacks&quot; will be just as effective against a box with<br>
truecrypt/dm-crypt!<br>
<font color=3D"#888888"><br>
-gaute<br>
</font><div><div></div><div class=3D"h5"><br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--001e680f10ecc227a1046955259b--
