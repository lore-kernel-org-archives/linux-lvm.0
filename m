From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LE/PE Question
Message-ID: <20021122220736.A15173@sistina.com>
References: <E18EFOt-0001Qf-00@hermes.sistina.com> <20021121115752.B8329@sistina.com> <448380000.1037896711@[192.168.200.4]> <20021122103810.A12967@sistina.com> <658450000.1037989977@[192.168.200.4]>
Mime-Version: 1.0
In-Reply-To: <658450000.1037989977@[192.168.200.4]>; from lembark@wrkhors.com on Fri, Nov 22, 2002 at 12:32:57PM -0600
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
Date: Fri Nov 22 15:49:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 22, 2002 at 12:32:57PM -0600, Steven Lembark wrote:
> 
> 
> -- "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> 
> >> The unit of failure, for all pratical purposes, is the LV
> >> (unless you are into using dd on raw disk devices to make
> >> your backups). If one drive is likely to fail then any LV
> >> crossing that LV is going to get fried (short of RAID) and
> >> will have to be restored.
> >
> > With LVM2 (and deprecated LVM1.1) you are able to activate a VG even
> > though some of its PVs are inaccessable.
> > If any filesystem is mountable still depends on the availability
> > of alternate superblocks and (at least) the root directory.
> 
> Which seems to mean that the unit of failure still is
> the LV: if an LV spans PV's and the PV looses data then
> the LV is unusable.

Yes, the unit of (partial) failure is the LV.
Point is, that the LV still might be partially accessable.

> The VG being able to survive an offline
> PV is a Very Good Thing but doesn't do anything to help
> someone with a filesystem on an LV with half its extents
> missing.

Well, that very much depends on _which_ extents are actually missing and
what filesystem metadata and data they contain.

I.e. if those containing (alternate) superblocks _and_ the root directory are
accessable still, user might be very happy to be able to retrieve that partial
filesystem. In particular if his updated critical files not backed up last
night are still retrievable.

Regards,
Heinz    -- The LVM Guy --

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
