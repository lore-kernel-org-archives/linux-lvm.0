Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] [BUG] segmentation fault on snapshot with beta8
Date: Fri, 27 Jul 2001 12:27:47 -0400
References: <20010726122738.E052917573@oscar.casa.dyndns.org> <20010727102132.A4314@sistina.com>
In-Reply-To: <20010727102132.A4314@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010727162747.9542515354@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, AJ Lewis <lewis@sistina.com>

On July 27, 2001 11:21 am, AJ Lewis wrote:
> On Thu, Jul 26, 2001 at 08:27:38AM -0400, Ed Tomlinson wrote:
> > tob is a wrapper script for afio that can installed from a debian
> > package.  The snapshotted fs is reiserfs.  I have the vfs locking
> > patch installed along with:
> >
> > --------
> > diff -Nru a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> > --- a/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
> > +++ b/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
> > @@ -80,7 +80,7 @@
> >      reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
> >      journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
> >      reiserfs_block_writes(&th) ;
> > -    journal_end(&th, s, 1) ;
> > +    journal_end_sync(&th, s, 1) ;
> >    }
> >    s->s_dirt = dirty;
> >    unlock_kernel() ;
> > --------
>
> Hmm...trying to reproduce this on 2.4.6...and after applying the lvm 0.9.1
> beta8 patch, the linux-2.4.4-VFS-lock patch and the above patch (in that
> order), I still get this when trying to create and mount a snapshot:
>
> reiserfs: checking transaction log (device 3a:00) ...
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device 3a:01) ...
> clm-2076: device is readonly, unable to replay log
> Replay Failure, unable to mount
> reiserfs_read_super: unable to initialize journal space
>
> Is there some other patch or magic I need to do to get ReiserFS snapshots
> working?  I thought the VFS-lock patch was supposed to fix that...

that should be it.  My fstab has:

/dev/lv/snap    /snap           reiserfs  defaults,ro,noauto    0       0 

I did not add any other patches for lvm/reiserfs other than what you have above.

My impression with the above bug is that the snapshot is filling much too quickly
and getting disabled.  At this point seg faults start happening.

Ed Tomlinson
