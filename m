From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] Drive gone bad, now what?
In-Reply-To: <3F9DB7D8.5080502@xs4all.nl>
Message-ID: <Pine.LNX.4.55.0310280943350.14569@mhw.ULib.IUPUI.Edu>
References: <20031021171817.GA28462@mail.parplies.de> <3F985B2D.5060008@xs4all.nl>
 <16280.27367.874758.610758@gargle.gargle.HOWL> <3F98B691.7090902@webhackande.se>
 <3F9989C9.1070909@xs4all.nl> <16285.12868.20878.180441@gargle.gargle.HOWL>
 <3F9DB7D8.5080502@xs4all.nl>
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
Date: Tue Oct 28 08:57:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 28 Oct 2003, Gert van der Knokke wrote:
> John Stoffel wrote:
> >Gert> I didn't expect lvm to restore the missing data, I guessed it
> >Gert> would just let me access the rest of the data.
> >
> >At this point, you have to think, how can my filesystem cope with the
> >loss of a 60gb chunk of data in the middle (start or end even) of the
> >300+ gb of data?  There's all sorts of meta-data and true data which
> >is now gone, and re-building the filesystem into a consistent state is
> >really impossible.
> >
> Hmm, and so I think LVM still needs a warning label :-)

Maybe, in the same way that McDonald's now feels compelled to remind its
customers that hot coffee is hot.  I don't recall anything in the
description of LVM which suggests that it provides redundancy or other
data-protection mechanisms.  RAID, regular backups, and retention of
distribution media are still required if you value your data.

> I wonder why LVM doesn't work the other way around:
> Create filesystems on several disks and then concatenate these to the
> outside as one large filesystem. This way if one drive goes bad you can
> always individually mount the drives and use the data.

man mount

> >If you are looking for a large/cheap/reliable bunch of storage,
> >instead of mirroring, you might want to think about RAID5 instead.
> >
> No, what we're looking for is an 'expandable as needed' filesystem and
> this is what LVM pretends to be.

That's what it *is*.  You can slice and dice your physical storage and
recombine as needed.  Do that to redundant physical storage and you have a
highly reliable expandable storage stack.  Do it to a simple concatenation
of cheap disks and you have a cheap failure-prone expandable storage
stack.  Expandability and reliability are orthogonal, and you use separate
tools to provide them.

- -- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: pgpenvelope 2.10.2 - http://pgpenvelope.sourceforge.net/

iD8DBQE/noNls/NR4JuTKG8RAjZZAJ9/bdnzRL07utWgLrw0FKR3Jw2hFQCaAwMr
+J7f6p3l6Arpds78jK2TKgE=
=QaKC
-----END PGP SIGNATURE-----
