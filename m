From: "John Moser" <jmoser@erc.wisc.edu>
Subject: RE: [linux-lvm] using 160GB IDE drives under linux with LVM.
Message-Id: <CBEHLLOPCKAOIAOINGKAAEHFCAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020207151811.X15496@lynx.turbolabs.com>
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
Date: Thu Feb  7 16:42:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Is this specific to 2.4.X kernels?  I'm running 2.5.0, and I just noticed
that the 160 gig drives I was using are also partitioned at only 128Gigs.

-John Moser

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Andreas Dilger
Sent: Thursday, February 07, 2002 4:18 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.


On Feb 07, 2002  22:33 +0100, Terje Kvernes wrote:
>   [ Re: IDE 128GB disk limits ]
>
>   now, I've added SCSI-devices that where > 500GiB with ease into LVM,
>   but here I stumble.  is there some easy solution out there that I've
>   missed?
>
>   the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
>   from 26/11.  patches or anything people want to toss at this will be
>   highly appreciated.  we have two of these beasts from Maxtor, and
>   stand to loose about 60GiB of space, which isn't all that neat.

This is a kernel IDE driver limit.  You need to patch with Andre Hedrik's
IDE patches to support IDE devices over this size.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
