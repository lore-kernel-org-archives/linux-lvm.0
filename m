From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM2 and Kernel 2.5.xx
Message-ID: <20021009130737.C23965@sistina.com>
References: <200210070638.PPL01042@vmms4.verisignmail.com> <20021007104553.B17176@sistina.com> <20021007143359.GB1978@glorybox.de>
Mime-Version: 1.0
In-Reply-To: <20021007143359.GB1978@glorybox.de>; from lists@glorybox.de on Mon, Oct 07, 2002 at 04:33:59PM +0200
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
Date: Wed Oct  9 06:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 07, 2002 at 04:33:59PM +0200, Kai Weber wrote:
> + Heinz J . Mauelshagen <mauelshagen@sistina.com>:
> 
> > the device-mapper code to Linus ASAP. This is supposed to be the
> > replacement for the LVM1 driver in 2.5 together with the LVM2 tools
> > (which are LVM1 compatible).
> 
> How will the migration from LVM1 to LVM2 work? Would LVM1 volumes
> be easily convertible into LVM2 without data loss?

LVM2 is completely metadata format compatible with LVM1.
IOW: it supports the LVM1 metadata read-write.

The upgrade is a matter of installing the LVM2 and device-mapper
software (properly ;-) and running "vgscan ; vgchange -ay".


> 
> Kai
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
