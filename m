Return-Path: <root@srv.sistina.com>
Date: Wed, 21 Feb 2001 10:08:49 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Stripe size of 2K allowed?
Message-ID: <20010221100849.A24951@srv.sistina.com>
References: <20010220130303.A505@jadzia>
Mime-Version: 1.0
In-Reply-To: <20010220130303.A505@jadzia>; from josv@osp.nl on Tue, Feb 20, 2001 at 01:03:03PM -0800
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

On Tue, Feb 20, 2001 at 01:03:03PM -0800, Jos Visser wrote:
> Hi,
> 
> I was trying to create a striped lvol with a stripe size of 2K. This
> failed due to an illegal parameter:
> 
> # lvcreate -i 2 -I 2 -L 100 vg01
> lvcreate -- invalid stripe size 2
> 
> It seems that stripe sizes of 1K and 2K are not allowed, although the
> lvcreate manual page says that the stripe size is 2^n with 0<=n<=7.

An error in the documentation.
The minimum stripe size is 4k.

Going to correct it...

> 
> Duh?
> 
> ++Jos
> 
> 
> -- 
> I have no need for a spirituality which can not encompass my humanness.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
