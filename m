From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problem with vgscan and md
Message-ID: <20021010142722.A27412@sistina.com>
References: <3DA455BD.4090208@comedia.it>
Mime-Version: 1.0
In-Reply-To: <3DA455BD.4090208@comedia.it>; from bluca@comedia.it on Wed, Oct 09, 2002 at 06:13:49PM +0200
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
Date: Thu Oct 10 07:29:42 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Luca,

I tried to reproduce this here with the 1.0.5 and failed.

1.0.5 vgscan only changes minors if there's minor # clashes _and_ if it
is run with option "-f" in order to keep minors persistent by default.

So I deativated all VGs and stopped the device for the first one.
There was no reason for vgscan to reallocate the device minors because
there's no clash. After starting the device again and running vgscan,
both VGs were accessable fine.

An automatic reallocation of device numbers took place in vgscan up
to version 1.0.
Maybe this is an older tool version?

Regards,
Heinz    -- The LVM Guy --

On Wed, Oct 09, 2002 at 06:13:49PM +0200, Luca Berra wrote:
> Hello,
> I found a probable bug in vgscan up to LVM 1.0.5 due to lv device nodes 
> renumbering
> 
> i found the problem in a shared storage environment, but it can be 
> reproduced on a single machine
> 
> the problem can be reproduced with 2 md devices
> create 2 vg each composed of 1 md device
> let's say
> VG /dev/vg00
> Device 109:0
> LV /dev/vg00/lvol1
> Device 58:0
> LV /dev/vg00/lvol2
> Device 58:1
> LV /dev/vg00/lvol3
> Device 58:2
> PV /dev/md0
> 
> VG /dev/vg01
> Device 109:1
> LV /dev/vg01/lvol1
> Device 58:3
> LV /dev/vg01/lvol2
> Device 58:4
> LV /dev/vg01/lvol3
> Device 58:5
> PV /dev/md1
> 
> now deactivate all VGs
> raidstop /dev/md0
> run vgscan -v
> 
> you have
> 
> VG /dev/vg01
> Device 109:0
> LV /dev/vg01/lvol1
> Device 58:0
> LV /dev/vg01/lvol2
> Device 58:1
> LV /dev/vg01/lvol3
> Device 58:2
> PV /dev/md1
> 
> vgchange -a y /dev/vg01
> 
> now raidstart /dev/md0
> 
> you need to run vgcan again, to see vg00
> 
> vgscan renumbers device node for vg00 so you get
> 
> VG /dev/vg00
> Device 109:0
> LV /dev/vg00/lvol1
> Device 58:0
> LV /dev/vg00/lvol2
> Device 58:1
> LV /dev/vg00/lvol3
> Device 58:2
> PV /dev/md0
> 
> vgscan cannot renumber device nodes for vg01 (which is active) so you 
> also get
> 
> VG /dev/vg01
> Device 109:0
> LV /dev/vg01/lvol1
> Device 58:0
> LV /dev/vg01/lvol2
> Device 58:1
> LV /dev/vg01/lvol3
> Device 58:2
> PV /dev/md1
> 
> so we got two DIFFERENT vgs with the SAME device files
> 
> the need to run vgscan is due to having a shared storage so i might want 
> to activate the md devices and vg devices on different nodes
> 
> Regards,
> Luca
> 
> 
> -- 
> Luca Berra -- bluca@comedia.it
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
