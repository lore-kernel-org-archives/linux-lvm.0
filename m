Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3EAb8x3016449
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2008 06:37:08 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3EAb7YF028247
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2008 06:37:07 -0400
Message-ID: <48033077.4050500@redhat.com>
Date: Mon, 14 Apr 2008 11:22:47 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] removing mirror images
References: <200804121920.25946.benscott@nwlink.com>
In-Reply-To: <200804121920.25946.benscott@nwlink.com>
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

ben scott wrote:
>   bedroom:~/kvpm# lvconvert --mirrors -1 trurg/lvol0   /dev/hde2 /dev/hdg5
>     No free extents on physical volume "/dev/hde2"
>     No mirror images found using specified PVs.

This error looks like it might be bug 440405:

https://bugzilla.redhat.com/show_bug.cgi?id=440405

I've not tried to reproduce it with -m1 though - there's a trivial patch
in the bugzilla that you can try.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIAzB36YSQoMYUY94RAnjiAKCH4a1BvMLAsxFAllRRJynGeg9llQCgv2yP
vyovEnvOAQmyVnwrtuHRtDI=
=n/pg
-----END PGP SIGNATURE-----
