From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pecopy or lecopy
Message-ID: <20020524164815.A16749@sistina.com>
References: <20020417013928.I27907@progsoc.uts.edu.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
In-Reply-To: <20020417013928.I27907@progsoc.uts.edu.au>; from wildfire@progsoc.uts.edu.au on Wed, Apr 17, 2002 at 01:39:28AM +1000
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
Date: Fri May 24 11:26:15 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii


Hi Anand.

On Wed, Apr 17, 2002 at 01:39:28AM +1000, Anand Kumria wrote:
> Hi there,
> 
> Quite some time ago, Heinz assisted me with a partial recovery of
> data from one of my LVM volumes. In the meantime I've managed to
> reconstruct a lot of it but have discovered there are one or two
> items I need to get back from the original.
> 
> I'm using LVM tool 1.1rc1 reports:
> caliban:~# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "caliban"
> vgscan -- only found 11364 of 11520 LEs for LV /dev/caliban/h2
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> If I try and mount the h2 filesystem my kernel opps as the first 150
> PE<->LE mappings don't exist. Has anyone written a tool that copies
> either PEs or LEs from disk without mounting the affected partition?

Not that I am aware if.

A tool to extract accessable LEs of a LV basically needs to:

- run "lvdisplay -Dv /dev/caliban/h2" in order to retrieve all
  physical volumes and extents of the LV

- pvdisplay -v on all of the PVs to get the mapping and run
  dd commands for every extend which name the output files per le

Attached script, which *needs* 1.1-rc tools to run, tries this:

Tell me, if it is of any use for you.

Regards,
Heinz    -- The LVM Guy --

> 
> That would allow me to salvage more of the data. I'm at the point where
> writing the code myself is an option if only I got some pointers. I'm
> unclear on where the mapping from LE<->PE<->disk blocks is stored. Plus
> I'm finding it confusing trying to see which version of the on-disk metadata
> LVM is using.
> 
> Thanks,
> Anand
> 
> -- 
>  `` We are shaped by our thoughts, we become what we think.
>  When the mind is pure, joy follows like a shadow that never
>  leaves. '' -- Buddha, The Dhammapada
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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

--dDRMvlgZJXvWKvBx
Content-Type: application/x-sh
Content-Disposition: attachment; filename="save_les.sh"

#!/bin/sh
#
# (C)opyleft  Heinz Mauelshagen 2002, Sistina Software Inc.
#
# Quick tool hack to retrieve as many logical extents of a logical volume
# as possible from a volume group without quorum.
#
# Run "save_les LogicalVolumePath"
#
# Stores every logical extent found in a sperate file named after the
# logical extent number in the actual directory.
#
# Needs >= LVM 1.1-rc* tools to run successfully.
#

if [ $# -ne 1 ]
then
	echo -e "Please provide a logical volume path\n" >&2
	exit 1
fi

LV=$1

PVS=$(lvdisplay -Dv $LV | sed -n 's/^ \{1,\}\(\/[^ ]\{1,\}\).*$/\1/p')
for pv in $PVS
do
	BS=$(pvdisplay $pv|sed -n 's/^pe size[^0-9]\{1,\}\([0-9]\{1,\}\) *$/\1/ip')
	let BS=BS*2
	break
done

for pv in $PVS
do
	pvdisplay -v $pv | sed -n "s?^ \{1,\}[0-9]\{5\} \{1,\}$LV \{1,\}\([0-9]\{5\}\) \{1,\}\([0-9]\{5\}\)?dd if=$pv of=\1 skip=\2 ibs=512 count=$BS?p" | while read cmd
	do
		echo $cmd | grep '\?'
		if [ $? -ne 0 ]
		then
			echo $cmd
			$cmd
		fi
	done
done

--dDRMvlgZJXvWKvBx--
