From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20031119120702.I28265@sistina.com>
References: <3FBA6614.357049F8@inostor.com>
Mime-Version: 1.0
In-Reply-To: <3FBA6614.357049F8@inostor.com>; from jsack@inostor.com on Tue, Nov 18, 2003 at 10:33:56AM -0800
Subject: [linux-lvm] Re: Inconsistent LVM code in 2.4.23-rc1
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
Date: Wed Nov 19 05:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James G. Sack (jim)" <jsack@inostor.com>
Cc: linux-lvm@sistina.com, Mauelshagen@sistina.com

On Tue, Nov 18, 2003 at 10:33:56AM -0800, James G. Sack (jim) wrote:
> [Hope this reaches the right place -- I'm not on any list  -- please
> reply/cc direct]
> 
> Linux kernel 2.4.23-rc1 has LVM patched code that differs from LVM 1.0.8
> (as well as cvs HEAD) from sistina.com
> 
> Q: is the 2.4.23 code OK?

Yes, use the code in mainline.

>   if yes, should it be in cvs

Yes.

Will check code differences and get back to Marcelo if necessary.

Regards,
Heinz    -- The LVM Guy --


>   if no, should somebody tell Marcelo?
> 
> 
> 
> In essance, there are extra calls to vfree(snap_lv_ptr) at 4 places in
> lvm_do_vg_create() by virtue of a "goto copy_fault" --AND-- what looks
> like a correction to vg_ptr->pe_allocated 
> 
> A simple diff looks like
> ------------------------
> 1587,1588c1587
> < 	if (minor >= ABS_MAX_VG) {
> < 		kfree(vg_ptr);
> ---
> > 	if (minor >= ABS_MAX_VG)
> 1590d1588
> < 	}
> 1658c1656,1657
> < 				goto copy_fault;
> ---
> > 				lvm_do_vg_remove(minor);
> > 				return -EFAULT;
> 1669c1668,1669
> < 				goto copy_fault;
> ---
> > 				lvm_do_vg_remove(minor);
> > 				return -EFAULT;
> 1679c1679,1680
> < 			goto copy_fault;
> ---
> > 			lvm_do_vg_remove(minor);
> > 			return -EFAULT;
> 1682c1683,1684
> < 			goto copy_fault;
> ---
> > 			lvm_do_vg_remove(minor);
> > 			return -EFAULT;
> 1697,1700d1698
> < copy_fault:
> < 	lvm_do_vg_remove(minor);
> < 	vfree(snap_lv_ptr);
> < 	return -EFAULT;
> 2597c2595
> < 		vg_ptr->pe_allocated -= old_lv->lv_allocated_le;
> ---
> > 		vg_ptr->pe_allocated -= old_lv->lv_allocated_snapshot_le;
> 2598a2597
> > 		old_lv->lv_allocated_snapshot_le = new_lv->lv_allocated_le;
> ---------------------------------------------------------------------------
> 
> Regards,
> ..jim

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
