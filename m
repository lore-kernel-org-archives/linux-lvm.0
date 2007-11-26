Received: from thunderbird6.fab.redhat.com (sebastian-int.corp.redhat.com
	[172.16.52.221])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lAQ8UTd2030893
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2007 03:30:29 -0500
Message-ID: <474A83A4.30103@redhat.com>
Date: Mon, 26 Nov 2007 08:28:20 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Renaming Loopback 'Mounted' Volume Group
References: <47474790.9010009@stthomasepc.org>
In-Reply-To: <47474790.9010009@stthomasepc.org>
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

Tod wrote:
> Please take a look at this old thread first ...
> 
> http://linux.derkeiler.com/Mailing-Lists/Fedora/2007-02/msg02237.html
> 
> 
> This was back in February and I'm just now trying to get back into
> recovery mode.  I've mounted the image like so:
> 
> /sbin/losetup /dev/loop0 ./recover.img
> /sbin/kpartx -lv /dev/loop0
> /sbin/kpartx -av /dev/loop0
> 
> This gives me /dev/mapper/loop0p1, and /dev/mapper/loop0p2 which seem to
>  be my original boot drive and VolGroup00.  When I do an lvscan I get:
> 
> WARNING: Duplicate VG name VolGroup00: Existing
> Vmi02d-0hr7-7NVb-vYZi-1fbD-E9n5-ixWu0a (created here) takes precedence
> over D7avZX-pVCb-ibTN-tyvs-7Q62-rzR9-tquBi9

See the steps I posted last Friday, with some corrections/improvements
from Alasdair:

https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html
https://www.redhat.com/archives/linux-lvm/2007-November/msg00040.html

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHSoOk6YSQoMYUY94RAkp1AKCixiD85e6gtb+fju0M0VJbiyrFwACg0vLQ
dkdB8lPKZxzueFAutdkptP8=
=qyM4
-----END PGP SIGNATURE-----
