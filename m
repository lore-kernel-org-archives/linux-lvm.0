Return-Path: <root@srv.sistina.com>
Date: Tue, 26 Jun 2001 12:14:58 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove error
Message-ID: <20010626121458.A25838@sistina.com>
References: <Pine.LNX.4.20.0106252205300.24553-200000@dixie.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.20.0106252205300.24553-200000@dixie.dyndns.org>; from scott@dixie.dyndns.org on Mon, Jun 25, 2001 at 10:08:19PM -0400
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

On Mon, Jun 25, 2001 at 10:08:19PM -0400, S. Michael Denton wrote:
> Hello,
> 
> The attached log is of a pvmove -d -v /dev/hdd1:extent /dev/hdb1:extent,
> where the source extent is the last pe on /dev/hdd1.  I want to move this
> extent off the drive for performance reasons, but it refuses to move.  The
> error also makes me wonder if I could even use that pe, since it seems to
> be smaller than lvm is expecting.

Michael,

this is caused by an alignment bug which has been fixed in the last couple
of days and only showed up in specific disk sizes.

> Is there a fix for this?

No, I am sorry. Not so far.

I am a little bit confused.
You mention above, that you want to move the last PE away for performance
reasons so I assume that it is already used. If so and the misalignment bug
caused an invalid PE size for that very last PE you ant to move, you should
already have seen trouble accessing it (like FS errors).
If not so, the FS likely hasn't stored (meta)data in that PE which can't lead
to performance bottlenecks on that PE.

Anyway; the workaround for your problem is (presumed you have enough free
        temporary disk space):

- get LVM 1.0 once we release it (hopefully tonight :-) which has
  fixes for the alignment bug and install it
- create as many new PVs as needed to create a new LV of the size of the
  LV containing the PE in questions
- extent your VG by those
- create a new LV (the destination) with the same size of the one
  in question (the source)
- close the source
- dd the source over to the destination (which might expose I/O errors on
  the last PE; do partital dd up to the end of the device then and
  restart a dd from the next LE in the logical address space of the LV
  after it
- test the destination
- remove the source
- rename the destination to the sources name (if necessary)

Eventually you should do the above for all PVs which might have misaligned PEs
in order to make sure that the error doesn't ocur again later while you try
to pvmove your data.

We don't have hard data so far, if many users have that misalignment
problem because it doesn't happen with *all* PV sizes.

People who didn't create PVs with LVM 0.9.1 Beta[67] don't suffer from
the problem anyway!

Regards,
Heinz    -- The LVM Guy --


> 
> Thanks.
> 
> Scott Denton
> smdenton@bellsouth.net

Content-Description: pvmove.err
> <1> lvm_get_col_numbers -- CALLED
> <22> lvm_check_number -- CALLED with "502"
> <22> lvm_check_number -- LEAVING with ret: 502
> <1> lvm_get_col_numbers -- LEAVING
> <1> pv_check_name -- CALLED with "/dev/hdd1"
> <22> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <1> pv_check_name -- LEAVING with ret: 0
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_lock -- LEAVING with ret: 0
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_dont_interrupt -- LEAVING
> <1> pv_read -- CALLED with /dev/hdd1
> <22> pv_check_name -- CALLED with "/dev/hdd1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <22> pv_read_already_red -- CALLED with PV /dev/hdd1
> <22> pv_read_already_red -- LEAVING with ret: 0
> <22> pv_flush -- CALLED to flush /dev/hdd1
> <333> pv_check_name -- CALLED with "/dev/hdd1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <22> pv_flush -- LEAVING with ret: 0
> <1> pv_read -- going to read /dev/hdd1
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_copy_from_disk -- CALLED
> <22> pv_copy_from_disk -- LEAVING
> <22> pv_create_name_from_kdev_t -- CALLED with 22:65
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> lvm_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <333> lvm_dir_cache -- LEAVING with ret: 18
> <22> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdd1
> <22> system_id_check_exported -- CALLED
> <22> system_id_check_exported -- LEAVING with ret: 0
> <1> pv_read -- LEAVING with ret: 0
> <1> pv_check_consistency -- CALLED
> <22> pv_check_name -- CALLED with "/dev/hdd1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_new -- CALLED
> <22> pv_check_new -- LEAVING with ret: 0
> <1> pv_check_consistency -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- CALLED with vg_name: "rootvg"
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> lvm_tab_read -- CALLED
> <22> lvm_tab_read -- LEAVING with ret: 0  data: 80641C0  size: 15
> <22> vg_cfgrestore -- CALLED
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdd1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/swaplv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/swaplv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/varlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/varlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/optlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/optlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/homelv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/homelv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/usrlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/usrlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/mp3lv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/mp3lv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/apachelv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/apachelv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/doslv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/doslv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/cdburnlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/cdburnlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/isolv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/isolv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> vg_setup_pointers_for_snapshots -- CALLED
> <333> vg_setup_pointers_for_snapshots -- LEAVING
> <333> vg_check_consistency_with_pv_and_lv -- CALLED
> <4444> vg_check_consistency -- CALLED
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> vg_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- CALLED
> <55555> vg_check_consistency -- CALLED
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> vg_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/hdb1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/hdc1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/hdd1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <4444> lv_check_consistency_all_lv -- vg->lv[0]: 8068990  name: /dev/rootvg/swaplv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/swaplv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/swaplv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[1]: 8068BC8  name: /dev/rootvg/varlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/varlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/varlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[2]: 8068FE8  name: /dev/rootvg/optlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/optlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/optlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[3]: 8069B88  name: /dev/rootvg/homelv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/homelv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/homelv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[4]: 806A278  name: /dev/rootvg/usrlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/usrlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/usrlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[5]: 806BFE8  name: /dev/rootvg/mp3lv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/mp3lv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/mp3lv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[7]: 8076228  name: /dev/rootvg/apachelv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/apachelv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/apachelv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[8]: 8077468  name: /dev/rootvg/doslv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/doslv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/doslv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[9]: 80776A0  name: /dev/rootvg/cdburnlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/cdburnlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/cdburnlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[10]: 8078550  name: /dev/rootvg/isolv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/isolv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/isolv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
> <22> vg_cfgrestore -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- before vg.pv_cur check with vg.pv_cur: 3  pv_count: 3
> <22> vg_free -- CALLED
> <22> vg_free -- entering PV loop
> <22> vg_free -- entering LV loop
> <22> vg_free -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- LEAVING with ret: 1
> <1> lvm_tab_vg_read_with_pv_and_lv -- CALLED vg_name: rootvg
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> vg_cfgrestore -- CALLED
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdd1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/swaplv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/swaplv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/varlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/varlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/optlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/optlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/homelv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/homelv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/usrlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/usrlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/mp3lv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/mp3lv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/apachelv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/apachelv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/doslv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/doslv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/cdburnlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/cdburnlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/isolv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/isolv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> vg_setup_pointers_for_snapshots -- CALLED
> <333> vg_setup_pointers_for_snapshots -- LEAVING
> <333> vg_check_consistency_with_pv_and_lv -- CALLED
> <4444> vg_check_consistency -- CALLED
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> vg_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- CALLED
> <55555> vg_check_consistency -- CALLED
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> vg_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/hdb1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/hdc1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/hdd1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <4444> lv_check_consistency_all_lv -- vg->lv[0]: 8068990  name: /dev/rootvg/swaplv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/swaplv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/swaplv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[1]: 8068BC8  name: /dev/rootvg/varlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/varlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/varlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[2]: 8068FE8  name: /dev/rootvg/optlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/optlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/optlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[3]: 8069B88  name: /dev/rootvg/homelv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/homelv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/homelv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[4]: 806A278  name: /dev/rootvg/usrlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/usrlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/usrlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[5]: 806BFE8  name: /dev/rootvg/mp3lv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/mp3lv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/mp3lv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[7]: 8076228  name: /dev/rootvg/apachelv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/apachelv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/apachelv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[8]: 8077468  name: /dev/rootvg/doslv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/doslv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/doslv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[9]: 80776A0  name: /dev/rootvg/cdburnlv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/cdburnlv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/cdburnlv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[10]: 8078550  name: /dev/rootvg/isolv
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/rootvg/isolv"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rootvg/isolv"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED with VG: rootvg
> <88888888> lvm_check_chars -- CALLED with name: "rootvg"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED with VG: rootvg
> <7777777> lvm_check_chars -- CALLED with name: "rootvg"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
> <22> vg_cfgrestore -- LEAVING with ret: 0
> <1> lvm_tab_vg_read_with_pv_and_lv -- LEAVING with ret: 0
> <1> vg_check_consistency_with_pv_and_lv -- CALLED
> <22> vg_check_consistency -- CALLED
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_check_consistency -- LEAVING with ret: 0
> <22> pv_check_consistency_all_pv -- CALLED
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdd1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <22> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <22> lv_check_consistency_all_lv -- vg->lv[0]: 8068990  name: /dev/rootvg/swaplv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/swaplv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/swaplv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[1]: 8068BC8  name: /dev/rootvg/varlv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/varlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/varlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[2]: 8068FE8  name: /dev/rootvg/optlv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/optlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/optlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[3]: 8069B88  name: /dev/rootvg/homelv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/homelv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/homelv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[4]: 806A278  name: /dev/rootvg/usrlv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/usrlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/usrlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[5]: 806BFE8  name: /dev/rootvg/mp3lv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/mp3lv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/mp3lv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[7]: 8076228  name: /dev/rootvg/apachelv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/apachelv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/apachelv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[8]: 8077468  name: /dev/rootvg/doslv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/doslv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/doslv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[9]: 80776A0  name: /dev/rootvg/cdburnlv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/cdburnlv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/cdburnlv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[10]: 8078550  name: /dev/rootvg/isolv
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/rootvg/isolv"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rootvg/isolv"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- LEAVING with ret: 0
> <1> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
> <1> pv_get_index_by_name -- CALLED
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> pv_check_name -- CALLED with "/dev/hdd1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <1> pv_get_index_by_name -- LEAVING with ret: 2
> <1> lvm_get_col_numbers -- CALLED
> <22> lvm_check_number -- CALLED with "168"
> <22> lvm_check_number -- LEAVING with ret: 168
> <1> lvm_get_col_numbers -- LEAVING
> <1> pv_check_name -- CALLED with "/dev/hdb1"
> <22> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <1> pv_check_name -- LEAVING with ret: 0
> <1> pv_read -- CALLED with /dev/hdb1
> <22> pv_check_name -- CALLED with "/dev/hdb1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <22> pv_read_already_red -- CALLED with PV /dev/hdb1
> <22> pv_read_already_red -- LEAVING with ret: 0
> <22> pv_flush -- CALLED to flush /dev/hdb1
> <333> pv_check_name -- CALLED with "/dev/hdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <22> pv_flush -- LEAVING with ret: 0
> <1> pv_read -- going to read /dev/hdb1
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_copy_from_disk -- CALLED
> <22> pv_copy_from_disk -- LEAVING
> <22> pv_create_name_from_kdev_t -- CALLED with 3:65
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> lvm_dir_cache -- CALLED
> <333> lvm_dir_cache -- LEAVING with ret: 18
> <22> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb1
> <22> system_id_check_exported -- CALLED
> <22> system_id_check_exported -- LEAVING with ret: 0
> <1> pv_read -- LEAVING with ret: 0
> <1> pv_check_consistency -- CALLED
> <22> pv_check_name -- CALLED with "/dev/hdb1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_new -- CALLED
> <22> pv_check_new -- LEAVING with ret: 0
> <1> pv_check_consistency -- LEAVING with ret: 0
> <1> pv_check_in_vg -- CALLED
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> pv_check_name -- CALLED with "/dev/hdb1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <22> pv_get_index_by_name -- CALLED
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> pv_check_name -- CALLED with "/dev/hdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <22> pv_get_index_by_name -- LEAVING with ret: 0
> <1> pv_check_in_vg -- LEAVING with ret: 1
> <1> pv_get_index_by_name -- CALLED
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> pv_check_name -- CALLED with "/dev/hdb1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <1> pv_get_index_by_name -- LEAVING with ret: 0
> <1> vg_check_active -- CALLED with VG: rootvg
> <22> vg_check_name -- CALLED with VG: rootvg
> <333> lvm_check_chars -- CALLED with name: "rootvg"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> vg_status -- CALLED with VG: rootvg
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_status -- LEAVING with ret: 0
> <1> vg_check_active -- LEAVING with ret: 1
> <1> pv_move_pes -- CALLED
> <22> vg_check_consistency -- CALLED
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_check_consistency -- LEAVING with ret: 0
> <22> pv_get_index_by_name -- CALLED
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> pv_check_name -- CALLED with "/dev/hdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <22> pv_get_index_by_name -- LEAVING with ret: 0
> <22> pv_get_index_by_name -- CALLED
> <333> vg_check_name -- CALLED with VG: rootvg
> <4444> lvm_check_chars -- CALLED with name: "rootvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> pv_check_name -- CALLED with "/dev/hdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <22> pv_get_index_by_name -- LEAVING with ret: 0
> <22> lv_check_on_pv -- CALLED
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_on_pv -- LEAVING with ret: 1
> <22> lvm_dont_interrupt -- CALLED
> <22> lvm_dont_interrupt -- LEAVING
> <22> pv_move_interrupt -- CALLED
> <22> pv_move_interrupt -- LEAVING
> <22> pv_move_pe -- CALLED
> <333> lv_check_on_pv -- CALLED
> <4444> pv_check_consistency -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/hdb1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/hdb1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_new -- CALLED
> <55555> pv_check_new -- LEAVING with ret: 0
> <4444> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_on_pv -- LEAVING with ret: 1
> <333> lv_check_on_pv -- CALLED
> <4444> pv_check_consistency -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/hdd1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/hdd1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: rootvg
> <666666> lvm_check_chars -- CALLED with name: "rootvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_new -- CALLED
> <55555> pv_check_new -- LEAVING with ret: 0
> <4444> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_on_pv -- LEAVING with ret: 1
> <333> lv_get_name -- CALLED
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_get_name -- LEAVING with /dev/rootvg/mp3lv
> <333> lv_get_name -- CALLED
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_get_name -- LEAVING with /dev/rootvg/mp3lv
> <333> basename -- CALLED with path: "/dev/rootvg/mp3lv"
> <333> basename -- LEAVING with ret: "mp3lv"
> <333> pe_lock_internal -- CALLED for rootvg
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> pe_lock_internal -- LEAVING with ret: 0
> pvmove -- ERROR reading input physical volume "/dev/hdd1" (still 65536 bytes to read)
> 
> <333> pe_lock_internal -- CALLED for rootvg
> <4444> vg_check_name -- CALLED with VG: rootvg
> <55555> lvm_check_chars -- CALLED with name: "rootvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> pe_lock_internal -- LEAVING with ret: 0
> <22> pv_move_pe -- LEAVING with ret: -253
> <22> lvm_error -- CALLED with: -253
> <22> lvm_error -- LEAVING with: "pv_move_pe(): read input PV"
> pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
> 
> <1> pv_move_pes -- LEAVING with ret: -253
> <1> lvm_error -- CALLED with: -253
> <1> lvm_error -- LEAVING with: "pv_move_pe(): read input PV"
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> 
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
> pvmove -- checking name of source physical volume "/dev/hdd1"
> pvmove -- locking logical volume manager
> pvmove -- reading data of source physical volume from "/dev/hdd1"
> pvmove -- checking volume group existence
> pvmove -- reading data of volume group "rootvg" from lvmtab
> pvmove -- checking volume group consistency of "rootvg"
> pvmove -- searching for source physical volume "/dev/hdd1" in volume group "rootvg"
> pvmove -- building list of possible destination physical volumes
> pvmove -- checking destination physical volume names in command line
> pvmove -- checking volume group activity
> pvmove -- moving physical extents in active volume group "rootvg"
> pvmove -- starting to move extents away from physical volume "/dev/hdd1"
> pvmove -- checking for enough free physical extents in "rootvg"
> pvmove -- /dev/hdd1 [PE 502 [mp3lv [LE 2517]] -> /dev/hdb1 [PE 168] [1/1]

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
