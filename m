Message-ID: <3BE0350B.5060703@ti.com>
From: christian e <cej@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2.4.13ac5+lvm 1.0.1rc4 can it be done ??
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
Date: Wed Oct 31 11:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux lvm <linux-lvm@sistina.com>

Hi,all

I'm tearing my hair out here I can't seem to get this working..What's 
the right order to do this ?? Here's what I did:

* download 2.4.13

* applied ac5 patch

* downloaded 1.0.1rc4 lvm and did a make in PATCHES dir and pacth the 
kernel getting this:

Reversed (or previously applied) patch detected!  Assume -R? [n]

I answer 'n' assuming some of the patch is already in ac5..maybe all of 
it ?? How do I know what lvm is in this ac patch ??

* compiling the kernel gives:

drivers/md/mddev.o: In function `lvm_init':
drivers/md/mddev.o(.text+0x86): undefined reference to `lvm_init_fs'
drivers/md/mddev.o(.text+0x9a): undefined reference to `gendisk_head'
drivers/md/mddev.o(.text+0xd8): undefined reference to `gendisk_head'
drivers/md/mddev.o: In function `lvm_cleanup':
drivers/md/mddev.o(.text+0x168): undefined reference to `gendisk_head'
drivers/md/mddev.o(.text+0x1bc): undefined reference to `lvm_fin_fs'
drivers/md/mddev.o: In function `lvm_do_vg_create':
drivers/md/mddev.o(.text+0x1d96): undefined reference to `lvm_fs_create_vg'
drivers/md/mddev.o: In function `lvm_do_vg_rename':
drivers/md/mddev.o(.text+0x22ec): undefined reference to `lvm_fs_remove_vg'
drivers/md/mddev.o(.text+0x2493): undefined reference to `lvm_fs_create_vg'
drivers/md/mddev.o: In function `lvm_do_vg_remove':
drivers/md/mddev.o(.text+0x24f9): undefined reference to `lvm_fs_remove_vg'
drivers/md/mddev.o: In function `lvm_do_pv_create':
drivers/md/mddev.o(.text+0x2705): undefined reference to `lvm_fs_create_pv'
drivers/md/mddev.o: In function `lvm_do_pv_remove':
drivers/md/mddev.o(.text+0x2744): undefined reference to `lvm_fs_remove_pv'
drivers/md/mddev.o: In function `lvm_do_lv_create':
drivers/md/mddev.o(.text+0x30b4): undefined reference to `lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_do_lv_remove':
drivers/md/mddev.o(.text+0x31b3): undefined reference to `lvm_fs_remove_lv'
drivers/md/mddev.o: In function `lvm_do_lv_rename':
drivers/md/mddev.o(.text+0x429e): undefined reference to `lvm_fs_remove_lv'
drivers/md/mddev.o(.text+0x42c1): undefined reference to `lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_snapshot_alloc':
drivers/md/mddev.o(.text+0x4f2d): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0x4f5e): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0x4fa5): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0x4fcc): undefined reference to `free_kiovec'
drivers/md/mddev.o: In function `lvm_snapshot_release':
drivers/md/mddev.o(.text+0x5073): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0x50aa): undefined reference to `free_kiovec'


I thought I'd seen this posted before,but havent seen a patch to fix 
it..Someone must've succeeded in getting it to work with 2.4.13 right ?? :-)

best regards

Christian

-- 
Christian Ejstrup, IT Admin / RF Development Engineer
Texas Instruments A/S, Denmark ,Sofiendalsvej 93,DK-9200 Aalborg SV,Denmark
Phone:+45 96346868, Phone(direct):+45 96346860, GSM:+45 22234304
