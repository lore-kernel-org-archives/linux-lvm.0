From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
Message-Id: <20020220195900.A12832@lynx.adilger.int>
References: <20020219221959.P25713@lynx.adilger.int>
    <NBBBKLKHMJHIJLHOGAOJIEPAJEAA.steve.wray@paradise.net.nz>
    <NBBBKLKHMJHIJLHOGAOJIEPAJEAA.steve.wray@paradise.net.nz>
    <20020220103147.A890@lynx.adilger.int> <m3zo23u0o7.fsf@shakti.rupa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3zo23u0o7.fsf@shakti.rupa.com>; from rupa-list@rupa.com on
    Wed, Feb 20, 2002 at 04:40:56PM -0800
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
Date: Wed Feb 20 20:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Feb 20, 2002  16:40 -0800, Rupa Schomaker wrote:
> Andreas Dilger <adilger@turbolabs.com> writes:
> > Swap is a bad move, since you can just add multiple swap spaces with the
> > same priority (if you so choose) and it will do the striping for you.
> > Likewise, you could put each of the above trees on their own drive and
> > you would probably get better overall performance than striping.
> 
> This suggestion has always bothered me.  Yes, if all you care about
> performance, setting up swap this way works fine.  However, for every
> drive you add you increase the likelyhood that you're system will fail
> due to a drive failure (what happens when one of the swap slices
> suddenly dissapears?).
> 
> The better (IMO) suggestion is to use MD to setup RAID-1 mirrors and
> then swapadd those.  That way, if one of your drives go south, you
> still have a workable swap.

Well that is true of ANY setup that uses RAID-0/stripe, or any unmirrored
disk for that matter.  I am by no means advocating the use of striped swap,
just saying that to stripe at the physical layer is no benefit over letting
the swap do its own striping.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
