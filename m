From: Urs Thuermann <urs@isnogud.escape.de>
Message-Id: <m21yfgo3vd.fsf@isnogud.escape.de>
Subject: [linux-lvm] kernel-Oops in 2.4.17 with LVM-1.0.2
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
Date: Wed Feb 20 04:20:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

When using the LV_BMAP ioctl with an out-of-range block number, the
kernel oopes in drviers/md/lvm.c:lvm_map().

The check in lvm_map() for out-of-range sector number works correctly,
and the corresponding message is written to the kernel logs.

	if (rsector_org + size > lv->lv_size) {
		printk(KERN_ALERT
		       "%s - lvm_map access beyond end of device; *rsector: "
                       "%lu or size: %lu wrong for minor: %2d\n",
                       lvm_name, rsector_org, size, minor);
		goto bad;
	}

After the "goto bad;" the Oops seems to be buffer_IO_error(bh).

 bad:
	buffer_IO_error(bh);
	up_read(&lv->lv_lock);
	return -1;

When using the LV_BMAP ioctl, lvm_map is called from lvm_user_bmap(),
to which the system call does not return because of the oops.

	if ((err=lvm_map(&bh, READ)) < 0)  {
		printk("lvm map failed: %d\n", err);
		return -EINVAL;
	}

The "lvm map failed..." error message is not logged.


Here is the oops from the kernel.  It was produced by ioctl(LV_BMAP)
on a LV of 128MB (262144) sectors, with lbm.lv_block = 131072.

    isnogud kernel: lvm - lvm_map access beyond end of device; *rsector: 262144 or size: 2 wrong for minor:  0
    isnogud kernel: Unable to handle kernel NULL pointer dereference@virtual address 00000000
    isnogud kernel:  printing eip:
    isnogud kernel: 00000000
    isnogud kernel: *pde = 00000000
    isnogud kernel: Oops: 0000
    isnogud kernel: CPU:    0
    isnogud kernel: EIP:    0010:[<00000000>]    Not tainted
    isnogud kernel: EFLAGS: 00010246
    isnogud kernel: eax: 00000000   ebx: c939df00   ecx: c939c000   edx: c939df00
    isnogud kernel: esi: 00000000   edi: c939df60   ebp: c939df00   esp: c939de9c
    isnogud kernel: ds: 0018   es: 0018   ss: 0018
    isnogud kernel: Process lvm-map (pid: 18809, stackpage=c939d000)
    isnogud kernel: Stack: d0836640 c939df00 00000000 bffffad4 00040000 c939df60 c939df00 cf9ae2c0 
    isnogud kernel:        ca4c3820 cf9f2400 cf949000 400f0000 00000000 400f0550 cc6baca0 00000000 
    isnogud kernel:        c903a960 d08360ab c939df00 00000000 00003a00 bffffad4 00003a00 c3c94060 
    isnogud kernel: Call Trace: [8139too:__insmod_8139too_O/lib/modules/2.4.17-ut/kernel/drivers/net+-780736/96] [8139too:__insmod_8139too_O/lib/modules/2.4.17-ut/kernel/drivers/net+-782165/96] [8139too:__insmod_8139too_O/lib/modules/2.4.17-ut/kernel/drivers/net+-782740/96] [blkdev_ioctl+40/52] [sys_ioctl+363/388] 
    isnogud kernel:    [system_call+51/56] 
    isnogud kernel: 
    isnogud kernel: Code:  Bad EIP value.


urs
