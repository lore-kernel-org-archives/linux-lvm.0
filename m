Return-Path: <root@srv.sistina.com>
Date: Fri, 13 Jul 2001 13:12:00 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010713131200.C32198@sistina.com>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net>
Mime-Version: 1.0
In-Reply-To: <200107121612.MAA13656@burns.luca.2y.net>; from luca@lucarella.com.ar on Thu, Jul 12, 2001 at 11:53:58AM -0300
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
To: linux-lvm@sistina.com

On Thu, Jul 12, 2001 at 11:53:58AM -0300, Leandro Lucarella wrote:
> Hi, I'm new in LVM (I'm so new that I'm not even using it :) and I have a
> question:
> 
> I want to know if the stiper mode, the performance gain is somparable to Software
> RAID 0.

In theory they should be pretty similar :-)

But people reported differences which are probably caused by their particular
hardware setup.

In order to answer the question for your particular configuration, you should
test both ;-)

> Another question is the boot stuff, what is better? compile LVM as a module
> and use inird or compile the kernel with built-in LVM support?

It doesn't make a difference if you go for the module or the build in driver,
you need to have an initrd today anyway to activate your VGs at boot time.

We are working on boot time recognition of VGs in the driver which will vanish
the initrd. That will be in a post 1.0 version of the Linux LVM.

Regards,
Heinz    -- The LVM Guy --


> Thanks for your help...
> 
> --
> LUCA - Leandro Lucarella
> ------------------------
> luca@lucarella.com.ar
> http://www.luca.2y.net
> LICQ UIN: 2847576
> ------------------------
> Usando Debian GNU/Linux
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
