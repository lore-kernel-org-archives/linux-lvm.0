Date: Mon, 7 Feb 2000 17:45:43 +0100
From: Fabian.Herschel@suse.de
Subject: Re: [linux-lvm] Configuring boot partition with LVM
Message-ID: <20000207174543.M1170@suse.de>
References: <Pine.LNX.4.20.0002041218580.416-100000@claudius.mgmt-inc.com> <20000207103719.A1170@suse.de> <389EF4DE.68165A11@osp.nl>
Mime-Version: 1.0
In-Reply-To: <389EF4DE.68165A11@osp.nl>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jos Visser <josv@osp.nl>
Cc: linux-lvm@msede.com


Hi,

On Mon, Feb 07, 2000 at 05:37:50PM +0100, Jos Visser wrote:
> >  Lilo
> > should also learn how to boot a kernel fom a striped volume...
> 
> Hi,
> 
> I don't think you fully appreciate the request you're making here.

The question (not my answer!!) was why is it complicate to boot fom a
lv. Ans i anserwed that lilo cant do that at this point of time!
I also pointed to an advanced problem (the striping) so it should
be clear thats not only a thing of a "simple" patch in lilo. 

My itention was to show WHY theere are a lot of problems for getting
linux to boot from "any" lv.

> Commercial Unices such as HP-UX and Solaris can not boot from striped
> volumes for about the same reasons why it would be difficult to have
> LILO read from a striped volume: the implications are just too
> horrendous to comtemplate.
> 
> Typically I don't care that my boot partition/lv can not be striped. The

Me to. A small /boot does not need to be striped. In the near time it
also need to be lv controlled...

> I/O rates into that volume are just not high enough to need striping.
> Why not put our efforts to something else which is more important right
> now.?

Yes, but we should also explain (or show) restrictions to our collegs on 
this list! 

Greetings
Fabian

-- 
-----------------------------------------------------------------------
Fabian Herschel                                 SuSE Rhein/Main AG     
Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
Fax:    +49-6196-409-607                        D-65760 Eschborn
mailto: Fabian.Herschel@suse.de                 http://www.suse.de      
