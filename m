From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] e2fsadm and snapshots?
Message-ID: <20021105191111.GD588@clusterfs.com>
References: <20021105172624.QSMY10479.imf26bis.bellsouth.net@TAZ2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021105172624.QSMY10479.imf26bis.bellsouth.net@TAZ2>
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
Date: Tue Nov  5 13:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 05, 2002  12:24 -0500, Greg Freemyer wrote:
> Andreas Dilger wrote:
> >  I would suggest putting your snapshot LV onto a separate disk and see how
> >  that does.
>
> Can that be done?
> 
> I thought the snapshot LV had to share the same VG/PV as the base LV.

Same VG, but it can be on any PV therein.

> Is there some way to force the snapshot on to separate physical drives.

You just specify the PV on which to create the snapshot LV.  This is no
different than any other LV creation, for which you can optionally specify
the PV(s) on which it is created.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
