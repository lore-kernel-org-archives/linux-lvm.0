Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
References: <E16LcO0-0006VI-00@hermes.sistina.com>
    <20020102110538.K12868@lynx.no>
In-Reply-To: <20020102110538.K12868@lynx.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16Lwsc-0000Oy-00@hermes.sistina.com>
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
Date: Wed Jan  2 19:42:02 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 3 Jan 2002 04:05, Andreas Dilger wrote:

> Note that you need to apply the VFS-lock patch AFTER the lvm-1.0.1 upgrade
> patch, otherwise that patch will reverse the VFS-lock patch!

OK - thanks I will try this and rerun my tests.

What I have found though is that the LVM_VFS_ENHANCEMENT in lvm.c gets 
removed with the lvm-1.0.1 upgrade patch.  Is this the way it is supose to 
be? Isn't LVM_VFS_ENHANCEMENT needed anymore?

> You should try ext3 from 2.4.18, or get it from the ext3 CVS (at
> cvs.gkernel.sourceforge.net:/cvsroot/gkernel ext3).  It has fixes
> for a number of problems caused by error conditions while running.
> If there is still a problem with ext3 oopsing with a full snapshot
> (which is essentially an oops because of an I/O error on the disk)
> then please file a separate bug report to the ext3 developers
> (ext2-devel@lists.sourceforge.net).
>
> Cheers, Andreas

Let me see if I understand this correctly:
The problem of the kernel Oops when a snapshot overflows is actually a 
filesystem maintainer's/developer's problem because.  The reason is that when 
a snapshot overflows it generates a disk full and it is up to the filesystem 
to deal with that and pass that error up the stack?

Therefore, if there was an Oops on an:
* ext3 snapshot I would have to tell the ext3 developer's/maintainer's
* resierfs snapshot I would have to tell the resierfs developer's/maintainer's
* xfs snapshot I would have to tell the xfs developer's/maintainer's

All I'm trying to do here is understand this a little more so that I can 
follow up with the correct people about these problems.

Thanks Andreas for your time.

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8M7d58ZJI8OvSkAcRAt9cAKCARFiVZgeQLbOLa5KDSzDKa/AbHACfQcJE
1exTKu5RksbNI+STCzB4JQ4=
=HFaI
-----END PGP SIGNATURE-----
