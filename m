Subject: Re: [linux-lvm] Bad block reallocation
Message-ID: <20020820213855.GB15363@fib011235813.fsnet.co.uk>
References: <1d9901c2486a$e8f3f2f0$4802a8c0@oninet.pt>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d9901c2486a$e8f3f2f0$4802a8c0@oninet.pt>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Tue Aug 20 16:39:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 20, 2002 at 05:59:13PM +0100, samuel rom?o wrote:
> Hi,
> 
> 
> I would like to know that if it is any plan on LVM or LVM2 to include bad block reallocation. And if possible to know a nice way to implement it with the current lvm faeatures.

I'm not sure about automatic bad block/extent reallocation yet.  But
we will certainly allow the sys admin to pvmove single extents and
mark extents as unallocatable in LVM2.

- Joe
