From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvscan problem
Message-ID: <20020909125030.A15934@sistina.com>
References: <Pine.LNX.4.44.0209071706070.5919-100000@server.piarista-kkt.sulinet.hu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0209071706070.5919-100000@server.piarista-kkt.sulinet.hu>; from nagyz@piarista-kkt.sulinet.hu on Sat, Sep 07, 2002 at 05:08:24PM +0200
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
Date: Mon Sep  9 06:10:27 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

There's no pvremove so far. LVM2 will have one later though.

Just "dd if=/dev/zero of=/dev/WhateverPV count=1 bs=1k" to all the PVs
you want to get rid of.

If you can stand to see them pvscan'ed as new PVs,
run "pvcreate -ff /dev/WhateverPV" instead.

On Sat, Sep 07, 2002 at 05:08:24PM +0200, NagyZ wrote:
> Hi!
> 
> after i reinstalled my system, pvscan still shows old hdd's as inactive 
> PVs.. how can i remove that? the hdds have been completely repartitioned, 
> so i dont know why is that..
> is there any way to "unmark" a partition which have been marked with 
> pvcreate?
> 
> Regards,
> 
> NagyZ
>  
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

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
