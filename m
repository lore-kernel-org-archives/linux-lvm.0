Date: Wed, 17 Mar 2004 15:31:06 +0100
From: Heinz Mauelshagen <heinzm@redhat.com>
Subject: Re: [linux-lvm] LVM Problems when moving data off a PV
Message-ID: <20040317143106.GA14348@redhat.com>
References: <1079271129.2414.7.camel@rockley.barbados>
	<20040315123445.GA17078@redhat.com>
	<1079478248.28877.6.camel@rockley.barbados>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1079478248.28877.6.camel@rockley.barbados>
Reply-To: heinzm@redhat.com,
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

On Tue, Mar 16, 2004 at 11:04:09PM +0000, Nick Gushlow wrote:
> On Mon, 2004-03-15 at 12:34, Heinz Mauelshagen wrote:
> 
> > 
> > You need to select the last valid metadata backup of vg2 from /etc/lvmconf
> > (check it with vgcfgrestore -ll -f /etc/lvmconf/vg2.conf[.#.old]; see
> > 'man vgcfgrestore for metadata archive file names) and restore it.
> > 
> > Say vg.conf.1.old is the valid one:
> > 
> > for dev in AllPVsOfVG2 # list all PVs reported by vgcfgrestore -ll above
> > do
> > 	pvcreate -ff $dev
> > 	vgcfgrestore -f /etc/lvmconf/vg.conf.1.old $dev
> > done
> > vgscan
> > vgchange -ay vg2
> > 
> 
> 
> That did the trick thanks. :-)
> 
> Of course in a moment of not concentrating I messed things up again.  I
> still had pvremove on the disk from when I previously installed the lvm2
> tools, and although I wanted to do a vgreduce I did a pvremove.  Even
> when it kicked up an error I just followed what it said and typed
> pvremove -ff. oops :-/
> 
> Now I get a a similar error as before with vgscan, and other tools give
> a 'VGDA in kernel and lvmtab are NTO consistent: please run vgscan'
> error.
> 
> I tried re-running what you suggested above but vgcfgrestore gives a
> 'can't restore part of active volume group "vg2"' error.
> 
> Is there anyway to recover from my stupidity (other than a lobotomy!)?

:)

Deactivate the VG and rerun pvcreate/vgcfgrestore on the pvremoved disk,
vgscan and "vgchange -ay vg2" afterwards.

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
