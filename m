From: "Justin Hamilton" <JHamilton@Earthling.Net>
Subject: RE: [linux-lvm] Ut-Oh! - I need MAJOR help.
Date: Tue, 19 Sep 2000 06:30:47 -0400
Message-ID: <NDBBKIEANAMHBNPAILKPAEOFCMAA.JHamilton@Earthling.Net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-reply-to: <20000919113108.A25747@srv.t-online.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@Sistina.com
Cc: linux-lvm@msede.com

Thanks for the info, gave it a go, but am still getting:

vgscan -- found inactive volume group "vg01"
vgscan -- reading data of volume group "vg01" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg01" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"

Is there any hope?

Thanks

Justin

-----Original Message-----
From: Heinz J. Mauelshagen [mailto:Heinz.Mauelshagen@t-online.de]
Sent: Tuesday, September 19, 2000 7:31 AM
To: Justin Hamilton
Cc: linux-lvm@msede.com
Subject: Re: [linux-lvm] Ut-Oh! - I need MAJOR help.

Hi Justin,

are all PVs of your vg01 online and accessable after your repairs?

If so, your VGDAs got screwed somehow (maybe heat problems screwed date)
and you need to use vgcfgrestore(8) to restore the recent consistent VGDA
backup
from /etc/lvmconf/ to your PVs like:

   vgcfgrestore -n vg01 -f /etc/lvmconf/vg01.conf /dev/PhysicalVolumeDevice

Repeat this step for all your PVs and try vgscan/vgchange again.

If none of your PEs got screwed too, you should be fine after this.
Nevertheless I am afraid that you will most likely face filesystem damage as
well, if you run your machine with seriuos CPU heat trouble for a longer
period
of time.

On Tue, Sep 19, 2000 at 01:17:18AM -0400, Justin Hamilton wrote:
> Just had my machine lock up after CPU Fan failure.  Anyway, after repairs,
a
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
> vgscan -- storing physical volume data of "vg02" in
"/etc/lvmtab.d/vg02.tmp"
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

... CUT ...
