Message-ID: <4D8151EF.5020301@cfl.rr.com>
Date: Wed, 16 Mar 2011 20:12:31 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
	<4D812183.6000901@cfl.rr.com> <20110316225539.GA3662@redhat.com>
In-Reply-To: <20110316225539.GA3662@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: Ron Johnson <ron.l.johnson@cox.net>, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/16/2011 06:55 PM, Mike Snitzer wrote:
> I'm not following what you're saying.  The kernel's blk_stack_limits()
> infrastructure accounts for "desktop" class 4K devices too (4K physical,
> 512b logical) -- as does DM and lvm2.

The kernel has the ability to read it from the drive and report it to
the user space tools, which have been patched to use it, but the WD EARS
drives lie and claim 512/512 instead of 512/4096.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2BUewACgkQJ4UciIs+XuJ9ZwCeKxZGCQ7X3lJjgWrfuK/UVsaX
AO8An1nAO9p9wBvy6CxEgGHIXo2vemUc
=YQ0W
-----END PGP SIGNATURE-----
