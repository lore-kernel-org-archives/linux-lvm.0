Subject: Re: [linux-lvm] Virtual File Drivers for a VoD(Video on Demand)
	application Project
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <3F8D1195.EF8D0EA1@multitech.co.in>
References: <3F8D1195.EF8D0EA1@multitech.co.in>
Message-Id: <1066236364.19483.103.camel@david.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Oct 15 11:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM@sistina.com

On Wed, 2003-10-15 at 05:21, balasubramanya wrote:
>                     Kind Attn: Heinz Mauelshagen
> 
> Dear Sir,
> 
> I was going through the information posted by you on the Internet
> regarding the Heinz Mauelshagen's LVM (Logical Volume Manager) for
> Linux.
> Hence I am assuming that a lot of work has been done from you guys in
> this direction.
> 
>   We are a Bangalore, India based Software development company looking
> at options to develop the Virtual File Driver for a VoD
> (Video on Demand) application. This Driver has to communicate with a
> Windows Media Player 9 on one end and a Temporary buffer at the
> other end.
> 
>   I have to stress the point that we need to use a Striping File system.

Never heard of a Striping File System.

I have heard of File Systems which can be optimized (or tuned) to be
layered above a Striped Logical Volume.

Typically the striping is implemented in a hardware or software raid
solution.

In addition, LVM can stripe a LV (Logical Volume) over multiple PVs
(Physical Volumes).

Once you have your logical volume created with the striping in place via
one of the above 3 choices, you do the mkfs and create/install the
filesystem.

> 
> Some of the File System specifications are as follows:
> 
>   Block size : 4096 bytes
>   Large File size: 1 G byte
>   Number of Maximum Large files: 1M

1 GB per file with a million files is an Exabyte.  That is certainly
pushing the limits of todays technology and is not supported in any
released vanilla kernel.org kernel.  I believe it is supported by the
2.6.0-test series of kernels, but I have not heard of anyone building a
filesystem that big yet.

I don't know how large DM and LVM2 can scale in the 2.6.0-test7 kernel. 
I believe 2 TB has been the traditional barrier with the 2.4 kernel.

How big of a single FS are you really taking about?  

>   Number of Maximum nodes: 4096 nodes

What do you mean by a node?  

If that is 4096 computers, I would look at Lustre.  

From their website "The 1.0 release of Lustre will happen in late 2003
and will target clusters of up to 1,000 nodes with 100 TBs of storage."

IIRC, the US DOD is sponsoring Lustre and HP is doing most of the
implementation.

I don't know if Lustre uses any LVM or DM technology, but personally I
doubt it.

For a single computer solution, the XFS filesystem is generally
considered the best Linux FS for Video stream distribution.

I have spec'ed a 6 TB XFS filesystem on a single computer for my
companies R&D work.  It looks very doable from a hardware perspective,
but now I have to get the money to buy all the hardware and see if it
works in reality.

My concept would be to use hardware raid to create 6 1 TB volumes.  Then
use either software raid or DM to stripe those together into a single 6
TB volume.

FYI: I'm not familiar with any hardware Raid controller that supports
volumes larger than 2 TB., and my gut feel is that sticking to 1 TB and
below is safer than trying to push the technology.

Alos, if the DM in the 2.6.0-test kernel can support 6TBs, then I will
likely have it in the mix as well.

> 
>     We are looking for open source options. Please let us know your
> comments and suggestions about the availabilty of such
> Software and also the licensing terms and conditions.

All of the above is GPL'ed to my knowledge.

IANAL:
It sounds like you want to be a service provider, so I don't know what
impact the GPL will have on you.  Certainly you can use the above at no
cost, but you may be required to make accessible to your customers the
original source code plus any patches to the above you incorporate.

If so, your patches would also have to covered by the GPL, and thus
could be incorporated back into the original at the discretion of the
individual package maintainers.

> 
> Thanks & Regards,
> Bala
Greg
-- 
Greg Freemyer
