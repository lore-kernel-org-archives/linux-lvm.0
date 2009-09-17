Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8H9vfi4012807
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 05:57:41 -0400
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <1253127828.3243.1.camel@delo.gdit>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com> <1253127828.3243.1.camel@delo.gdit>
Date: Thu, 17 Sep 2009 11:05:56 +0100
Message-Id: <1253181956.30299.25.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2009-09-16 at 21:03 +0200, Ambrogio De Lorenzo wrote:
> Il giorno mer, 16/09/2009 alle 11.19 -0700, malahal@us.ibm.com ha
> scritto:
> > Ambrogio De Lorenzo [ambrogio.de.lorenzo@alice.it] wrote:
> > > Hi all.
> > > I'm doing a big upgrade on my computer and I tryed to use lv mirroring
> > > to obtain a copy of my data before to do it.
> > > 
> > > As I do with LVM on other OS i thought that after mirroring one could
> > > chose to split the mirrored lv.
> > > 
> > > I can't find how to do it with LVM2 on Linux.
> > 
> > snapshot may be a good fit in this case, but if you insist you can use
> > lvconvert to convert your linear volume to a mirrored volume. Once the
> > sync is complete, you can use the same lvconvert to convert the mirror
> > volume to a linear one.
> But with this I loose the secondary copy.
> It's not a good idea.
> Backup and destroy backup :-)

Well, the data is still there following the split but you are correct
that there is not currently a direct way to "split" the mirrored LV into
a pair of independent LVs.

Using a snapshot will not actually duplicate the data for you which
seems to be what you want to do.

If you don't want to muck about making manual changes you might be
better off creating a new LV and mirroring the data with dd or some
other block-level tool.

Regards,
Bryn.
