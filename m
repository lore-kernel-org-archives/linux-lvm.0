From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
Message-ID: <20030312224940.GA15229@gw.silicide.dk>
References: <20030312195217.GC18876@auctionwatch.com> <20030312221320.GA15196@gw.silicide.dk> <3E6FB34E.30003@cox.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E6FB34E.30003@cox.net>
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
Date: Wed Mar 12 16:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 12, 2003 at 03:23:10PM -0700, Kevin P. Fleming wrote:
> jon+lvm@silicide.dk wrote:

[cut]

> >later down you write you need speed. In that case i would suggest
> >ditching the hardware raid, and use pure software raid, it is faster.
> >I dont mind 3ware, i have dome myself, but my benchmarking revealed
> >that software was faster.
> >
> 
> True, but I'd sure hate to wait for a software array rebuild when the 
> system crashes... I've only got a pair of 160G drives but I still hate 
> waiting when the kernel has a problem. If your system is very, very stable 
> this might not be an issue.

you're talking about raid0. You dont rebuild raid0. Not in hardware, not
in software.



JonB
