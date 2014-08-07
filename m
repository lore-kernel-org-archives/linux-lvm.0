Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7753GVn007129
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 01:03:16 -0400
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7753EhE017057
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 01:03:14 -0400
Received: by mail-yh0-f54.google.com with SMTP id v1so2589763yhn.13
	for <linux-lvm@redhat.com>; Wed, 06 Aug 2014 22:03:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAN_kG2zpfi6iStRDmpGRJD7Wg-EX-P4Ok7Y9Uo5n8jnanEyuQ@mail.gmail.com>
References: <CAAN_kG2zpfi6iStRDmpGRJD7Wg-EX-P4Ok7Y9Uo5n8jnanEyuQ@mail.gmail.com>
Date: Wed, 6 Aug 2014 22:03:13 -0700
Message-ID: <CAAN_kG0s1NR8ZVSQy29qOWxP0T+6axwQXo34v4_iydn5yzFMfg@mail.gmail.com>
From: Timur Alperovich <timur@maginatics.com>
Content-Type: multipart/alternative; boundary=047d7bf0d93285938b0500030125
Subject: Re: [linux-lvm] LVM thin pool discard_max_bytes reports 0
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

--047d7bf0d93285938b0500030125
Content-Type: text/plain; charset=UTF-8

I have managed to answer my own questions.

On Wed, Aug 6, 2014 at 8:48 PM, Timur Alperovich <timur@maginatics.com>
wrote:

> Hi there,
>
> I was trying to understand why fstrim would fail on an LVM thin
> provisioned volume and figured out that the discard_max_bytes is reported
> as 0 in /sys/block/dm-N/queue/discard_max_bytes (I checked the device that
> corresponded to the LVM pool that the volume is created within). The
> discard options are also disabled for the thin volume itself. I'm observing
> this issue on an Ubuntu 12.04 system, running kernel 3.8.0-32, and LVM2
> 2.02.98 backported to Ubuntu 12.04 (
> https://launchpad.net/~timur-alperovich/+archive/ubuntu/ppa/+packages).
>
> I did a small experiment where I created another LVM pool within the same
> volume group and the discard value was set to 65536 for that device. I'm
> not sure if it matters, but the system is an running on ESXi 5.0 host.
> While I don't necessarily expect discard to propagate to the host, I was
> hoping to reclaim the block in the thin pool itself.
>
> Could anyone shed some light on why discard may be disabled on an LVM thin
> pool device? I tried looking for any bugs specific to TRIM or discard
> subsequent to 2.02.98, but could not find anything definitive.
>

I noticed the following in the 2.02.98 changelog:
"Reinstate correct default to ignore discards for thin metadata from old
tools."

and this looks like the associated commit:
commit 109b3bb49b31d5fa7f6d0dd23345d703ab866ad6
Author: Zdenek Kabelac <zkabelac@redhat.com>
Date:   Tue Aug 21 15:51:54 2012 +0200

    thin: discard

The commit changes the default discard value to "ignore" and this can be
confirmed with lvs -o +discards


> Also, is there a way to enable discard without having to recreate the thin
> pool?
>

Yes, it can be changed with lvchange --discards passdown (being mindful of
https://bugzilla.redhat.com/show_bug.cgi?id=903411)


>
> Thank you,
> Timur
>

Cheers,
Timur

--047d7bf0d93285938b0500030125
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have managed to answer my own questions.<div><br></div><=
div class=3D"gmail_extra"><div class=3D"gmail_quote">On Wed, Aug 6, 2014 at=
 8:48 PM, Timur Alperovich <span dir=3D"ltr">&lt;<a href=3D"mailto:timur@ma=
ginatics.com" target=3D"_blank">timur@maginatics.com</a>&gt;</span> wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr">Hi there,<div><br></div><div>I was trying=
 to understand why fstrim would fail on an LVM thin provisioned volume and =
figured out that the discard_max_bytes is reported as 0 in /sys/block/dm-N/=
queue/discard_max_bytes (I checked the device that corresponded to the LVM =
pool that the volume is created within). The discard options are also disab=
led for the thin volume itself. I&#39;m observing this issue on an Ubuntu 1=
2.04 system, running kernel 3.8.0-32, and LVM2 2.02.98 backported to Ubuntu=
 12.04 (<a href=3D"https://launchpad.net/~timur-alperovich/+archive/ubuntu/=
ppa/+packages" target=3D"_blank">https://launchpad.net/~timur-alperovich/+a=
rchive/ubuntu/ppa/+packages</a>).</div>

<div><br></div><div>I did a small experiment where I created another LVM po=
ol within the same volume group and the discard value was set to 65536 for =
that device. I&#39;m not sure if it matters, but the system is an running o=
n ESXi 5.0 host. While I don&#39;t necessarily expect discard to propagate =
to the host, I was hoping to reclaim the block in the thin pool itself.</di=
v>

<div><br></div><div>Could anyone shed some light on why discard may be disa=
bled on an LVM thin pool device? I tried looking for any bugs specific to T=
RIM or discard subsequent to 2.02.98, but could not find anything definitiv=
e.</div>
</div></blockquote><div><br></div><div>I noticed the following in the 2.02.=
98 changelog:<div>&quot;Reinstate correct default to ignore discards for th=
in metadata from old tools.&quot;</div><div><br></div><div>and this looks l=
ike the associated commit:<br>
<div>commit 109b3bb49b31d5fa7f6d0dd23345d703ab866ad6</div><div>Author: Zden=
ek Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@redhat.com</=
a>&gt;</div><div>Date: =C2=A0 Tue Aug 21 15:51:54 2012 +0200</div><div><br>=
</div>
<div>=C2=A0 =C2=A0 thin: discard</div></div></div><div>=C2=A0</div><div>The=
 commit changes the default discard value to &quot;ignore&quot; and this ca=
n be confirmed with lvs -o +discards</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<div dir=3D"ltr">
<div><br></div><div>Also, is there a way to enable discard without having t=
o recreate the thin pool?</div></div></blockquote><div><br></div><div>Yes, =
it can be changed with lvchange --discards passdown (being mindful of=C2=A0=
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D903411">https://bu=
gzilla.redhat.com/show_bug.cgi?id=3D903411</a>)<br>
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><di=
v>Thank you,</div>
<div>Timur</div></div>
</blockquote></div><br></div><div class=3D"gmail_extra">Cheers,</div><div c=
lass=3D"gmail_extra">Timur</div></div>

--047d7bf0d93285938b0500030125--
