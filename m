Message-ID: <85063BBE668FD411944400D0B744267A8885CE@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Cannot create LV beyond 16GB in size?
Date: Tue, 25 Sep 2001 13:39:18 -0500
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I tried choosing a size larger than 4mb, but i still can't make use of the
full amount. Not sure whats going on. Does it matter that one disk is
ATA100, and another is ATA66?

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Andreas Dilger [mailto:adilger@turbolabs.com]
> Sent: Tuesday, September 25, 2001 12:24 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Cannot create LV beyond 16GB in size?
> 
> 
> On Sep 25, 2001  12:01 -0500, Gonyou, Austin wrote:
> > I've made 3 partitions. /dev/hdd1 /dev/hdd2 /dev/hdb9. 
> > I'm going to stripe them and then use all available size. 
> > When I do lvcreate, it won't let me go above 16G. Whats up 
> with that?
> > Kernel 2.4.10
> > LVM 1.0 tools. 
> 
> You need to select a PE size larger than 4MB.  Also realize 
> that striping
> your LVs means all your data will be lost if one disk dies.
> 
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound 
> of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/             
>   -- Dogbert
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
