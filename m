Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <1010173926.1414.12.camel@stout.americas.sgi.com>
In-Reply-To: <1010173926.1414.12.camel@stout.americas.sgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16Md6L-0007pY-00@hermes.sistina.com>
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Fri Jan  4 16:47:02 2002
List-Id: <linux-lvm.redhat.com>
To: Eric Sandeen <sandeen@sgi.com>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sat, 5 Jan 2002 05:52, Eric Sandeen wrote:
> Ok, I have 2.4.17-xfs (cvs checkout today) with patches from lvm-1.0.1,
> applied lvm-1.0.1-2.4.17-xfs.patch then linux-2.4.11-VFS-lock.patch.
>
> I tried creating lvm volumes & snapshots w/ an xfs filesystem.
>
> I did run into problems (creating snapshot against my "test" volume
> while it was mounted caused an oops; creating snapshot volume then
> mounting test oopsed....) but eventually I got a volume mounted, and had
> a snapshot volume against it.
>
> Overflowing the snapshot behaved well:
>
> lvm -- giving up to snapshot /dev/test/foo on /dev/test/snap: out of
> space
>
> I'll check out the oopses to see if I can figure out what's going on.
>
> -Eric

Well this seems consistant with what I'm seeing:
2.4.17-xfs
While source volume mounted:
 + lvm-1.0.1 upgrade
 + VFS-lock
 (In that order)
* Can create ext3 snapshot?			| yes
* Can mount a ext3 snapshot?			| yes
* Can create resierfs snapshot?			| yes
* Can mount a resierfs snapshot?		| yes
* Can create xfs snapshot?			| Oops
 btp 1234 (lvcreate)
 journal_start
 ext3_dirty_inode
 __mark_inode_dirty
 update_atime
 do_generic_file_read
 generic_file_read
 sys_read
 system_call
Running processes (lvcreate)
* Can mount a xfs snapshot?			| Cannot test
When source & snapshot mounted:
* Cause oops when snapshot overflows?	|
 - ext3						| OK - Stable
 - resierfs					| OK - Stable
 - xfs						| Cannot test

What does your backtrace look like?  Its the ext3_dirt_inode in my backtrace 
thats got me.  I have compiled a kernel without ext3 so will also give it a 
run later.

I now have a serial cable and once I work out how to use kdb with it I'll be 
able to capture the full kdb output.. I was wanting to be in this position 
now; but ran into an issue with the Linux kernel which killed a lot of time.. 
 

OT: There is an option in the linux kernel config that allows extra debugging 
info to be compled into the kernel.  Don't use it as it stops all modules 
from being loaded.  It took me a couple of hours to realise what was 
happening :-(

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8NjF18ZJI8OvSkAcRAiFHAJ9oHz9ntOT+pNatBj3SxTMqw0je1gCfasWm
8zvETAseafRuSEpOaAFQkuE=
=+BBG
-----END PGP SIGNATURE-----
