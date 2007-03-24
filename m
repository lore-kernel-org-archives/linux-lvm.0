Received: from [10.33.1.214] (dhcp-1-214.fab.redhat.com [10.33.1.214])
	by pobox.fab.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l2OCEuhQ015088
	for <linux-lvm@redhat.com>; Sat, 24 Mar 2007 12:14:56 GMT
Message-ID: <460516BF.1080303@redhat.com>
Date: Sat, 24 Mar 2007 12:17:03 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] extracting EXT3 from VG
References: <8466e51e0703231002l7af8b064mcfeac23e2d1b6535@mail.gmail.com>
In-Reply-To: <8466e51e0703231002l7af8b064mcfeac23e2d1b6535@mail.gmail.com>
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

termeau sebastien wrote:
> Hello,
> 
> I have an hard drive image in a file.
> If I try to mount it directly using "mount -o loop my_file.img
> /mnt/my_dd", fdisk reports
>   mount: unknown filesystem type 'LVM2_member'
> This image contains a volume group that itself contains 4 logical vol
> group.
> lvscan reports:
>   LogVol00  2.94GB
>   LogVol03  64MB
>   LogVol02  256MB
>   LogVol01  2.31GB

Put the image file on a loop device, then activate the volume group it
contains:

losetup /dev/loop0 my_file.img
vgscan
vgchange -ay <vg name>

Then you should be able to access it as normal. Just dd the file system
off the LV device node.

To shut it down:

vgchange -an <vg name>
losetup -d /dev/loop0

Obviously, change loop0 to something else if 0 is already in use.

Kind regards,

Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGBRa/6YSQoMYUY94RAlyzAKCzFAYh3TXtpL0JuQ5RxANO1LahewCeKbz4
/E2z2S6BVx7QyUKJkuV4uek=
=kMMP
-----END PGP SIGNATURE-----
