Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102082244.f18MiYt07465@webber.adilger.net>
Subject: Re: [linux-lvm] questions
In-Reply-To: <20010208205551.C21949@vestdata.no> from =?UNKNOWN-8BIT?Q?Ragnar_Kj=F8rstad?=
 at "Feb 8, 2001 08:55:51 pm"
Date: Thu, 8 Feb 2001 15:44:33 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ragnar Kj_rstad writes:
> Is there a limit for the maximum size of a LVM diskgroup?
> (internally in LVM-code, or because of other limits in the kernel)
> The 2TB (1 TB) maximum devicesize in the linux-kernel doesn't apply, does
> it?

Yes, even LVM has the 2TB limit at this point.  This is because LVM
presents itself to the rest of the kernel as a block device (just like
any other), so the kernel 2TB limit for block devices still holds.

Heinz talked about allowing LVM to have PAGE_SIZE (4k) blocks (unlike
the rest of the kernel, which uses 512 byte blocks) so it may be possible
to go up to 16TB with LVM without a huge amount of kernel redesign.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
