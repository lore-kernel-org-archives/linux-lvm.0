Message-Id: <200203060053.QAA18661@hpgssl.cup.hp.com>
From: John DeFranco <defranco@cup.hp.com>
Subject: Re: [linux-lvm] Problems building on RedHat 7.2 with 2.4.9-21 kernel
References: <200203050236.SAA07460@hpgssl.cup.hp.com>
    <20020305080857.GB30667@colombina.comedia.it>
In-Reply-To: <20020305080857.GB30667@colombina.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Mar  5 18:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bluca@comedia.it
Cc: linux-lvm@sistina.com

Hi,

Thanks for the input. I made the changes as described below and was able to 
get lvm to build.

On Tuesday 05 March 2002 12:08 am, Luca Berra wrote:
> On Mon, Mar 04, 2002 at 06:32:13PM -0800, John DeFranco wrote:
> > Hi,
> >
> > I'm having some problems building lvm (1.0 or 1.0.3) on a redhat7.2
> > system with kernel 2.4.9-21. I'm getting the following errors:
> >
> > drivers/md/mddev.o: In function `lvm_snapshot_alloc':
> > drivers/md/mddev.o(.text+0xa881): undefined reference to `alloc_kiovec'
>
> <snip>
>
> > I've seen emails on this list saying that lvm only really works/qualified
> > on vanilla kernel sources and not distro specific. I guess this is a good
>
> well, in this case the problem seems related to 2.4.9-ac10 patch not
> specifically to red hat so we might be willing to help you.
> (just kidding, i am glad you are testing a better kernel than 2.4.2
> for MC/SG)
>
> > example as to why. However there has to be some easy solution to this I
> > would think/hope. At this point I need to use the redhat 2.4.9-21 kernel
> > and lvm 1.0 since the version that is in this kernel is 0.9_beta1. So I
> > don't have the option of going to 2.4.18 for example.
>
> i don't undestand this passage,
> anyway:
> looking at alan's patch yow will find the answer, besides from some fixes
> taken from lvm cvs he adds:
> 	int nbhs = KIO_MAX_SECTORS;
> to both lvm_snapshot_alloc() and lvm_snapshot_release()
> and changes
> 	err = alloc_kiovec(1, &lv_snap->lv_iobuf);
> to
> 	ret = alloc_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);
>
> and so on for other calls to alloc_kiovec and free_kiovec
>
> I don't have time and resources to actually produce a patch and test it
> atm, but i believe it would work, please let us know how you fare
>
> regards,
> Luca

-- 
==========
Cheers
   -jdf
