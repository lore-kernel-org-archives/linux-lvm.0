Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <004a01c1d56b$cae7cb50$3b00a8c0@aplabwp0368359>
    <200203291222.EAA25283@deliverator.sgi.com>
    <20020402085912.G52863@wobbly.melbourne.sgi.com>
In-Reply-To: <20020402085912.G52863@wobbly.melbourne.sgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16sB9L-0002P2-00@hermes.sistina.com>
Subject: [linux-lvm] Re: DQUOT_SYNC undefined in XFS CVS kernel (was: Can't build CVS
 kernels of 20020321 & 20020327)
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
Date: Mon Apr  1 17:24:01 2002
List-Id: <linux-lvm.redhat.com>
To: Nathan Scott <nathans@sgi.com>
Cc: Jan Kara <jack@ucw.cz>, Bas <weblists@gmx.net>, linux-xfs@oss.sgi.com, linux-lvm@sistina.com

On Tue, 2 Apr 2002 08:59, Nathan Scott wrote:
> On Fri, Mar 29, 2002 at 10:26:41PM +1000, Adrian Head wrote:
> > I have also run into the XFS CVS kernel compile failing because of an
> > undefined DQUOT_SYNC.
> >
> > Using the information given by Nathan I have tracked down the offending
> > patch that causes the problems.  In my case it was the LVM VFS-lock patch
> > from the Sistina LVM project.  What they seem to do is use DQUOT_SYNC to
> > force the writing of cached Quota infomation before they lock the VFS
> > during snapshot creation.  It would also seem that EVMS does the same
> > thing.
>
> Aha, thanks for tracking this down Adrian.
No worries - thanks for the original info that got me started in the correct 
direction.

>
> > I expect that the XFS CVS kernel tree is actually ahead of the standard
> > 2.4.18 kernel tree in this respect so we'll have to wait until 2.4.19 is
> > released with the updated API's before other projects update their kernel
> > patches.
>
> Yes, the XFS trees contain all of the quota patches from:
> ftp://atrey.karlin.mff.cuni.cz/pub/local/jack/quota/v2.4/
>
> I wouldn't expect these patches to be in 2.4.19 -- they are
> not in 2.5 yet and I think Jan is concentrating on that step
> first.
Fine - as I would expect.

>
> > Grep'ing through the kernel I have not been able to find any comments or
> > explanations regarding this - so I have assumed that DQUOT_SYNC can be
> > changed to DQUOT_SYNC_DEV without problems.
>
> Yes, by my understanding of the VFS quota subsystem that would
> be the correct thing to do.
Thanks - my concern at the time was whether DQUOT_SYNC_SB should be included 
as well.  I had difficulty tracing it through so I took the easier way and 
assumed that it wasn't needed.  ;-)

>
> > After making that change the kernel compiles cleanly and boots.  I'm
> > unsure as yet if I have done the correct thing here.  Hopefuly someone
> > will be able to help us out and correct me if I'm incorrect.
>
> I believe your change is correct, I've CC'd Jan in case there is
> anything that I've overlooked.
Thanks Nathan & Jan - if I don't get any feedback I will assume that 
everything is OK and I will post patches to the LVM list latter today 
explaining & fixing the issue with their VFS-lock patch.

>
> cheers.

-- 
Adrian Head

(Public Key available on request.)
