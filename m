From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Upgrade Linux 2.2 to 2.4 problems
Message-ID: <20021002122716.B1955@sistina.com>
References: <3D9A201E.8070108@lingbrae.com>
Mime-Version: 1.0
In-Reply-To: <3D9A201E.8070108@lingbrae.com>; from dick@lingbrae.com on Tue, Oct 01, 2002 at 11:22:22PM +0100
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
Date: Wed Oct  2 05:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 01, 2002 at 11:22:22PM +0100, Dick Middleton wrote:
> I'm still having difficulty getting LVM to behave itself on a 2.4 kernel 
> when it
> works fine on a 2.2 kernel.  I'm using beta7 on both kernels - the 2.4 
> kernel
> is 2.4.10.ac4 which seems to have version beta7(ish) in it.  I'm booting 
> through
> initrd as /root is on LVM.
> 
> vgscan appears to work ok but vgchange fails with:
> 
> Error- can't get names of physical volumes - please check if /proc is 
> mounted.
> 
> Well, /proc is mounted - in fact if it isn't mounted I don't this error.
> 
> What does this error message mean and what's likely to be wrong to cause it?

Dick,

this can't be the exact LVM 0.9-Beta7 error message.
Is /proc really mounted, *before* vgchange runs in /linuxrc?

BTW: why do you use such an old kernel and LVM version?
     Please give a recent one and LVM 1.0.5 a try.

> 
> Many thanks
> 
> Dick
> 
> 
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
