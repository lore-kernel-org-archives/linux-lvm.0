Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <6u4rm4r53e.fsf@zork.zork.net>
    <200201031638.g03GcJg20734@oss.sgi.com>
    <1010072497.12080.42.camel@jen.americas.sgi.com>
In-Reply-To: <1010072497.12080.42.camel@jen.americas.sgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16MHyQ-00052r-00@hermes.sistina.com>
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
Date: Thu Jan  3 18:13:02 2002
List-Id: <linux-lvm.redhat.com>
To: Steve Lord <lord@sgi.com>, Andreas Dilger <adilger@turbolabs.com>
Cc: Linux XFS <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 4 Jan 2002 01:41, Steve Lord wrote:
> > There are however, may subtle (unhappy) interactions between XFS, LVM and
> > other kernel areas when you try to do snapshots for example.
>
> Yes, I have seen the thread, I have just not had the time to look into
> it yet. Your last message said that the xfs snapshot creation was
> failing, but with an ext3 stack trace.....
>
> You also mention out of space problems in the snapshot.
>
> Can you summarize where your kernel came from - I see you have lots of
> stuff in there. Do you still need special lvm patches to turn on
> snapshotting support - it has been a while.
>
> Also, send me a quick rundown of the commands you need to use to setup
> a volume for snapshotting - it will save me the research.

Thats fine Steve, all I was doing at the time was just saying that running 
XFS on a straight LVM seems to be very happy as far as I can tell.  However, 
since you have asked the questions I will answer now before I forget about 
it.  ;-)

The problem I have encountered is just as strange (ext3 stack trace) as the 
file corruption during compile problem that you are dealing with now.

What I was going to do was fall back to ext2 and remove ext3 from the kernel 
and rerun the tests.  Hopefully by doing this it will shed more light onto 
the problem.

Not sure what you mean by have lots of stuff in the kernel but to summarise 
where it came from.
The recent kernel - the one I did the last series of tests with was from the 
SGI CVS and was:
2.4.17-xfs      20011226
Previous kernels also from SGI CVS that I have tried were:
2.4.16-xfs      20011218
2.4.16-xfs      20011223

The system is a minimal install of RH7.2 and all compiles have used the 
default compile flags using the default RH7.2 compiler.
gcc version 2.96 20000731 (Re Hat Linux 7.1 2.96-89)

A more indepth of the make-up of my system can be found here:  from the 
thread "XFS dying when many processes copy many files/directories" 
http://marc.theaimsgroup.com/?l=linux-xfs&m=100942550316126&w=2

The only other things added to the kernel are the LVM patches of which there 
are two that the LVM people recommend.
* The LVM-1.0.1 upgrade patch and
* The VFS-lock patch
(in that order)

- From my understanding the LVM-1.0.1 patch is recommended as it has many 
bugfixes from the LVM-1.0.1rc4(ish) that is currently in the linus & SGI 
2.4.17 kernel.  Unfortunately I don't have handy a URL to the changlog - 
sorry.

The VFS-lock patch from my understanding is required for creating snapshots 
on journaling filesystems like ext3, resierfs and maybe XFS.  (AFAIK XFS is a 
special case as you can also use xfs_freeze).  The VFS-lock patch locks the 
VFS layer and forces all filesystems to sync to disk dumping all dirty 
buffers/pages etc...  If this doesn't happen; although you can create a 
snapshot you will never be able to mount it as the journals of at least ext3 
& resierfs will need to be replayed - which cannot happen as the snapshot is 
read-only.  Maybe some of the LVM developers may be able to give you more 
information than that.

There are 3rd party patches to make the snapshot writable but I don't see the 
advantage for my situation as yet and I'm having enough trouble getting the 
basics running.  Therefore, I have not applied these patches.  ;-)

Now with regards to the out of space problems I have been referring to:
What I was wanting was to not only use LVM snapshots for backups but to also 
hold a known disk state for a while ie. 24hrs.  This has the advantage that I 
as a sysadmin can snapshot a volume before I start volume maintance and have 
a backout strategy if I accidently do something I should not have.  And I was 
wanting to have the same concept for staff - if they accidently delete a file 
off the server they can go to the mounted snapshot and get it back without 
running to me for the backup.  Under normal office operations I can guess how 
much space the snapshot needs; however, there will always be a time/situation 
where someone will dump data way in excess of what the snapshot size can 
handle.  Under this situation the snapshot should just be taken offline 
automatically without killing the system.  This is what I was reffering to 
with overflowing the snapshot.  It was the Oops generated when an XFS 
snapshot overflowed during one of my many pre-production tests that started 
me on this quest ;-)

This was how the HDD was divided up on my test system:
=======================================================================
- - - hda1 -               /boot                      20M ext3
- - - hda2 -               /                         512M ext3
- - - hda3 -               /usr                      512M ext3
- - - hda4 -               {extended}
- - - hda5 -               /var                      512M ext3
- - - hda6 -               swap                      768M
- - - hda7 -      {LVM volume group HDA}  36941M - Remaining Space (36G)
 - /dev/HDA/TMP /tmp               128M reiserfs
 - /dev/HDA/CACHE       /cache             512M reiserfs
 - /dev/HDA/CHROOT      /chroot            512M ext3
 - /dev/HDA/SRC /usr/src                  4096M reiserfs
 - /dev/HDA/SRC_SNAP     /usr/src/snapshot/admin  1024M
                                                (30G Unallocated)
=======================================================================

The test procedure was:
1)	Unpack a clean SGI CVS kernel and patch LVM as required.
2)	Compile, install and reboot.
3)	For a mounted ext3 logical volume
	a)	create a snapshot
		lvcreate -L50M -s -n SNAP /dev/HDA/CHROOT
	b)	mount the snapshot
		mount /dev/HDA/SNAP /mnt/snapshot
	c)	copy more than the snapshot size onto the original logical volume to see 
what happens.
		cp -fr /usr/src/<dir1> /chroot
4)	Repeat for resierfs
5)	Repeat for XFS
Note: becareful when mounting an XFS snaphot without using "mount -t xfs" 
otherwise i have found it will mount the snapshot as resierfs.
See http://marc.theaimsgroup.com/?l=linux-xfs&m=100994490716530&w=2 for more 
info on this.

If there was a Kernel Oops there would be a reboot and recovery inbetween 3, 
4 &/or 5.

The exact results from the tests can be found here:
http://marc.theaimsgroup.com/?l=linux-xfs&m=100994356415003&w=2

A quick summary of commands:

To initialise a partition for LVM usage:
pvcreate /dev/hda7

To create a volume group (the container for the logical volumes)
vgcreate -s32M HDA /dev/hda7
Note: -s32M is optional; default is 4M.

To create a logical volume (the volume that will contain the filesystem)
lvcreate -L4G -n CHROOT /dev/HDA

Then put the filesystem on top:
eg:
mkfs -t ext2 -j /dev/HDA/CHROOT
or 
mkfs -t xfs /dev/HDA/TEST
or
mkfs -t resierfs /dev/HDA/SRC

Then mount logical volume:
eg:
mount /dev/HDA/SRC /usr/src

A good quick tutorial on LVM can be found here:
http://www.sistina.com/lvm_howtos/lvm_howto/
and the basic lvm commands here:
http://www.sistina.com/lvm_howtos/lvm_howto/Common_tasks.html

I hope this has answered your questions.  My next move is to remove ext3 from 
the kernel and rerun the tests to see what happens.

If I have left out anything please contact me.

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8NPQs8ZJI8OvSkAcRApMRAJ9qkytpP8RXUHuD2dgFp9CV/sQSJACfeo6F
SM6pTcPryGjyHAMn3QIdQ2o=
=f+ak
-----END PGP SIGNATURE-----
