Return-Path: <thornber@btconnect.com>
Date: Mon, 30 Jul 2001 11:46:40 +0100
Subject: Re: [linux-lvm] rw-snapshot as an addition for lvm
Message-ID: <20010730114640.A739@btconnect.com>
References: <20010728182741.S13121@schlund.de> <20010730105726.E562@btconnect.com> <20010730112818.F760@jadzia.josv.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010730112818.F760@jadzia.josv.com>; from josv@osp.nl on Mon, Jul 30, 2001 at 11:28:18AM +0200
From: Joe Thornber <thornber@btconnect.com>
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
To: linux-lvm@sistina.com

On Mon, Jul 30, 2001 at 11:28:18AM +0200, Jos Visser wrote:
> The question I would have is whether rw-snapshots (or, snapshots in
> general), should be implemented in LVM or as a separate driver/layer. In
> that case, a snapshot could be taken of any block device, not only of a
> logical volume.

Yes, I've already raised this issue... and written a new standalone
driver, which will go into experimental soon :) There's a similar
argument that multi-pathing is standalone.

> 
> Another interesting feature that I might add that would be handy here is
> the "dynamic LV". This would be a LV that can extend dynamically if so
> requested. The advantage of this would be that you could use the dynamic
> LV as the buffer space of a snapshot. If the snapshot requires more
> space, the LV could extend dynamically to allow for this....

There are facilities for monitoring snapshot usage.  You could easily
write a script that extends the lv when it hits, say, 90 % full.

- Joe

> 
> ++Jos
> 
> And thus it came to pass that Joe Thornber wrote:
> (on Mon, Jul 30, 2001 at 10:57:26AM +0100 to be exact)
> 
> > On Sat, Jul 28, 2001 at 06:27:41PM +0200, Anders Henke wrote:
> > > I think it's also quite interesting to have a rw-snapshot in which changes
> > > of both real and snapshot are being written to a smaller bufferspace on disk:
> > > the snapshot always represents the state of the LV when taking the snapshot,
> > > but permits changes on 'its copy'.
> > 
> > See other thread in the last few days on rw snapshots;  Yes, it's an
> > execellent idea.
> > 
> > - Joe
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
> Im verzeihen des Unverzeihlichen ist der Mensch der gottlichen Liebe am ndchtsten.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
