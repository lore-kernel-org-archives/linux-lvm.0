From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LE/PE Question
Message-ID: <20021122103810.A12967@sistina.com>
References: <E18EFOt-0001Qf-00@hermes.sistina.com> <20021121115752.B8329@sistina.com> <448380000.1037896711@[192.168.200.4]>
Mime-Version: 1.0
In-Reply-To: <448380000.1037896711@[192.168.200.4]>; from lembark@wrkhors.com on Thu, Nov 21, 2002 at 10:38:31AM -0600
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
Date: Fri Nov 22 03:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 21, 2002 at 10:38:31AM -0600, Steven Lembark wrote:
> 
> 
> -- "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> 
> > On Tue, Nov 19, 2002 at 09:50:39PM +0100, kalle@idlar.nu wrote:
> >> Hi!
> >>
> >> Im researching some diffrent what-if-scenarios to be more prepared if
> >> our lvm fails. and I'm wondering..Is there any utility to find which
> >> file (or fs inode) a specific LE/PE is assigned to?
> >
> ># lvdisplay -v /dev/YourVG/YourLV # displays mapping logical -> physical
> ># extents lvdisplay -v /dev/YourPV # displays mapping physical -> logical
> ># extents
> >
> >>   What I would like to acomplish it to be able to know what files are
> >>   located on a specific disk in a
> >>
> >> VG/LV. So if I detect that a disk in a LV is starting to fail I would
> >> like to know which files are more
> >>
> >> likely to be non-recoverable.
> >
> > You need to 'ask' the filesystem, where it puts stuff ;)
> > I.e. "debugfs /dev/YourVG/YourLV" for ext[23].
> 
> The unit of failure, for all pratical purposes, is the LV
> (unless you are into using dd on raw disk devices to make
> your backups). If one drive is likely to fail then any LV
> crossing that LV is going to get fried (short of RAID) and
> will have to be restored.

With LVM2 (and deprecated LVM1.1) you are able to activate a VG even though
some of its PVs are inaccessable.
If any filesystem is mountable still depends on the availability
of alternate superblocks and (at least) the root directory.

> 
> 
> 
> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                             +1 800 762 1582
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
