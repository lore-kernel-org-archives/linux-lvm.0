From: Paul Furness <paul.furness@vil.ite.mee.com>
Message-Id: <1047381740.16925.116.camel@Zebra.vil.ite.mee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How big are PEs by default?
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
Date: Tue Mar 11 05:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

I'm trying to get LVM 1.0.7 going on our new production server. I've
never used LVM before, but based on reccommendations and looking at what
it can do, it looks like exactly what I need.

For the reccord, it's a SMP Xeon system, running RedHat 7.3 plus current
RH patches.

I am confused about the defualt setting for Physical Extents when you
run vgcreate on a new PV. 

Looking through the man page for vgcreate is says this:

       -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
              Sets  the  physical extent size on physical volumes
              of this volume group. ................. The default
              of 32 MB allows LV sizes of ~2TB because as many as
              ~64k  extents  are supported per LV.

A bit later, under "Examples." it says this:

       To create a volume group named test_vg using physical vol-
       umes /dev/hdk1,  /dev/hdl1,  and  /dev/hdm1  with  default
       physical extent size of 4MB:

            vgcreate test_vg /dev/sd[k-m]1


So what is the default? 4M or 32M? Or something else? Or should I simply
forget about the default and pick a number?

Finally, is there any documentation that's more detailed than the HOWTO,
and explains a bit more about the theory of LVM - what happens when you
change the size of existing file systems, and so on? The HowTo is ok
(although not all that great if you've never patched a kernel before),
but necessarily brief. :)


Thanks.

Paul.




-- 
Paul Furness

Systems Manager
Visual Information Lab
Mitsubsihi Electric ITE BV
Guildford, UK

Steepness is an illusion caused by flat things leaning over.
