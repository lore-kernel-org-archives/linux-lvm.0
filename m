From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: Recovering inconsistent vg
Message-ID: <20020605152904.GN1061@tykepenguin.com>
References: <20020605003728.GA3783@continuum.cm.nu> <20020605172356.A15163@babbage.hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020605172356.A15163@babbage.hcsd.de>
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
Date: Wed Jun  5 10:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jun 05, 2002 at 05:23:56PM +0200, Stephan Austermuehle wrote:
> Hi,
> 
> I've the same problem. The VG was originally created with LVM 1.0.4,
> then used (and extended) with 1.1rc1. Now I've the problem after
> downgrading to 1.0.4.
> 
> 	# ./vgscan
> 	vgscan -- ERROR "lv_check_consistency(): LV status" volume group "vg00" is inconsistent
> 	vgscan -- ERROR: unable to do a backup of volume group "vg00"
> 	vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "vg00" from "/etc/lvmtab"
> 	vgscan -- reading all physical volumes (this may take a while...)
> 	vgscan -- found active volume group "vg00"
> 	vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> 	vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> Stephan
> 

yeah, it's a bug in 1.1 which is fixed in the debian patched 1.0.4-4. If you
built from source here's the workaround:


diff -u -r1.4 -r1.4.2.1
--- lv_check_consistency.c      7 Feb 2002 16:19:46 -0000       1.4
+++ lv_check_consistency.c      5 Jun 2002 10:12:01 -0000       1.4.2.1
@@ -42,6 +42,9 @@
 
    debug_enter ( "lv_check_consistency -- CALLED\n");
 
+   /* Don't barf on broken LVM1.1 created metadata */
+   if (lv->lv_status > 2) lv->lv_status = 1;
+
    if ( lv == NULL)                                   ret = -LVM_EPARAM;
    else if ( lv_check_name ( lv->lv_name) != 0)       ret = -LVM_ELV_LVNAME;
    else if ( vg_check_name ( lv->vg_name) != 0)       ret = -LVM_ELV_VGNAME;


patrick
