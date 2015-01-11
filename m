Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0BAlpqG022886
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 05:47:51 -0500
Received: from SMTP.EU.CITRIX.COM (smtp.eu.citrix.com [185.25.65.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0BAlm6r003768
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 05:47:49 -0500
From: Thanos Makatos <thanos.makatos@citrix.com>
Date: Sun, 11 Jan 2015 10:47:46 +0000
Message-ID: <2368A3FCF9F7214298E53C823B0A48EC042ED0A3@AMSPEX01CL02.citrite.net>
References: <2368A3FCF9F7214298E53C823B0A48EC042ECF3F@AMSPEX01CL02.citrite.net>,
	<1420926501.92697.YahooMailBasic@web181504.mail.ne1.yahoo.com>
In-Reply-To: <1420926501.92697.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] deleted LV recovery: understanding metadata format
 and determining LV extents
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
To: matthew patton <pattonme@yahoo.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

> > know how to interpret the "stripes" member. These are all linear LVs.
> >
> >     stripes =3D [=EF=BF=BD "pv0", 306705     ]
>
> do the values make sense from a 512byte block point of view? Either as ex=
tent-size * #extents =3D size in 512kb blocks,
> or as an absolute offset from the beginning of PV0 device? or it might be=
 the offset in extent-size from the beginning
> of the PV0 data area. Yeah, it's probably that.

I don't think these units are expressed in anything else but extent size un=
its (http://tldp.org/HOWTO/LVM-HOWTO/pe.html).

I did the following test: I created two LV and compared the LVM metadata ag=
ainst the output of lvdisplay -m, here's what I got:

First volume, LVM metadata:
segment1 {
	start_extent =3D 0
	extent_count =3D 256
	type =3D "striped"
	stripe_count =3D 1
	stripes =3D ["pv0", 2568]
}
First volume, lvdisplay -m:
--- Segments ---
Logical extent 0 to 255:
  Type                linear
  Physical volume     /dev/sda3
  Physical extents    2568 to 2823

Second volume, LVM metadata:
segment1 {
	start_extent =3D 0
	extent_count =3D 2567
	type =3D "striped"
	stripe_count =3D 1
	stripes =3D ["pv0", 1]
}
Second volume, lvdisplay -m:
--- Segments ---
Logical extent 0 to 2566:
  Type                linear
  Physical volume     /dev/sda3
  Physical extents    1 to 2567

Or have I got it completely wrong?
