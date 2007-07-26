Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l6QKBAKK002616
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 16:11:10 -0400
Message-ID: <46A8FF67.1070405@redhat.com>
Date: Thu, 26 Jul 2007 21:09:11 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] libLVM progress?
References: <63576.192.52.57.33.1185480057.squirrel@webmail.wpi.edu>
In-Reply-To: <63576.192.52.57.33.1185480057.squirrel@webmail.wpi.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ken Stein wrote:
> * use system() or exec() style calls to run the command line LVM utilities
> as needed.  Works, but not exactly elegant, and definitely not efficient.

You'd be better off using the existing liblvm2cmd library. This gives
you a programmatic interface to the command line toolset. It will still
mean formatting commandlines/parsing returns but it cuts down on your
forking and allows the library to cache LVM2 internal data across
command invocations - potentially, that amounts to a big saving.

See doc/example_cmdlib.c in the LVM2 sources for a short example program.

> * delve deeply into the LVM utilities source code to find the ioctl calls
> and/or procfs+sysfs structures being used, then duplicate this in my own
> work.

Not a good idea - there's too much complexity involved and duplicating
that in separate projects would lead to something pretty unmaintainable
quite quickly.

> * use a premade LVM interface library.

There is work in progress to create this kind of interface.

Cheers,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGqP9n6YSQoMYUY94RAry/AJ4lv4Hpn0FSfK3Tb9jJNiOBdMg0qQCePJPf
Ospgi7Wiz5AyeZxecEbBi74=
=9vKT
-----END PGP SIGNATURE-----
