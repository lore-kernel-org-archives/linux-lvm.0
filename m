From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] ablout LVM's limits
Message-ID: <20020603120445.D14161@sistina.com>
References: <OF526818D0.B4893AF1-ON48256BCA.00314BE3@legend.com.cn>
Mime-Version: 1.0
In-Reply-To: <OF526818D0.B4893AF1-ON48256BCA.00314BE3@legend.com.cn>; from lilha@legend.com.cn on Fri, May 31, 2002 at 05:00:58PM +0800
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
Date: Mon Jun  3 05:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 31, 2002 at 05:00:58PM +0800, lilha@legend.com.cn wrote:
> 
> i want to know the limits of PV in lvm.
> Is there any limits in PV?
> Do I can create a PV in a more 2TB partition in theory?

Not with Linux 2.4. 2.5 is starting to raise that limit.

With 2.4 you can have PVs up to 2TB, VGs can have up to 256 PVs and
LVs are limited by Linux 2.4 to 2TB max too.

> 
> 
> TIA for your help and sorry for my poor English.
> 
> Echo
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
