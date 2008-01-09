Received: from thunderbird6.fab.redhat.com (sebastian-int.corp.redhat.com
	[172.16.52.221])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m09DjvtY009841
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 08:45:58 -0500
Message-ID: <4784CF70.3000307@redhat.com>
Date: Wed, 09 Jan 2008 13:43:12 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fdisk and lvs size differences
References: <4784CDCC.6000809@wpkg.org>
In-Reply-To: <4784CDCC.6000809@wpkg.org>
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

Tomasz Chmielewski wrote:
> Let's say I have a 500GB logical volume:
> 
> # lvs | grep san2_data
>   san2_data                  san1 -wi-a- 500.00G
> 
> 
> fdisk will report a bigger number:
> 
> # fdisk -l /dev/san1/san2_data
> 
> Disk /dev/san1/san2_data: 536.8 GB, 536870912000 bytes

It's just units; the G in lvm's output signifies powers-of-two units,
wheras the GB reported by fdisk is in powers-of-ten (SI units).

See the lvm man pages for a description of the units supported (lower
case are SI, upper case are powers-of-two).

Strictly speaking, the powers-of-two versions should use the SI binary
prefixes (MiB, GiB, etc.):

http://en.wikipedia.org/wiki/Binary_prefix

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHhM9w6YSQoMYUY94RAiINAKC87sqVnH6PpcQRKFuQNoMfOcpr7wCeM0gS
wsnqw+Y7qtZx/FDKNnbnSBI=
=tRAA
-----END PGP SIGNATURE-----
