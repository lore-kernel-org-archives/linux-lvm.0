From: Stephan Austermuehle <au@hcsd.de>
Message-ID: <20020605172356.A15163@babbage.hcsd.de>
References: <20020605003728.GA3783@continuum.cm.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020605003728.GA3783@continuum.cm.nu>; from shane@cm.nu on Tue, Jun 04, 2002 at 05:37:28PM -0700
Subject: [linux-lvm] Re: Recovering inconsistent vg
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
Date: Wed Jun  5 10:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I've the same problem. The VG was originally created with LVM 1.0.4,
then used (and extended) with 1.1rc1. Now I've the problem after
downgrading to 1.0.4.

	# ./vgscan
	vgscan -- ERROR "lv_check_consistency(): LV status" volume group "vg00" is inconsistent
	vgscan -- ERROR: unable to do a backup of volume group "vg00"
	vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "vg00" from "/etc/lvmtab"
	vgscan -- reading all physical volumes (this may take a while...)
	vgscan -- found active volume group "vg00"
	vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
	vgscan -- WARNING: This program does not do a VGDA backup of your volume group

Stephan

On Tue, Jun 04, 2002 at 05:37:28PM -0700, Shane Wegner wrote:
> Hi all,
> 
> I'm not sure how this happened but after rebooting, I am
> getting the following from vgscan.
> continuum:~# vgscan
> vgscan -- reading all physical volumes (this may take a
> while...)
> vgscan -- found inactive volume group "vg0"
> vgscan -- ERROR "lv_check_consistency(): LV status" volume
> group "vg0" is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group
> "vg0"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing
> volume group "vg0" from "/etc/lvmtab"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully
> created
> vgscan -- WARNING: This program does not do a VGDA backup
> of your volume group
> 
> I have no idea what this means, what I can do to recover
> and am hoping someone could help me out.  A pvscan yeilds:
> 
> continuum:~# pvscan
> pvscan -- reading all physical volumes (this may take a
> while...)
> pvscan -- inactive PV "/dev/hdi1"  is associated to unknown
> VG "vg0" (run vgscan)
> pvscan -- inactive PV "/dev/hde1"  is associated to unknown
> VG "vg0" (run vgscan)
> pvscan -- inactive PV "/dev/hda1"  is associated to unknown
> VG "vg0" (run vgscan)
> pvscan -- total: 3 [215.74 GB] / in use: 3 [215.74 GB] / in
> no VG: 0 [0]
> 
> Looks right to me.  vg0 is hda1, hde1, and hdi1.
> 
> Thanks in advance,
> Shane
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
