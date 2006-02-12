Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1C5qW117511
	for <linux-lvm@redhat.com>; Sun, 12 Feb 2006 00:52:32 -0500
Received: from relay16-159.bu.edu (relay16-159.bu.edu [128.197.159.83])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1C5qLrb005736
	for <linux-lvm@redhat.com>; Sun, 12 Feb 2006 00:52:23 -0500
From: Geoff Mishkin <gmishkin@acs.bu.edu>
Subject: Re: [linux-lvm] missing device nodes for vg, but vg appears in scan
Date: Sun, 12 Feb 2006 00:51:06 -0500
References: <200601221454.10959.gmishkin@acs.bu.edu>
	<200602112019.16075.krakrjak@volumehost.net>
In-Reply-To: <200602112019.16075.krakrjak@volumehost.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1558340.AEy6GDnoeT";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200602120051.14718.gmishkin@acs.bu.edu>
Reply-To: gmishkin@bu.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Zac Slade <krakrjak@volumehost.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--nextPart1558340.AEy6GDnoeT
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi, and thanks for the response.  Unfortunately it is still not working.  F=
or=20
completeness, I have:

device-mapper: 4.4.0-ioctl (2005-01-12) (Kernel)
device-mapper 1.01.03 (Userspace)


On Saturday 11 February 2006 09:19 pm, Zac Slade wrote:
> On Sunday 22 January 2006 13:53, Geoff Mishkin wrote:
> > I am using lvm2 2.01.09 on Gentoo Linux.  My kernel version is 2.6.15 a=
nd
> > I'm using udev 079.
>
> I'm running 2.6.15 also using lvm
>
> > I am trying to set up an LVM2 VG using a loop device.  My problem is th=
at
> > device nodes are never created for my VG.  However, my VG shows up in
> > scans (vgscan) and displays (vgdisplay).  Even vgscan --mknodes does not
> > make the nodes.  Because I never get a node for my VG, I can't figure o=
ut
> > how I am supposed to create LV's in it.
>
> First make sure that /etc/lvm/lvm.conf is not filtering out /dev/loop/
> devices.  Based on the ouput you gave from pvcreate I guess that it isn't,
> but you should double check anyway.  Also read through the options in that
> file one might jump out at you.
>
I checked this and it is fine.  No other options jump out at me.

> > I have the modules loop, dm-mod and dm-snapshot loaded.  Therefore, I do
> > have /dev/mapper/control.  Here is what I have done so far:
>
> dm-mod is the only required module.  Well and loop for your set up.
>
Okay well I suppose I'd need dm-snapshot eventually if I ever get this part=
=20
working. :)

> > It looks like my VG is there, but it still isn't showing up in /dev.  I
> > read something about how if udev isn't configured properly, you will get
> > devices like /dev/dm-# where # is 0-9, instead of named VG nodes.  I
> > don't have those either, but I follow the instructions which are to
> > uncomment a line in my udev rules:
> >
> > KERNEL=3D=3D"dm-[0-9]*",    PROGRAM=3D"/sbin/devmap_name %M %m", NAME=
=3D"%k",
> > SYMLINK+=3D"%c"
>
> I looked at my /etc/udev/rules.d/50-udev.rules and I have the following:
> # dm devices (ignore them)
> KERNEL=3D=3D"dm-[0-9]*",    OPTIONS=3D"ignore_device"
> # create a symlink named after the device map name
> # note devmap_name comes with extras/multipath
> #KERNEL=3D=3D"dm-[0-9]*",   PROGRAM=3D"/sbin/devmap_name %M %m", NAME=3D"=
%k",
> SYMLINK+=3D"%c"
> KERNEL=3D=3D"device-mapper",        NAME=3D"mapper/control"
>
Now this is interesting.  So you say that you have working volume groups on=
=20
loop devices?  But you still have the "ignore_device" option active.  So I=
=20
went backed and switched this in my udev rules but it still didn't work.

> I'm just not sure why they aren't getting created.  Even without vgscan y=
ou
> should get the devices if you are using udev.  Maybe you upgraded udev and
> zapped the new rules during and etc-update or dispatchconf.

I'm pretty careful about doing etc-update, and that section of my udev rule=
s=20
now looks the same as yours.  Is there anything else specific you think the=
=20
problem could be?

			--Geoff Mishkin <gmishkin@bu.edu>

--nextPart1558340.AEy6GDnoeT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBD7szSCByDbUAKi3URAi9XAJ4op8vOyh4urkrB77kGmGoO6MEfewCdFDbV
ghlKZEoeSHcASBju4uFrVZ4=
=Vl/v
-----END PGP SIGNATURE-----

--nextPart1558340.AEy6GDnoeT--
