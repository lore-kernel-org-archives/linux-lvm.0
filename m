Return-Path: <jweber@valinux.com>
Date: Wed, 23 May 2001 05:21:35 -0700 (PDT)
From: Jay Weber <jweber@valinux.com>
Subject: Re: How about ext3? (was RE: [linux-lvm] XFS and LVM)
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJAEMPIOAA.steve.wray@the.net.nz>
Message-ID: <Pine.LNX.4.33.0105230512360.8571-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

Yes, it is shrinkable.  It performs the same as ext2 other than the fact
it has journaling for the most part. :)

Snapshotting is a bit different at present.  You can snapshot just fine if
you umount the filesystem first, since that leaves the filesystem in a
clean state.  If you want to do online snapshotting you'll have to add in
a hook to ext3 to use the LVM_VFS_ENHANCEMENT fsync_dev_lockfs() and
unlockfs() features.  The recent ext3 0.0.6b does support a journal
barrier feature so you can flush the journal and set the fs to a clean
state during the snapshot.  I've a dated patch here somewhere, I'll dig
around for it.  The problem the above resolves is that snapshotting an
active ext3 filesystem means there's a journal with bits of data hanging
about that needs to be addressed prior to the snapshot.  If it's not you
won't be able to mount the snapshot since they are read-only and the
journal would not be able to replay.

There is also online resizing available to some degree for ext2/ext3.
Andreas Dilger maintains that if I'm correct, I haven't messed with it
much myself yet. :)

On Wed, 23 May 2001, Steve Wray wrote:

> Date: Wed, 23 May 2001 20:35:36 +1200
> From: Steve Wray <steve.wray@the.net.nz>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: How about ext3? (was RE: [linux-lvm] XFS and LVM)
>
> Any experience with ext3?
> Is it shrinkable?
>
>
> > -----Original Message-----
> > From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]O=
n
> > Behalf Of Harald Milz
> > Sent: Wednesday, May 23, 2001 8:35 PM
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] XFS and LVM
> >
> >
> > In article <20010523010640.C2933@vestdata.no>, Ragnar Kj=F8rstad
> > <lvm@ragnark.vestdata.no> wrote:
> > >>
> > >> It wouldn't mount afterward... It was only on /usr/local
> > >> whuch was backed up.
> >
> > > Did you report it to reiserfs-list@namesys.com?
> >
> > That doesn't always help. I once had a ~1 meg file in the reiserfs root
> > filesystem which wouldn't delete but I laways got a nice oops. I report=
ed
> > it to Hans and got a reply that someone would look at it bit that never
> > actually happened (at least got no feedback).
> >
> > But that was just once. I still have everything on reiserfs on LVM on m=
y
> > machines, and just started to experiment with XFS. The fact that it is =
not
> > shrinkable is a bit annoying though. Like AIX JFS. ...
> >
> > --
> > Harald Milz           |     hm@linux-magazin.de     | If one studies to=
o
> > Linux Magazin         | phone  +49 (0) 89 993411-20 | zealously,
> > one easily
> > Stefan-George-Ring 24 | fax    +49 (0) 89 993411-99 | loses his pants. =
--
> > D-81929 Muenchen      | http://www.linux-magazin.de | A. Einstein.
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
