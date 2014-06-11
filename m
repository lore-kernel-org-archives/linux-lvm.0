Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5B8hk92019206
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2014 04:43:46 -0400
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5B8hhas009681
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2014 04:43:44 -0400
Received: by mail-la0-f41.google.com with SMTP id hz20so239691lab.0
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2014 01:43:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53980AF8.6060303@mglug.de>
References: <CAFrGbuXWhQaPBGhc60oaE-WP__vrnJ32to-uWkcVZOrX2yBmzA@mail.gmail.com>
	<53980AF8.6060303@mglug.de>
Date: Wed, 11 Jun 2014 10:43:43 +0200
Message-ID: <CAFrGbuUYwj9xasnQZ8DYkFoj2qoZxjE7ui6Tf4Uj7bxzR2P2jA@mail.gmail.com>
From: alessandro macuz <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=089e0160be4e16a7a604fb8b71eb
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--089e0160be4e16a7a604fb8b71eb
Content-Type: text/plain; charset=UTF-8

2014-06-11 9:53 GMT+02:00 Oliver Rath <rath@mglug.de>:

>  Hi Alex,
>
> Im not sure if I understand right: You take a zfv-Volume to create a lvm
> volume inside? Make it sense to mix two similar concepts in this way? Imho
> zfs and lvm are focussed to different goals, so if you combine it, you get
> the worse of both.
>
> What is your goal mixing these concepts? If you have created a zfs-volume,
> you can mount it directly without detouring over lvm and vice versa.
>
> I think it is much better to decide for one of these (zfs-volumes XOR
> lvm-Volumes) depending on your needs.
>
> Just my 2ct
>
> Regards
> Oliver
>
>
Hi Oliver,

I see and back your point since the flexibility given by LVM can be
obtained with ZFS as well.
In this case I'm not trying to achieve anything but rather dealing with
something already existing and without making too many changes I'd like to
access that volume. I think my reasoning is correct but somehow I see
something non-expected. I thought I could use pvs, and lvs later on, on any
block device as for any physical disks.

Maybe pvs is coded to work only with some devices on purpose, I haven't
looked at the source. I don't think what I'm doing is wrong in theory and I
would like to know if instead, from the theoretically point of view, it is.

Thanks, Alex

--089e0160be4e16a7a604fb8b71eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">2014-06-11 9:53 GMT+02:00 Oliver Rath <span dir=3D"ltr">&lt;<a href=3D"=
mailto:rath@mglug.de" target=3D"_blank">rath@mglug.de</a>&gt;</span>:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pad=
ding-left:1ex">

 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div>Hi Alex,<br>
      <br>
      Im not sure if I understand right: You take a zfv-Volume to create
      a lvm volume inside? Make it sense to mix two similar concepts in
      this way? Imho zfs and lvm are focussed to different goals, so if
      you combine it, you get the worse of both.<br>
      <br>
      What is your goal mixing these concepts? If you have created a
      zfs-volume, you can mount it directly without detouring over lvm
      and vice versa.<br>
      <br>
      I think it is much better to decide for one of these (zfs-volumes
      XOR lvm-Volumes) depending on your needs. <br>
      <br>
      Just my 2ct<br>
      <br>
      Regards<br>
      Oliver<br>
      <br></div></div></blockquote><div><br></div>Hi Oliver,<div><br></div>=
<div>I see and back your point since the flexibility given by LVM can be ob=
tained with ZFS as well.</div><div>In this case I&#39;m not trying to achie=
ve anything but rather dealing with something already existing and without =
making too many changes I&#39;d like to access that volume. I think my reas=
oning is correct but somehow I see something non-expected. I thought I coul=
d use pvs, and lvs later on, on any block device as for any physical disks.=
</div>
<div><br></div><div>Maybe pvs is coded to work only with some devices on pu=
rpose, I haven&#39;t looked at the source. I don&#39;t think what I&#39;m d=
oing is wrong in theory and I would like to know if instead, from the theor=
etically point of view, it is.</div>
<div><br></div><div>Thanks, Alex</div><div>=C2=A0</div></div></div></div>

--089e0160be4e16a7a604fb8b71eb--
