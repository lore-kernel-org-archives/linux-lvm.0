From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Device Resets?
Message-Id: <20020419151813.C25208@sistina.com>
References: <200204172133.OAA08410@hpgssl.cup.hp.com>
MIME-Version: 1.0
In-Reply-To: <200204172133.OAA08410@hpgssl.cup.hp.com>; from
    defranco@cup.hp.com on Wed, Apr 17, 2002 at 01:33:42PM -0800
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
Date: Fri Apr 19 08:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 17, 2002 at 01:33:42PM -0800, John DeFranco wrote:
> Hi,
> 
> I was wondering if anyone could tell me of LVM issues device resets, like a 
> bus reset or target device reset or something similiar?

No, it doesn't do resets.

Old versions did cache flushes and invalidations which was crappy;
the actual ones don't do this any longer.

> 
> Thanks!
> 
> ===============================================================
> John DeFranco			Hewlett-Packard Company
> john_defranco@hp.com		Availability Clusters Solution Division
> phone: 408-447-7543		19111 Pruneridge Ave, M/S 4101
> fax: 408-447-0056		Cupertino, CA 95014 
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
