From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LVM limit on PE's/size?
Message-ID: <20011129095948.G29249@lynx.no>
References: <200111291636.fATGa3L15288@jay.phy.queensu.ca> <20011129114031.A15298@jay.phy.queensu.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011129114031.A15298@jay.phy.queensu.ca>; from peter@owl.Phy.Queensu.CA on Thu, Nov 29, 2001 at 11:40:31AM -0500
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
Date: Thu Nov 29 10:58:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Skensved <peter@owl.Phy.Queensu.CA>
Cc: linux-lvm@sistina.com

On Nov 29, 2001  11:40 -0500, Peter Skensved wrote:
>       
> >In general you should plan for the largest possible Logical Volume size
> >during the lifetime of a Volume Group and set the Physical Extent size
> >(vgcreate -s) acordingly. Even though Linux does not support more than 2TB
> >per block device today, it will be in the future and you won't suffer from
> >the LVM1 constraint ITR.
> 
>     Is there any way to change the PE size `after the fact ' ?
 
 No.

> I have a 255.99 GB logical volume ( three 80 GB drives ) with PE size set
> to 4 Mb. Is there a non-destructive way to increase the PE size so that I
> can add more drives ? Or do I have to back everything up and start from
> scratch ?

Well, if you are adding more drives, you could always create a new VG with
the larger PE size, copy over all of your data, and then add the old drives
into the new VG after removing them from the old VG.  Sadly, the PE size
seems to be stored in the PV header (as well as the VG header), so it may
be that you need to re-initialize the PV to change the PE size (maybe not,
I don't know).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
