Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m59DpXoK032340
	for <linux-lvm@redhat.com>; Mon, 9 Jun 2008 09:51:34 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m59DpX4L013690
	for <linux-lvm@redhat.com>; Mon, 9 Jun 2008 09:51:33 -0400
Message-ID: <484D3565.9030202@redhat.com>
Date: Mon, 09 Jun 2008 14:51:33 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Re: Re: Loopback mount a disk image with lvm
References: <2122f0920806090646h46bb29cds76fb957a2b8e0cbe@mail.gmail.com>
In-Reply-To: <2122f0920806090646h46bb29cds76fb957a2b8e0cbe@mail.gmail.com>
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

Girish V wrote:
> Incidentally, how do I free the loop (/dev/loop0) associated with
> disk.img. I tried "sudo losetup -d /dev/loop0", but I get the error
> message "ioctl: LOOP_CLR_FD: Device or resource busy".
> 
> I tried looking at mount, ps, top etc - but the disk.img associated
> with loop0, was not being used.

Unmount all the file systems, deactivate the VG with "vgchange -an
<vgname>" (if you mounted/activated them) and finally delete the kpartx
mappings with "kpartx -d /dev/loop0". That should release all references
on the loop devices allowing you to unbind it with losetup.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFITTVl6YSQoMYUY94RAnbGAJsGVXX5HCAHKqyLV32+9tupQpKp8QCfct2K
HKQvSKwxWw7k1esges0oyww=
=J2Oe
-----END PGP SIGNATURE-----
