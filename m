From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Desater Recovery <urgent>
Message-Id: <20020425105940.A16030@sistina.com>
References: <002401c1ea10$873d91a0$6b01a8c0@PC07>
    <20020422170544.GB2967@fib011235813.fsnet.co.uk>
    <00a601c1ea21$1b869630$6b01a8c0@PC07>
    <20020422172214.GA3145@fib011235813.fsnet.co.uk>
    <20020422173145.GF3017@turbolinux.com>
    <002c01c1ea92$c33db310$3b00a8c0@aplabwp0368359>
MIME-Version: 1.0
In-Reply-To: <002c01c1ea92$c33db310$3b00a8c0@aplabwp0368359>;
    from weblists@gmx.net on Tue, Apr 23, 2002 at 08:47:40AM +0200
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
Date: Thu Apr 25 04:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

All,

I supported Ralf on the phone and we analyzed, that the ext2 filesystem was
already *very* messy before e2fsadm could be run.


Brief history was:

- fs run as ext3 (heavily) used for weeks

- try to shrink unmounted fs with e2fsadm (using resize2fs) made e2fsadm
  end early because manual fsck was required; this was the point in time
  where a readonly mount and a backup was needed (but didn't happen) in
  order to save as much data as possible

- manual "fsck -fy" was run exposing piles of messages :-( which
  convinces me, that the fs data was messy already afterwards

- e2fsadm was run "successfully" ending up with smaller fs and larger
  LV size which is most likely caused by a resize2fs exit code != 0.


As already mentioned in other mails of this thread: no backups :-(

"Remind people of taking backup, remind people of taking backup, remind..."

Regards,
Heinz    -- The LVM Guy --



On Tue, Apr 23, 2002 at 08:47:40AM +0200, Bas wrote:
> > On Apr 22, 2002  18:22 +0100, Joe Thornber wrote:
> > > On Mon, Apr 22, 2002 at 07:14:05PM +0200, Ralf Zerres wrote:
> > > > no, i guess not.
> > > > I was using e2fsadm which is serializing the steps. As far as I know
> ...
> > >
> > > Yes e2fsadm should have resized the filesystem itself, so that's not
> > > the problem.
> >
> > Unless e2fsadm doesn't work properly with "- 4,5G"...
> >
> > Out of curiosity, which resizer did e2fsadm use?  resize2fs or
> > ext2resize?  By default it would have picked resize2fs if it is
> > installed.
> >
> > I don't suppose you recall (or better, have saved) any of the output
> > >from e2fsadm, resize2fs, e2fsck, anything?
> >
> > Cheers, Andreas
> > --
> > Andreas Dilger
> 
> Is it possible to extend the lv to the original size and run fsck on it ?
> Make a tarball of the available data in advance !
> 
> Good luck,
> Bas.
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
