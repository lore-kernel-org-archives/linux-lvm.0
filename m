From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] "umount" LVM stuff
Message-ID: <20030228122051.A9155@sistina.com>
References: <3E58E03E.3020401@machturtle.com> <20030223181304.V14285@zealot.blacknet.de> <3E5919A3.2010404@machturtle.com> <20030224021555.Y14285@zealot.blacknet.de> <20030224022433.Z14285@zealot.blacknet.de> <3E5A0961.80905@machturtle.com> <20030225162138.C832@sistina.com> <3E5CA74E.4030105@machturtle.com>
Mime-Version: 1.0
In-Reply-To: <3E5CA74E.4030105@machturtle.com>; from dcorbin@machturtle.com on Wed, Feb 26, 2003 at 06:38:54AM -0500
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
Date: Fri Feb 28 05:26:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 26, 2003 at 06:38:54AM -0500, David Corbin wrote:
> Heinz J . Mauelshagen wrote:
> 
> >Following this thread it kind of looks like you worked around
> >using LVM commands (i.e. removed a VG w/o using lvremove + vgremove).
> >
> >If so, not a good idea :(
> >  
> >
> Well, not to my knowledge I didn't.   But my knowledge of LVM is very 
> tiny.  All I remember doing was "vgchange -a n".
> 
> >What does pvscan list ?
> >  
> >
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/md0" of VG "vg0" [109.77 GB / 109.77 GB free]
> pvscan -- total: 1 [109.78 GB] / in use: 1 [109.78 GB] / in no VG: 0 [0]
> 
> >What does vgck say ?
> >
> vgck -- VGDA of "vg0" in lvmtab is consistent
> vgck -- VGDA of "vg0" on physical volume is consistent

This all looks ok.

Doesn't "vgchange -a y" bring your VG back ?
If not so, try "vgscan ; vgchange -ay".

Regards,
Heinz    -- The LVM Guy --


> 
> >
> >On Mon, Feb 24, 2003 at 07:00:33AM -0500, David Corbin wrote:
> >  
> >
> >>Goetz Bock wrote:
> >>
> >>    
> >>
<SNIP>
> >>Fundamentally, I'm building a critical data file server.  LVM has caused 
> >>me enough problems and delays, that I'm about ready to bypass it, saying 
> >>it is putting my data at risk.  Feel free to convince me otherwise.
> >>
> >>Thanks
> >>David
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>    
> >>
> >
> >  
> >
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
