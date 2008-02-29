Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m1TJFDgo014136
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:15:13 -0500
Message-ID: <47C8589A.7000309@redhat.com>
Date: Fri, 29 Feb 2008 19:10:18 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
References: <200802291732.m1THWfD7013248@outgoing.mit.edu>	<20080229183148.GI1788@agk.fab.redhat.com>
	<1204312265.5850.7.camel@error-messages.mit.edu>
In-Reply-To: <1204312265.5850.7.camel@error-messages.mit.edu>
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

Greg Hudson wrote:
> Nope, that never made it go away.  I'm not sure in what situations
> flushing write buffers would have any effect.  If I had a way to throw
> away the read-only page cache and force a file reload from disk, I would
> expect that to eliminate the visible effect of the corruption; at the
> moment the only reliable way I know how to do that is to reboot.  (I
> could churn the page cache into oblivion with a bazillion reads of
> different files, but I'd have no way of knowing when I had succeeded in
> reusing the corrupted cache page.)

You should be able to achieve that via the /proc/sys/vm/drop_caches sysctl:

Documentation/filesystems/proc.txt:

drop_caches
- -----------

Writing to this will cause the kernel to drop clean caches, dentries and
inodes from memory, causing that memory to become free.

To free pagecache:
        echo 1 > /proc/sys/vm/drop_caches
To free dentries and inodes:
        echo 2 > /proc/sys/vm/drop_caches
To free pagecache, dentries and inodes:
        echo 3 > /proc/sys/vm/drop_caches


I guess a 1 would be a good first try & if that doesn't clear it, a 3
should force the entire inode to be re-read from disk.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHyFia6YSQoMYUY94RArInAJ9dRVLCGYXcllL4RDz4pei4qGnUVQCg4LL1
d22/7jgF5zxsGnFPeCfpkwA=
=v99d
-----END PGP SIGNATURE-----
