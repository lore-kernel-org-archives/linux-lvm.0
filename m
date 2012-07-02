Date: Mon, 2 Jul 2012 09:41:04 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120702134104.GC785@redhat.com>
References: <4FEEE5E5.5060800@redhat.com>
	<alpine.LSU.2.00.1206301217590.1728@eggly.anvils>
	<4FEF66C4.20001@redhat.com>
	<alpine.LSU.2.00.1206301541280.1919@eggly.anvils>
	<4FF04950.30503@redhat.com>
	<alpine.LSU.2.00.1207011112250.1799@eggly.anvils>
	<4FF0AEA9.3090900@redhat.com> <4FF0C91B.8050700@redhat.com>
	<alpine.LFD.2.00.1207021041230.24050@dhcp-1-248.brq.redhat.com>
	<alpine.LFD.2.00.1207021216430.24050@dhcp-1-248.brq.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.2.00.1207021216430.24050@dhcp-1-248.brq.redhat.com>
Subject: Re: [linux-lvm] Regression with FALLOC_FL_PUNCH_HOLE in 3.5-rc
	kernel
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?THVrw6HFoQ==?= Czerner <lczerner@redhat.com>
Cc: amwang@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Joe Thornber <ejt@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, Alasdair G Kergon <agk@redhat.com>

On Mon, Jul 02 2012 at  6:35am -0400,
Lukáš Czerner <lczerner@redhat.com> wrote:
> > 
> > So you're testing rather old kernel so you might be missing some
> > fixes there. Could you rerun the test with the recent kernel ?
> >
> > Also it appears that the bug here happens because dm requested a
> > destination page which is within the kernel space. It seems that
> > this has been initiated by the write request from the mirror target.
> > So I do not immediately see how punch hole (discard) is involved at
> > all. You might have been lucky enough to hit a different bug
> > probably ?
> > 
> > Looking at git log, this commit has been brought to my attention:
> > 
> > 0c535e0d6f463365c29623350dbd91642363c39b dm io: fix discard support
> > 
> > seems related to this crash.
> > 
> > Please retest with recent kernel.

Ah, you beat me to recommending that fix ;)
 
> So from the original backtrace for the problem Zdenek is seeing on 3.5.0-rc4
> (https://lkml.org/lkml/2012/6/30/98) I think that this is
> problem in the device mapper itself. I do not think it has anything
> to do with tmpfs or mm. According to bisects from Zdenek it clearly
> shows that the problem appear when the discard support for the loop
> device is added, so it is most likely related to the dm discard support.

What about using scsi_debug with the dm-mirror target?

Never say never, DM-mirror and/or dm-io code could still have an issue,
but the commit referenced above did fix discard with the mirror target
back in 3.3.
 
> Anyway, the backtrace points to the NULL pointed dereference in
> dm_rh_region_context() which is simple function:
> 
> void *dm_rh_region_context(struct dm_region *reg)
> {
>        return reg->rh->context;
> }
> 
> so either reg, or reg-rh is NULL. Now the only place this is used is
> from recovery_complete() in dm-raid1.c. So this is somewhat related
> to raid recovery. I am not familiar with the dm code, but can
> someone from the dm team look at this ?

I'll coordiinate with Zdenek.

> But just to be sure to rule out the punch hole thing Zdenek can you
> run your tests on the "real" discard capable device ? Or at least on
> the device which does not convert discard requests into punch hole ?
> You can use scsi_debug to create such device:
> 
> modprobe scsi_debug dev_size_mb=16 sector_size=512 num_tgts=1 lbpu=1

Great minds think alike ;)
