Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
References: <E16LcO0-0006VI-00@hermes.sistina.com>
    <20020102110538.K12868@lynx.no>
In-Reply-To: <20020102110538.K12868@lynx.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16LzK3-0003Ng-00@hermes.sistina.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jan  2 22:18:02 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolabs.com>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 3 Jan 2002 04:05, Andreas Dilger wrote:
>
> You should try ext3 from 2.4.18, or get it from the ext3 CVS (at
> cvs.gkernel.sourceforge.net:/cvsroot/gkernel ext3).  It has fixes
> for a number of problems caused by error conditions while running.
> If there is still a problem with ext3 oopsing with a full snapshot
> (which is essentially an oops because of an I/O error on the disk)
> then please file a separate bug report to the ext3 developers
> (ext2-devel@lists.sourceforge.net).
>
> Cheers, Andreas

I have been looking at the changlog for 2.4.18-pre1 which seems to be the 
latest at the moment and I cannot see any changes relating to ext3?
http://www.kernel.org/pub/linux/kernel/v2.4/testing/patch-2.4.18.log
The 2.4.17 has a few changes relating to ext3:
http://www.kernel.org/pub/linux/kernel/v2.4/testing/patch-2.4.17.log

Do you think it is worth my while to update ext3 from the ext3 CVS?

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8M9wV8ZJI8OvSkAcRAibbAJ9K8ldAR5jGoamKu542vg6UVh4MswCeKDSw
NryXQBft4SdUc5PQ9Kroqcw=
=qO7n
-----END PGP SIGNATURE-----
