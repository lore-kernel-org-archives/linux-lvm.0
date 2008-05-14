Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4E93Idk012560
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 05:03:19 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m4E93IBe012539
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 05:03:18 -0400
Message-ID: <482AAAD6.2030405@redhat.com>
Date: Wed, 14 May 2008 10:03:18 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] recovering data from hdd
References: <482A3BF1.9020607@verizon.net>
In-Reply-To: <482A3BF1.9020607@verizon.net>
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

Gerry Reno wrote:
> I have a machine that suffered a lightning hit and it's toast.  Even
> with surge protectors it still got zapped.  Anyway, I'm not going to
> rebuild this machine.  What I want to do is to get some information off
> the hard drive.  If I remember it only had one VG VolGroup00.  So can I
> attach this to another machine and read it?  Won't the VolGroup00
> conflict with the hosts VolGroup00?  How can I change it to be some
> other name?

See this thread:

http://archives.free.net.ph/message/20071122.151843.1d3b9863.en.html

The steps are for cloning & renaming an existing VG but they should work
fine to rename any VG that has a name conflict with something else on
the system.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIKqrW6YSQoMYUY94RAvy9AJ9R+xj1Z0AAIG8fc3fLCR+RJLW9gQCeMwS7
AfGu0n9mO+g03n820THisKY=
=9nBT
-----END PGP SIGNATURE-----
