Date: Wed, 5 Sep 2001 13:57:52 -0500 (EST)
From: John Marquart <jomarqua@indiana.edu>
Subject: Re: [linux-lvm] lvcreate segfaults
In-Reply-To: <Pine.A41.4.21.0109051323340.22482-300000@gigue.dlib.indiana.edu>
Message-ID: <Pine.A41.4.21.0109051357240.22482-100000@gigue.dlib.indiana.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

One piece of info i forgot - not sure its relevance - but this is a SMP
machine running 2 zeon processors.

-j

On Wed, 5 Sep 2001, John Marquart wrote:

> Good afternoon,
> 	I am running LVM 1.0.1rc2 on  2.4.8 kernel ontop of a IBM
> Serverraid 4Mx RAID5 filesystem.  I am trying to create a new lv using
> "lvcreate -n foo -L 4M rootvg" - however that command insists on giving me
> a segfault.  
> 
> Attached are the complete outputs of the above lvreate command w/ the -v
> and -d flags.  excerpts (the last few lines) are listed below:
> 
> ----lvcreate ... -v----
> lvcreate -- setting up logical volume
> lvcreate -- setting read ahead sectors
> lvcreate -- creating logical volume VGDA in kernel
> Segmentation fault (core dumped)
> 
> ----lvcreate ... -d----
> <1> lv_setup_for_create -- pv_reserve_pe returned: 0   pe_last: 1  pe: 0
> <1> lv_setup_for_create -- pe: 0
> <1> lv_setup_for_create -- LEAVING with ret: 0
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_dont_interrupt -- LEAVING
> Segmentation fault (core dumped)
> -----------------------------------
> 
> 
> If there is any other info I can provide - please let me know.  I only
> attached what seemed most pertinent.
> 
> thanks,
> -jamie / vaix
> 


John "Jamie" Marquart		|     This message posted 100% MS free.
Digital Library SysAdmin	|  Work: 812-856-5174   Pager: 812-334-6018
Indiana University Libraries	|  ICQ: 1131494	 	D'net Team:  6265
