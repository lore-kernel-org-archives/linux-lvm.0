MIME-Version: 1.0
In-Reply-To: <53982262.3010205@redhat.com>
References: <CAFrGbuXWhQaPBGhc60oaE-WP__vrnJ32to-uWkcVZOrX2yBmzA@mail.gmail.com>
	<53980AF8.6060303@mglug.de>
	<CAFrGbuUYwj9xasnQZ8DYkFoj2qoZxjE7ui6Tf4Uj7bxzR2P2jA@mail.gmail.com>
	<53982262.3010205@redhat.com>
Date: Wed, 11 Jun 2014 12:11:35 +0200
Message-ID: <CAFrGbuUQZr7x5L+BOPSakuwdoO=axSi9vV5dvkSn_w7QH4tSHQ@mail.gmail.com>
From: alessandro macuz <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c3cca25be81904fb8cab68
Subject: Re: [linux-lvm] pvs -a on a partition of ZFS block device
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001a11c3cca25be81904fb8cab68
Content-Type: text/plain; charset=UTF-8

2014-06-11 11:33 GMT+02:00 Zdenek Kabelac <zkabelac@redhat.com>:

> Dne 11.6.2014 10:43, alessandro macuz napsal(a):
>
>>
>>
>> 2014-06-11 9:53 GMT+02:00 Oliver Rath <rath@mglug.de <mailto:
>> rath@mglug.de>>:
>>
>>
>>     Hi Alex,
>>
>>     Im not sure if I understand right: You take a zfv-Volume to create a
>> lvm
>>     volume inside? Make it sense to mix two similar concepts in this way?
>> Imho
>>     zfs and lvm are focussed to different goals, so if you combine it,
>> you get
>>     the worse of both.
>>
>>     What is your goal mixing these concepts? If you have created a
>> zfs-volume,
>>     you can mount it directly without detouring over lvm and vice versa.
>>
>>     I think it is much better to decide for one of these (zfs-volumes XOR
>>     lvm-Volumes) depending on your needs.
>>
>>     Just my 2ct
>>
>>     Regards
>>     Oliver
>>
>>
>> Hi Oliver,
>>
>> I see and back your point since the flexibility given by LVM can be
>> obtained
>> with ZFS as well.
>> In this case I'm not trying to achieve anything but rather dealing with
>> something already existing and without making too many changes I'd like to
>> access that volume. I think my reasoning is correct but somehow I see
>> something non-expected. I thought I could use pvs, and lvs later on, on
>> any
>> block device as for any physical disks.
>>
>> Maybe pvs is coded to work only with some devices on purpose, I haven't
>> looked
>> at the source. I don't think what I'm doing is wrong in theory and I would
>> like to know if instead, from the theoretically point of view, it is.
>>
>> Thanks, Alex
>>
>
> Support for  ZFS partitions has been embedded into 2.02.106 lvm2 version.
> You may as well add it to older version of lvm2 by updating your lvm.conf
>
> https://bugzilla.redhat.com/show_bug.cgi?id=913597
>
>
> You can add the following to your /etc/lvm.conf devices section to solve
> the issue:
>
> types = [ "zvol", 16 ]



Thanks Zdenek,

it works !

Alessandro

--001a11c3cca25be81904fb8cab68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2014=
-06-11 11:33 GMT+02:00 Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
Dne 11.6.2014 10:43, alessandro macuz napsal(a):<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
2014-06-11 9:53 GMT+02:00 Oliver Rath &lt;<a href=3D"mailto:rath@mglug.de" =
target=3D"_blank">rath@mglug.de</a> &lt;mailto:<a href=3D"mailto:rath@mglug=
.de" target=3D"_blank">rath@mglug.de</a>&gt;&gt;:<div><div class=3D"h5"><br=
>
<br>
=C2=A0 =C2=A0 Hi Alex,<br>
<br>
=C2=A0 =C2=A0 Im not sure if I understand right: You take a zfv-Volume to c=
reate a lvm<br>
=C2=A0 =C2=A0 volume inside? Make it sense to mix two similar concepts in t=
his way? Imho<br>
=C2=A0 =C2=A0 zfs and lvm are focussed to different goals, so if you combin=
e it, you get<br>
=C2=A0 =C2=A0 the worse of both.<br>
<br>
=C2=A0 =C2=A0 What is your goal mixing these concepts? If you have created =
a zfs-volume,<br>
=C2=A0 =C2=A0 you can mount it directly without detouring over lvm and vice=
 versa.<br>
<br>
=C2=A0 =C2=A0 I think it is much better to decide for one of these (zfs-vol=
umes XOR<br>
=C2=A0 =C2=A0 lvm-Volumes) depending on your needs.<br>
<br>
=C2=A0 =C2=A0 Just my 2ct<br>
<br>
=C2=A0 =C2=A0 Regards<br>
=C2=A0 =C2=A0 Oliver<br>
<br>
<br>
Hi Oliver,<br>
<br>
I see and back your point since the flexibility given by LVM can be obtaine=
d<br>
with ZFS as well.<br>
In this case I&#39;m not trying to achieve anything but rather dealing with=
<br>
something already existing and without making too many changes I&#39;d like=
 to<br>
access that volume. I think my reasoning is correct but somehow I see<br>
something non-expected. I thought I could use pvs, and lvs later on, on any=
<br>
block device as for any physical disks.<br>
<br>
Maybe pvs is coded to work only with some devices on purpose, I haven&#39;t=
 looked<br>
at the source. I don&#39;t think what I&#39;m doing is wrong in theory and =
I would<br>
like to know if instead, from the theoretically point of view, it is.<br>
<br>
Thanks, Alex<br>
</div></div></blockquote>
<br>
Support for =C2=A0ZFS partitions has been embedded into 2.02.106 lvm2 versi=
on.<br>
You may as well add it to older version of lvm2 by updating your lvm.conf<b=
r>
<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D913597" target=3D"=
_blank">https://bugzilla.redhat.com/<u></u>show_bug.cgi?id=3D913597</a><br>
<br>
<br>
You can add the following to your /etc/lvm.conf devices section to solve th=
e issue:<br>
<br>
types =3D [ &quot;zvol&quot;, 16 ]</blockquote><div><br></div><div><br></di=
v><div>Thanks Zdenek,</div><div><br></div><div>it works !</div><div><br></d=
iv><div>Alessandro</div></div></div></div>

--001a11c3cca25be81904fb8cab68--
