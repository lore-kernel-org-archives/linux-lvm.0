Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u99J109t021193
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 9 Oct 2016 15:01:00 -0400
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 506ECC05678D
	for <linux-lvm@redhat.com>; Sun,  9 Oct 2016 19:00:59 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l131so86965769lfl.2
	for <linux-lvm@redhat.com>; Sun, 09 Oct 2016 12:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
	<CAE-HYsMGnYJ1FDohYcH3fszWb47iYzJtRGZJXJjLmajjyc-npw@mail.gmail.com>
In-Reply-To: <CAE-HYsMGnYJ1FDohYcH3fszWb47iYzJtRGZJXJjLmajjyc-npw@mail.gmail.com>
From: Slava Prisivko <vprisivko@gmail.com>
Date: Sun, 09 Oct 2016 19:00:46 +0000
Message-ID: <CANh6N62c7sZBmjJ1kid=uyZyBhXW_k6PS=bs9gZGEY5G2N5=1A@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7ba9731273f207053e73432f
Subject: Re: [linux-lvm] LVM RAID5 out-of-sync recovery
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

--047d7ba9731273f207053e73432f
Content-Type: text/plain; charset=UTF-8

Hi!

On Fri, Oct 7, 2016 at 9:49 AM Giuliano Procida <giuliano.procida@gmail.com>
wrote:

> Slava, the main problem I had was that LVM forbade many operations
> while I had a PV missing.
>
> In your case, apparently, all PVs are present. So I suggest the following:
>
> 1. examine the recent history in /etc/lvm/archive
> 2. diff each transition and see if you can understand what has
> happened at each stage
> 3. vgcfgrestore the most recent version that you think will allow you
> to activate your array, you can work backwards incrementally
> 4. check kernel logs!
> 5. scrub (resync) the array if needed
>

Since I cannot resync manually using your code and there are not MISSING
flags in /etc/lvm/archive and the different event count for the three
rmetas it seems it would not be helpful, would it?

I diffed the status quo of /etc/lvm/archive with the state before the
troubles and there is no significant difference and there is no difference
in IDs and no MISSING flags.

>
> Hope this helps,
> Giuliano.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--047d7ba9731273f207053e73432f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Fri, Oct 7, 2016 at 9:49 AM Giuliano Procida &lt;<a href=3D"mailto:giuliano=
.procida@gmail.com">giuliano.procida@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Slava, the main problem I had was that LVM forba=
de many operations<br class=3D"gmail_msg">
while I had a PV missing.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
In your case, apparently, all PVs are present. So I suggest the following:<=
br class=3D"gmail_msg">
<br class=3D"gmail_msg">
1. examine the recent history in /etc/lvm/archive<br class=3D"gmail_msg">
2. diff each transition and see if you can understand what has<br class=3D"=
gmail_msg">
happened at each stage<br class=3D"gmail_msg">
3. vgcfgrestore the most recent version that you think will allow you<br cl=
ass=3D"gmail_msg">
to activate your array, you can work backwards incrementally<br class=3D"gm=
ail_msg">
4. check kernel logs!<br class=3D"gmail_msg">
5. scrub (resync) the array if needed<br class=3D"gmail_msg"></blockquote><=
div><br></div><div>Since I cannot resync manually using your code and there=
 are not MISSING flags in /etc/lvm/archive and the different event count fo=
r the three rmetas it seems it would not be helpful, would it?=C2=A0</div><=
div><br></div><div>I diffed the status quo of /etc/lvm/archive with the sta=
te before the troubles and there is no significant difference and there is =
no difference in IDs and no MISSING flags.</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br class=3D"gmail_msg">
Hope this helps,<br class=3D"gmail_msg">
Giuliano.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
linux-lvm mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:linux-lvm@redhat.com" class=3D"gmail_msg" target=3D"_blan=
k">linux-lvm@redhat.com</a><br class=3D"gmail_msg">
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" class=3D"gmail_msg" target=3D"_blank">https://www.redhat.com/mailman/=
listinfo/linux-lvm</a><br class=3D"gmail_msg">
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" class=3D"gmail_msg" target=3D"_blank">http://tldp.org/HOWTO/LVM=
-HOWTO/</a><br class=3D"gmail_msg">
</blockquote></div></div>

--047d7ba9731273f207053e73432f--
