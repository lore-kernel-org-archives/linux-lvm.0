From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
Message-Id: <20020207151811.X15496@lynx.turbolabs.com>
References: <wxx3d0d2czp.fsf@nommo.uio.no>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wxx3d0d2czp.fsf@nommo.uio.no>; from terjekv@math.uio.no on
    Thu, Feb 07, 2002 at 10:33:46PM +0100
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
Date: Thu Feb  7 16:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

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
