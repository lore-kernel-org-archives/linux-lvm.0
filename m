Message-ID: <4FC39524.6010800@redhat.com>
Date: Mon, 28 May 2012 16:09:24 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <alpine.DEB.2.02.1205281619370.2644@shack.dolda2000.com>
In-Reply-To: <alpine.DEB.2.02.1205281619370.2644@shack.dolda2000.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Isolation of volume groups
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

On 05/28/2012 03:33 PM, Fredrik Tolf wrote:
> Last night, one of the PVs in datvol had a transient SATA link
> failure and popped in and out of existence for a little while,
> which caused datvol and the LVs on it to fail. No permanent damage
> seems to have occurred, though, so I'm not too worried about that.
> I could bring datvol down and up again to make it work, so I guess
> everything worked as should be expected.

Are the devices for ravol and datvol on the same SATA bus or controller?

> What concerns me a little, however, is that ravol also seems to
> have been oddly affected by the failure of datvol. At times, the
> filesystems on it could hang for seconds, not responding; and while
> it was responding, XFS was intermittently outputting messages like
> 
> May 28 14:58:58 nerv kernel: [30350.996032] 
> xfs_force_shutdown(dm-33,0x1) called from line 335 of file 
> /build/buildd-linux-2.6_2.6.32-38-amd64-bk66e4/linux-2.6-2.6.32/debian/build/source_amd64_none/fs/xfs/xfs_rw.c.
>  Return address = 0xffffffffa01df02c

> May 28 14:51:38 nerv kernel: [29911.468028] Filesystem "dm-33": 
> xfs_log_force: error 5 returned.

Errno 5 is EIO:

/usr/include/asm-generic/errno-base.h:#define	EIO		 5	/* I/O error */

So something below XFS returned EIO. This could happen due to IO
timeouts caused by link reset and error recovery on the other SATA device.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/DlSQACgkQ6YSQoMYUY95M4wCfVZ0s8rs9NRbFDa1ykaOkdMHb
MOAAmwem/NStQc2i6hlIj2Uzpkz1onU5
=oR3I
-----END PGP SIGNATURE-----
