From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] anyone tried 2.4.17 yet ??
Message-Id: <20011228205627.GE18975@auctionwatch.com>
References: <3C2C6DE9.9020306@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C2C6DE9.9020306@ti.com>
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
Date: Fri Dec 28 14:54:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 28, 2001 at 02:04:41PM +0100, christian e wrote:
> Hi,all
> 
> Just wondering..Did anyone give 2.4.17 a try ? And what needs to be done 
> with regards to LVM ? Up until now I've only run ac kernels,but I'd like 
> to give 2.4.17 a try.Any pacthes necessary ??

    We're running it on a couple of production servers--or rather we're
    running the rc2 patch to 2.4.16. 

    You still need to apply the vfs-lock patch, and I did a build in the
    patches directory and applied that. 

> best regards
> 
> Christian
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Share and Enjoy. 
