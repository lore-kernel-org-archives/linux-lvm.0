Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643510@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Reiserfs, 2.4.7, snapshots w/ 0.9
Date: Wed, 25 Jul 2001 15:02:15 -0500
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

So does that mean that the VFS patches are ONLY for snapshotting?

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent: Wednesday, July 25, 2001 2:45 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Reiserfs, 2.4.7, snapshots w/ 0.9
> 
> 
> 
> Mark,
> 
> Chris Mason implemented an interface between the VFS and LVM, 
> which is defined
> by 2 new functions VFS functions. They have to be supported 
> in the filesystem
> itself in order to flush the journal and lock the filesystem 
> for I/O, get
> back to LVM so that it can activate the prepared snapshot. 
> LVM unlocks the
> filesystem after this.
> You pay a (small) I/O penalty for the journal flush.
> 
> Because those functions are not in vanilla, you still need to 
> patch the
> kernel with the linux-2.4.X-VFS-lock-patch contained in the 
> LVM distribution :-(
> 
> That patch will enable the above feature after a kernel 
> recompile/reboot.
> 
> 
> On Wed, Jul 25, 2001 at 10:36:40AM -0500, Mark Bainter wrote:
> > I'm using LVM on a couple of our production systems, and I'm very 
> > happy with it.  It's been working very well for us.  However, we
> > have a very large database and backing it up has become problematic.
> > 
> > So, naturally, I began looking into using LVM's snapshot feature. 
> > The filesystem the database rests on is a reiserfs partition.  
> > Creating the snapshot volume (acc to the directions in the howto) 
> > works fine, but when I try to actually mount it I get:
> > 
> > $ sudo mount -t reiserfs -oro /dev/main/db_backup /mnt/dbbackup 
> > mount: wrong fs type, bad option, bad superblock on 
> /dev/main/db_backup,
> >        or too many mounted file systems
> > 
> > checking dmesg reveals:
> > reiserfs: checking transaction log (device 3a:04) ...
> > clm-2076: device is readonly, unable to replay log
> > Replay Failure, unable to mount
> > reiserfs_read_super: unable to initialize journal space
> > 
> > Ok, so I did some searching and found some people back in the first
> > part of this year had a similar problems but none of the solutions
> > really applied to me fwict.  They all appeared to be using a 
> > previous version of the kernel, or of the lvm code.  I 
> looked through
> > the changelog and did see a few notations of fixes since 0.9 related
> > to the snapshot code.  But, I'm kind of wary about putting a beta 
> > on my production systems with something this critical, w/out knowing
> > for sure that it will fix the problem.
> > 
> > So, is the problem in lvm?  reiserfs?  Or is it just me?  Is there
> > any other information I can give that might be helpfull in figuring
> > out the problem?  Just let me know. 
> > 
> > TIA
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina 
> Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
