Date: Wed, 5 Sep 2001 19:36:00 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20010905193600.A23151@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Trouble: Shortened LV and vgscan fails...
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

I've hit some problem...

I've (had?) one PV (one large partition on a 100GB Maxtor HDD) which
made up one VG, called data_vg usind a PE size of 1GB.. In this VG I
had so far one LV, called data_lv, using all but one PE of data_vg.

I wanted to make this LV smaller (-= 8PEs), using e2fsadm, but this
failed. The LV was still there, so I mounted it and the FS was
of the right (shortened) size, but after a reboot, vgscan fails.
Any hint on how to reactivate the VG?

MfG, JBG

# ------ short version -------
mirror:~# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "data_vg"
vgscan -- only found 83 of 82 LEs for LV /dev/data_vg/data_lv (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "data_vg" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"


Long Version: http://dvmwest.gt.owl.de/~jbglaw/lvm-error.txt

# ------ long version snipplets -------
[...]
<22> pv_read_all_pe_of_vg -- /dev/hda1 with 92 PE at address 804CB88
[...]
<22> lv_read_all_lv -- BEFORE pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "data_vg"
<4444> vg_check_name -- CALLED with VG: data_vg
<55555> lvm_check_chars -- CALLED with name: "data_vg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<22> lv_read_all_lv -- l: 255  nl: 1  vg_this->lv_cur: 1
<22> lv_read_all_lv -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 1  vg_this->pv_max: 255  ret: 0
<1> vg_read_with_pv_and_lv -- BEFORE for PE
<1> vg_read_with_pv_and_lv -- AFTER for PE
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 82
vgscan -- only found 83 of 82 LEs for LV /dev/data_vg/data_lv (0)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -365
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "data_vg" from physical volume(s)
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

-- 
Jan-Benedict Glaw . jbglaw@lug-owl.de . +49-172-7608481
