Date: Thu, 18 Mar 2004 17:21:05 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM Problems when moving data off a PV
Message-ID: <20040318162105.GA31188@redhat.com>
References: <1079271129.2414.7.camel@rockley.barbados>
	<20040315123445.GA17078@redhat.com>
	<1079478248.28877.6.camel@rockley.barbados>
	<20040317143106.GA14348@redhat.com>
	<1079553784.28897.49.camel@rockley.barbados>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1079553784.28897.49.camel@rockley.barbados>
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
To: nick@gushlow.com, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 17, 2004 at 08:03:04PM +0000, Nick Gushlow wrote:
> On Wed, 2004-03-17 at 14:31, Heinz Mauelshagen wrote:
> 
> > 
> > Deactivate the VG and rerun pvcreate/vgcfgrestore on the pvremoved disk,
> > vgscan and "vgchange -ay vg2" afterwards.
> > 
> 
> Excellent that did the trick. :-) 
> 
> The only way I found to get rid of the "VGDA in kernel and lvmtab are
> NOT consistent: please run vgscan" error when running 'vgchange -an vg2"
> was to reboot.
> 
> For future reference, is there a better/proper method to get rid of that
> error?

If you are able to deactivate the VG without a reboot, which is rather unlikely
because you've got filesystems on LVs mounted etc., do that.

Unless the LVM metadata gets overwritten externally,
LVM will keep both (metadata on disk and in kernel) in sync.

> 
> Nick.

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
