From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm-problems. vgda inconsistency
Message-ID: <20021216164845.A19655@sistina.com>
References: <200212160923.58295.lists@franzke-online.de>
Mime-Version: 1.0
In-Reply-To: <200212160923.58295.lists@franzke-online.de>; from lists@franzke-online.de on Mon, Dec 16, 2002 at 09:23:58AM +0100
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
Date: Mon Dec 16 09:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 16, 2002 at 09:23:58AM +0100, Dieter Franzke wrote:
> Hi,
> 
> I've created a pv, vg and lv
> via pvcreate, vgcreate and lvcreate.
> Everything went well.
> But when I tried to  initialize a filesystem via mkfs.xfs I get following 
> error:
> 
> VGDA in Kernel and lvmtab are NOT consistent; please run vgscan
> 
> When I run vgscan nothing is changed.
> How can I fix this without rebooting?

Rebooting won't help this. vgscan _reads_ the LVM metadata on the PVs
and tries to update the working copies of the metadata in /etc/lvmtab*.
No change to the metadata on the PVs happens during a vgscan run.

Does vgscan display any error?
What does vgck display?

vgck should check the ondisk metadata fine or we need to restore it
from archive copies in /etc/lvmconf/ (please save those!)

> 
> any hints?
> 
> ciao
> 
> dieter
> 
> -- 
> registered linuxuser 199810
> it's time to close windows....
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
