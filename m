Return-Path: <lord@sgi.com>
Message-Id: <200105231625.f4NGPsx02257@jen.americas.sgi.com>
Subject: Re: [linux-lvm] XFS and LVM 
In-Reply-To: Message from Harald Milz <hmilz@linux-magazin.de> 
   of "Wed, 23 May 2001 14:45:38 +0200." <20010523124542.C43D515CB5@mail.linux-new-media.de> 
Date: Wed, 23 May 2001 11:25:54 -0500
From: Steve Lord <lord@sgi.com>
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

> In article <200105231113.f4NBDLA21032@jen.americas.sgi.com>, Steve Lord <lord
> @sgi.com> wrote:
> 
> > Shrinking is also a less used operation in production situations than growi
> ng,
> 
> This what IBM marketing as well always told me (when I was an IBMer) but it
> turned out over time that I don't always buy a new disk when I need more
> space, but try to clean up some leftovers and resize my partitioning. Then
> it's nice if you can shrink. I mean you can always backup a filesystem,
> delete it, create it smaller, and restore the backup. But that is
> cumbersome and requires more scheduled downtime than desirable. 
> 
> Does SGI have plans to eventually implement shrinking, or am I left with
> the every so often heard marketing statement that I sure don't need it? 

Well, when it comes to working for a company which is supposed to be making
money, you cannot just go and implement features which will burn maybe
$75,000 to get going correctly (that includes dealing with support calls
etc from the customers who find bugs, fixing the bugs etc), unless there
is a return on the investment.

So I think the answer is no, we will not be doing it in the forseeable
future. But if some large customer was to wave several million in orders
at us with this as a requirement it might be a different matter.

Steve

> 
> (SCNR)
> 
> -- 
> Harald Milz           |     hm@linux-magazin.de     | "Our vision is to speed
> Linux Magazin         | phone  +49 (0) 89 993411-20 | up time, eventually
> Stefan-George-Ring 24 | fax    +49 (0) 89 993411-99 | eliminating it." --
> D-81929 Muenchen      | http://www.linux-magazin.de | Alex Schure
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
