Date: Thu, 6 May 2004 13:01:38 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM limits on 64 bits
Message-ID: <20040506110138.GA1719@redhat.com>
References: <1083834092.1999.15.camel@yannick.vivaxe.lan>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1083834092.1999.15.camel@yannick.vivaxe.lan>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: hjm@redhat.com

On Thu, May 06, 2004 at 11:01:32AM +0200, Yannick Lecaillez wrote:
> Hi !
> 
> 	I'm new to the list and LVM.
> 
> 	I whish to know the true maximum size for a logical volume, 
> volume group and how many physical volumes LVM can manage on a IA64
> system running RHEL 3.

Up to 256 PVs per VG and up to 256 LVs system total.
Up to 2TB per PV/LV because of the Linux 2.4 block device layer constraint.

Eg. create a VG with up to 256PVs, each 2TB in size -> 512TB VG size.
That VG can have as many as 256 LV, each max. 2TB in size.

You typically have more than 1 VG *and* the max. 256 LVs/system
still applies (eg, 2 VGs could have 156 LVs in the first one and up to 100 LVs
in the 2nd one).

> 
> 	Numbers i found on the net found are old (2001/2002) and i
> need to deploy solution with several tera byte.

If you need more than 2TB/LV, the LVM1 compatible device-mapper/LVM2
in Linux 2.6 is your friend, because 2.6 supports large block devices
beyond 2TB.

> 
> 	Thanks !
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
