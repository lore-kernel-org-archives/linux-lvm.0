Message-ID: <3FBC1F53.7090002@wanadoo.es>
From: Xose Vazquez Perez <xose@wanadoo.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Inconsistent LVM code in 2.4.23-rc1
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
Date: Thu Nov 20 07:20:09 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

James G. Sack (jim)  wrote:

> 1587,1588c1587
> < 	if (minor >= ABS_MAX_VG) {
> < 		kfree(vg_ptr);
> ---
>> 	if (minor >= ABS_MAX_VG)
> 1590d1588
> < 	}
> 1658c1656,1657
> < 				goto copy_fault;
> ---
>> 				lvm_do_vg_remove(minor);
>> 				return -EFAULT;
> 1669c1668,1669
> < 				goto copy_fault;
> ---
>> 				lvm_do_vg_remove(minor);
>> 				return -EFAULT;
> 1679c1679,1680
> < 			goto copy_fault;
> ---
>> 			lvm_do_vg_remove(minor);
>> 			return -EFAULT;
> 1682c1683,1684
> < 			goto copy_fault;
> ---
>> 			lvm_do_vg_remove(minor);
>> 			return -EFAULT;
> 1697,1700d1698
> < copy_fault:
> < 	lvm_do_vg_remove(minor);
> < 	vfree(snap_lv_ptr);
> < 	return -EFAULT;

I believe that these changes were done in *kernel lvm_1.0.5+* release.

> 2597c2595
> < 		vg_ptr->pe_allocated -= old_lv->lv_allocated_le;
> ---
>> 		vg_ptr->pe_allocated -= old_lv->lv_allocated_snapshot_le;
> 2598a2597
>> 		old_lv->lv_allocated_snapshot_le = new_lv->lv_allocated_le;

rest are 1.0.7 -> 1.0.8 'official' changes

I sent to marcelo a diff 1.0.7 kernel version vs 1.0.8 sistina last days
-- 
HTML mails are going to trash automagically
