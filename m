Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
References: <E16LcO0-0006VI-00@hermes.sistina.com>
    <200201030315.UAA21279@cthulhu.turbolabs.com>
    <20020103100030.V12868@lynx.no>
In-Reply-To: <20020103100030.V12868@lynx.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16MP72-0002co-00@hermes.sistina.com>
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
Date: Fri Jan  4 01:51:02 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 4 Jan 2002 03:00, Andreas Dilger wrote:
> Maybe yes.  This is very strange.  Are you testing all of these filesystems
> on the same LV in order?  Can you try just doing XFS by itself on a clean
> reboot?  I assume that you are rebooting after every oops, because if you
> don't there is junk in the kernel memory that will screw up further tests.

Each test is done on its own LV and there is always a reboot and recovery 
before every test after an Oops. More information about the vg's and lv's as 
well as the test procedure can be found halfway down:
http://marc.theaimsgroup.com/?l=linux-xfs&m=101010337524477&w=2

>
> > * Can create xfs snapshot?			| Oops
> >  btp 1234 (lvcreate)
> >  journal_start
> >  ext3_dirty_inode
>
>    ^^^^^^^^^^^^^^^^ yes, very strange.
>
> >  __mark_inode_dirty
> >  update_atime
> >  do_generic_file_read
> >  generic_file_read
> >  sys_read
> >  system_call

I have been thinking - the VFS-lock patch tries to get all (not sure - at 
least ext3 & resierfs) to flush everything to disk.  Maybe its actually an 
interaction problem between ext3 and LVM? but why XFS?  I'm only guessing 
here at the moment.

>
> Note that it appears most of the ext3 fixes went into 2.4.17, so this may
> be a new bug.  As I said, let's try first with XFS snapshots only, and if
> that doesn't have a problem, try to re-create the above problem and send
> a full oops report to ext2-devel.

This is what I'm having trouble with at the moment.  When the kernel Oops 
occurs it drops me into kdb (kernel debugger).  From here I can look at 
current process status, do back traces on anything thats running etc.. but it 
never shows me the full Kernel Oops and there is no record of it in the logs 
either.  I expect that a couple of backtraces, list of processes, register 
values would be equivalent to a Kernel Oops report?


- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8NV9k8ZJI8OvSkAcRArjiAJ9aID1RCLX1ePuHYEYtsrYuxfAMOQCeKepa
iobc03+nCMZhPdUQ0Yg6E/U=
=RAuQ
-----END PGP SIGNATURE-----
