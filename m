Date: Tue, 19 Sep 2000 11:31:08 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Ut-Oh! - I need MAJOR help.
Message-ID: <20000919113108.A25747@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <NDBBKIEANAMHBNPAILKPEEODCMAA.JHamilton@Earthling.Net>
Mime-Version: 1.0
In-Reply-To: <NDBBKIEANAMHBNPAILKPEEODCMAA.JHamilton@Earthling.Net>; from JHamilton@Earthling.Net on Tue, Sep 19, 2000 at 01:17:18AM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Justin Hamilton <JHamilton@Earthling.Net>
Cc: linux-lvm@msede.com


Hi Justin,

are all PVs of your vg01 online and accessable after your repairs?

If so, your VGDAs got screwed somehow (maybe heat problems screwed date)
and you need to use vgcfgrestore(8) to restore the recent consistent VGDA backup
from /etc/lvmconf/ to your PVs like:

   vgcfgrestore -n vg01 -f /etc/lvmconf/vg01.conf /dev/PhysicalVolumeDevice

Repeat this step for all your PVs and try vgscan/vgchange again.

If none of your PEs got screwed too, you should be fine after this.
Nevertheless I am afraid that you will most likely face filesystem damage as
well, if you run your machine with seriuos CPU heat trouble for a longer period
of time.

On Tue, Sep 19, 2000 at 01:17:18AM -0400, Justin Hamilton wrote:
> Just had my machine lock up after CPU Fan failure.  Anyway, after repairs, a
> reboot (and subsequent vgscan's) gives the following response:
> 
> [root@Voyager /root]# vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- found active volume group "vg02"
> vgscan -- reading data of volume group "vg02" from physical volume(s)
> vgscan -- inserting "vg02" into lvmtab
> vgscan -- backing up volume group "vg02"
> vgscan -- checking volume group name "vg02"
> vgscan -- checking volume group consistency of "vg02"
> vgscan -- checking existence of "/etc/lvmtab.d"
> vgscan -- making directory "/etc/lvmtab.d"
> vgscan -- storing volume group data of "vg02" in "/etc/lvmtab.d/vg02.tmp"
> vgscan -- storing physical volume data of "vg02" in "/etc/lvmtab.d/vg02.tmp"
> vgscan -- storing logical volume data of volume group "vg02" in
> "/etc/lvmtab.d/vg02.tmp"
> vgscan -- renaming "/etc/lvmtab.d/vg02.tmp" to "/etc/lvmtab.d/vg02"
> vgscan -- removing special files and directory for volume group "vg02"
> vgscan -- creating directory and group character special file for "vg02"
> vgscan -- creating block device special files for vg02
> vgscan -- found inactive volume group "vg01"
> vgscan -- reading data of volume group "vg01" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "vg01" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
> "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> 
> How screwed am I?
> 
> I've got reiserfs on the LV's, so recovering the data from the LV's should
> not be too big an issue.  What I need to know is how to rebuild the VG.
> 
> TIA
> 
> Justin Hamilton.

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
