Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k73IPgMZ014621
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 14:25:42 -0400
Received: from dark-templar.advansoft.us ([166.70.63.214])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k73IPfYC007287
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 14:25:41 -0400
Received: from dhcp189.glwlan.gurulabs.com (hq-nat2.gurulabs.com
	[67.137.148.11])
	by dark-templar.advansoft.us (Postfix) with ESMTP id 2552A68125
	for <linux-lvm@redhat.com>; Thu,  3 Aug 2006 11:54:40 -0600 (MDT)
From: "Lamont R. Peterson" <peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] pvresize, resize 8e Linux LVM partition
Date: Thu, 3 Aug 2006 11:54:29 -0600
References: <ebf0fc470608022227j23bbe62dkffd4df84e727edc9@mail.gmail.com>
In-Reply-To: <ebf0fc470608022227j23bbe62dkffd4df84e727edc9@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200608031154.32467.peregrine@openbrainstem.net>
Content-Type: multipart/signed; boundary="nextPart2368980.9DxfQJoDnq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
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
To: LVM <linux-lvm@redhat.com>

--nextPart2368980.9DxfQJoDnq
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 02 August 2006 11:27 pm, Stanislaw Senotrusov wrote:
> Hello.
>
> Trying to figure out how to resize LVM partition.
>
> I cloned hard drive using Acronis True Image and now have some space
> after LVM partition.
>
> As I see, before run pvresize I need to resize partition itself. Which
> tool can help me to do it? man pvresize refers to fdisk, but I can't
> understand how to use it for resize.

fdisk does not have a resize function.  Delete the existing partition and=20
recreate it, but bigger.  Be ***VERY*** careful; the most important thing i=
s=20
that the new partition must *begin* exactly where the old one did.

I would recommend writting down the cylinder numbers of the partition befor=
e=20
deleting it.

> Simply running pvresize does nothing.

Yup.  That's because he PV is already the full size of the partition it's=20
living on.  Although this is a case where using the disk raw would make=20
things easier (you could run pvresize without having to alter the partition=
=20
first), I would never recommend it.

> Actually I am trying to build some pipeline to quick make a test and
> production box from development one. I can make it manually by
> creating new pv and dump/restore, but its a 3 page of commands. And I
> still cant figure out that is the right tool for ext3 dump/restore.

Are you talking about data on the LVs you want to copy?  Are you also=20
including the entire OS?

Here is how I would do it:

1.  Kickstart install of new box (sets up LVM, includes packages, etc.)
2.  Run a script to install all of the needed configuration files for all t=
he=20
services the new server needs (could be run as part of the Kickstart).
3.  Copy the data the services will be "serving" to the new machine.

There are lots of ways to do step 3.  Personally, I like to avoid as much o=
f=20
computational overhead as possible at this stage, so I like NFS mounting an=
d=20
"cp -a".  Plain, simple, fast and comprehensive.  YMMV.

> Another way is create new pv in free space and add it to volume group
> - but after that this box will be a little different from the original
> one, thus I need additional tracking of its configuration.

I think you're right, that's not the right way to do it.
=2D-=20
Lamont R. Peterson <peregrine@OpenBrainstem.net>
=46ounder [ http://blog.OpenBrainstem.net/peregrine/ ]
GPG Key fingerprint: 0E35 93C5 4249 49F0 EC7B  4DDD BE46 4732 6460 CCB5
  ___                   ____            _           _
 / _ \ _ __   ___ _ __ | __ ) _ __ __ _(_)_ __  ___| |_ ___ _ __ ___
| | | | '_ \ / _ \ '_ \|  _ \| '__/ _` | | '_ \/ __| __/ _ \ '_ ` _ \
| |_| | |_) |  __/ | | | |_) | | | (_| | | | | \__ \ ||  __/ | | | | |
 \___/| .__/ \___|_| |_|____/|_|  \__,_|_|_| |_|___/\__\___|_| |_| |_|
      |_|               Intelligent Open Source Software Engineering
                              [ http://www.OpenBrainstem.net/ ]

--nextPart2368980.9DxfQJoDnq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBE0jhY+YBsl9wN1AkRAohJAKColDHQL/jSgfYOXNMFHyRIvDfQzACfUhDN
MgQIQUkyok25u5Q6q4UdKHk=
=Nuws
-----END PGP SIGNATURE-----

--nextPart2368980.9DxfQJoDnq--
