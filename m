From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvcreate distributed extent option
Message-ID: <20021203121104.B25215@sistina.com>
References: <615A249B783CD41192F400D0B747AC860898265A@hesse.bbn.hp.com> <3DE8D816.E84D4D82@adelphia.net>
Mime-Version: 1.0
In-Reply-To: <3DE8D816.E84D4D82@adelphia.net>; from tkb9@adelphia.net on Sat, Nov 30, 2002 at 10:24:06AM -0500
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
Date: Tue Dec  3 05:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Nov 30, 2002 at 10:24:06AM -0500, toby wrote:
> "ZECHA,HOLGER (HP-Germany,ex1)" wrote:
> > 
> > Hello,
> > 
> > what do you mean with
> > > How about striping with the strip size equal to that of a logical extent?
> > 
> > Can you give an example for the lvcreate command.
> > 
> > The reason to do this is to distribute the disk I/O accross all disks. the
> > logical extent 1 is on disk1, logical extent 2 on disk 2 and so on.
> > This means during read of logical extent 1, the heade of the second disk can
> > already be moved to prepare to read logical extent 2.
> > 
> > This allows us to do more I/O's per second
> > 
> > Holger
> > 
> 
> 
> Once you create a striped lv, you cannot extend it by adding more disks. Current
> lvm version anyway.

That constraint doesn't exits any longer in LVM2/device-mapper
using the new LVM2 ondisk metadata format.

> 
> I wanted mine to be more flexible, so I first made a software raid set then made
> the pv on top of the raid. That was in Jan this year. Last week I doubled the
> size by adding another software raid set. I expanded two of the ext3 formatted
> lvs in the process.
> 
> Perhaps not the fastest system in terms of throughput, but quite convenient to
> resize.
> 
> 
> -tkb
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
