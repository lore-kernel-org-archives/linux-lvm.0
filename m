From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
Message-Id: <20020207160224.Y15496@lynx.turbolabs.com>
References: <20020207151811.X15496@lynx.turbolabs.com>
    <CBEHLLOPCKAOIAOINGKAAEHFCAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CBEHLLOPCKAOIAOINGKAAEHFCAAA.jmoser@erc.wisc.edu>;
    from jmoser@erc.wisc.edu on Thu, Feb 07, 2002 at 04:45:03PM -0600
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
Date: Thu Feb  7 17:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Moser <jmoser@erc.wisc.edu>
Cc: linux-lvm@sistina.com

On Feb 07, 2002  16:45 -0600, John Moser wrote:
> Is this specific to 2.4.X kernels?  I'm running 2.5.0, and I just noticed
> that the 160 gig drives I was using are also partitioned at only 128Gigs.

The IDE stuff didn't go into the 2.5 tree until 2.5.2-something.

> Andreas Dilger wrote:
> On Feb 07, 2002  22:33 +0100, Terje Kvernes wrote:
> >   [ Re: IDE 128GB disk limits ]
> 
> This is a kernel IDE driver limit.  You need to patch with Andre Hedrik's
> IDE patches to support IDE devices over this size.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
