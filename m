Return-Path: <root@srv.sistina.com>
Date: Mon, 16 Jul 2001 13:29:59 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Upgrade path
Message-ID: <20010716132959.C11625@sistina.com>
References: <3B4EE8F2.5050506@ednet.ns.ca>
Mime-Version: 1.0
In-Reply-To: <3B4EE8F2.5050506@ednet.ns.ca>; from boutilpj@ednet.ns.ca on Fri, Jul 13, 2001 at 09:26:26AM -0300
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

On Fri, Jul 13, 2001 at 09:26:26AM -0300, Patrick Boutilier wrote:
> Hello,
> 
> I am currently using LVM driver version 0.9.1_beta6 with a 2.2.19 
> kernel. I am planning to upgrade to kernel version 2.4.6 or maybe 
> 2.4.7-pre6. What LVM version should I compile into the kernel? Should I 
> stay with 0.9.1_beta6 or jump up to 0.9.1_beta7?

If you can wait for LVM 0.9.1 Beta 8, you should.
We are just some days away from that release (hopefully ;-)

FYI: LVM 0.9.1 Beta6/7 have a misalignment bug which causes errors when using
     snapshots on such misaligned PVs.

> I did extend a logical 
> volume using 0.9.1_beta6 if that makes any difference.

No, it doesn't.

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
