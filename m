From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm -- lvm_blk_ioctl: unknown cmd
Message-ID: <20030818111820.A8426@sistina.com>
References: <1060906319.18416.1783.camel@airwolf.cup.hp.com>
Mime-Version: 1.0
In-Reply-To: <1060906319.18416.1783.camel@airwolf.cup.hp.com>; from defranco@airwolf.cup.hp.com on Thu, Aug 14, 2003 at 05:11:59PM -0700
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
Date: Mon Aug 18 04:25:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 14, 2003 at 05:11:59PM -0700, John DeFranco wrote:
> Hi,
> 
> I'm running lvm 1.0.7 on RedHat AS2.1 U2 + Errata e25. When I fsck a
> logical volume I get the following messages:
> 
> 
> lvm -- lvm_blk_ioctl: unknown cmd 0x1260
> lvm -- lvm_blk_ioctl: unknown cmd 0x801c0204
> 
> This does not occur with reiserfs. Should I be concerned? All the data
> seems to be ok.

NP, some ioctls not supported (e.g. 1260 = BLKGETSIZE64).
Can be safely ignored.

> 
> Thansk!
> 
> John DeFranco			Hewlett-Packard Company
> john.defranco@hp.com		Availability Clusters Solution Division
> phone: 408-447-7543		19111 Pruneridge Ave, M/S 4101
> fax: 408-447-0056		Cupertino, CA 95014 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
