Message-ID: <394C01CA.7824B653@inet.net.nz>
Date: Sun, 18 Jun 2000 10:55:07 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM patch for linux-xfs-2.4
References: <20000617024951.A15926@ladystrange.bluehorizon.nl> <20000617110328.A6436@hmsysv.t-online.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> > Hi!
> >
> > I'm currenlty hacking the latest XFS tree from SGI which is based on
> > linux kernel 2.4test1 with LVM. Except for the XFS addition this
> > kernel has more customizations. One of them, stops the LVM tools from working.
> >

Hi!

I've just joined this mailing-list after signing the LVM petition, or should that
be partition? ;-)
I'm so glad to see work going on with volume management, its a missing piece
that most commercial UNIX's have over linux. Hey, but you all know this.

Can I ask some questions, these might be useful on the faq list...

I didn't know that SGI's XFS system uses linux-lvm, and not the SGI volume
management system. Are IBM doing the same?

Can any filesystem use LVM ? Does it need changes to make it work ?

I assume the filesystem has algorithms to store data as efficiently as possible
within its `physical' partition. How does LVM stay efficient with different
filesystems ?

Is it possible to convert an existing `low-level' physical partiton like ext2 into a
LVM PV (this would make the transition to lvm much easier) ?

If I start using LVM now will it be compatible with newer versions of LVM and
especially the one in kernel 2.4 ?

-- Dale Kemp (dale@sclnz.com)
