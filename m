Received: from thunderbird6.fab.redhat.com (vpn-6-57.fab.redhat.com
	[10.33.6.57])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mBGCcDCE017954
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 07:38:13 -0500
Message-ID: <4947A098.5020703@redhat.com>
Date: Tue, 16 Dec 2008 12:35:36 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can I freeze I/O for some time to a given disk /
	md /	dm device?
References: <49479897.1080500@wpkg.org>
In-Reply-To: <49479897.1080500@wpkg.org>
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
> Is it possible to "freeze I/O" for some time to a given disk / md / dm
> device?
> 
> Say, "freeze I/O" so that userspace waits for any response for 30, 60
> seconds or more?

You can suspend/resume dm devices via the dmsetup command.

> If not, is it possible to reset a link repeatedly, like ATA does when it
> hits certain disk problems? I.e., can I do the below manually?
> 
> ata4.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x2 frozen
> ata4.00: cmd 25/00:08:b8:c2:78/00:00:21:00:00/e0 tag 0 dma 4096 in
>          res 40/00:00:bb:c2:78/40:00:21:00:00/e0 Emask 0x4 (timeout)
> ata4.00: status: { DRDY }
> ata4: hard resetting link

This (or something close to it) should be possible using the SCSI fault
injection framework, a project that uses systemtap for injecting faults
under controlled conditions:

http://sourceforge.net/projects/scsifaultinjtst/
http://lwn.net/Articles/265187/
http://lwn.net/Articles/289932/

Regards,
Bryn.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAklHoJgACgkQ6YSQoMYUY94xEwCeOJ/epr+4QipelzzeH22M52az
53MAoLOZTNPlwq6t1PyLgNA/Ous64++z
=apWm
-----END PGP SIGNATURE-----
