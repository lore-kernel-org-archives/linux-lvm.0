From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM ate my data!
Message-Id: <20020226114538.A13520@sistina.com>
References: <20020225192811.A9674@sistina.com>
    <Pine.OSF.4.05.10202252007450.18015-100000@cpca7.uea.ac.uk>
MIME-Version: 1.0
In-Reply-To: <Pine.OSF.4.05.10202252007450.18015-100000@cpca7.uea.ac.uk>;
    from W.B.Hill@uea.ac.uk on Mon, Feb 25, 2002 at 08:18:10PM +0000
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
Date: Tue Feb 26 04:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 25, 2002 at 08:18:10PM +0000, wbh wrote:
> Wahey - I got my data back, thankyou!
> 
> > pvcreate -yff /dev/hda[34]
> > vgcfgrestore -n YourVGName /dev/hda3
> > vgcfgrestore -n YourVGName /dev/hda4
> > vgscan
> > vgchange -ay
> 
> What I did, from .bash_history
> rm -rf /etc/lvmtab /etc/lvmtab.d /dev/pvg # I had backed up already.
> ~/LVM/1.0.3/tools/vgscan
> ~/LVM/1.0.3/pvcreate -yff /dev/hda[34]
> vgcfgrestore -n pvg /dev/hda3
> vgcfgrestore -n pvg /dev/hda4
> ~/uuid_fixer/uuid_fixer /dev/hda3 /dev/hda4
> ~/LVM/1.0.3/tools/vgscan
> ~/LVM/1.0.3/tools/vgchange -ay
> mount -treiserfs /dev/pvg/1 /mnt/dat
> 
> Don't know how much of that was needed...

All of that probably.
uuid_fixer covers a bug in older vgcfgrestore versions which prevented correct
restores of the PV UUID tables to all PVs.

> 
> I had been playing with snapshots recently, but they didn't seem to work
> with my ancient (2.4.3) kernel. Could that have been the cause?

In case you haven't patched in the newest LVM driver code following the 
instrcutions in PATCHES/README contained in the LVM distro -> yes.

> 
> Thanks!
>     Bill
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
