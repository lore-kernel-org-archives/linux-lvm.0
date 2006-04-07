Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k379XxXD021175
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 05:33:59 -0400
Received: from achilles.nodens.net (ns5.nodens.net [210.193.7.169])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k379XuTi016037
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 05:33:57 -0400
Received: from vanpogi (sandz.com.ph [202.164.176.234] (may be forged))
	(authenticated bits=0)
	by achilles.nodens.net (8.12.10/8.12.10) with ESMTP id k379Xnt8014765
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 17:33:53 +0800
From: "van" <giovanni_brillantes@sandz.com>
Date: Fri, 7 Apr 2006 17:38:38 +0800
Message-ID: <AJEHJACFPNAEAKCDDDBCCEIPCBAA.giovanni_brillantes@sandz.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0014_01C65A6A.1A833F00"
Subject: [linux-lvm] error in compiling lvm module
Reply-To: giovanni_brillantes@sandz.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_0014_01C65A6A.1A833F00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


gud day, am new with lvm and i have error in compiling(making bzImage) lvm
on redhat ES 2.1(2.4.9-e.12) . the error is pasted below..hope anyone can
help me on this thanks in advance


drivers/md/mddev.o: In function `add_gendisk':
drivers/md/mddev.o(.text+0x5832): undefined reference to `gendisk_head'
drivers/md/mddev.o(.text+0x5879): undefined reference to `gendisk_head'
drivers/md/mddev.o: In function `del_gendisk':
drivers/md/mddev.o(.text+0x5892): undefined reference to `gendisk_head'
drivers/md/mddev.o: In function `lvm_init':
drivers/md/mddev.o(.text+0x5961): undefined reference to `lvm_init_fs'
drivers/md/mddev.o: In function `lvm_cleanup':
drivers/md/mddev.o(.text+0x5a2b): undefined reference to `lvm_fin_fs'
drivers/md/mddev.o: In function `lvm_do_vg_create':
drivers/md/mddev.o(.text+0x76c0): undefined reference to `lvm_fs_create_vg'
drivers/md/mddev.o: In function `lvm_do_vg_rename':
drivers/md/mddev.o(.text+0x7c80): undefined reference to `lvm_fs_remove_vg'
drivers/md/mddev.o(.text+0x7e84): undefined reference to `lvm_fs_create_vg'
drivers/md/mddev.o(.text+0x7ec0): undefined reference to `lvm_fs_create_pv'
drivers/md/mddev.o(.text+0x7f22): undefined reference to `lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_do_vg_remove':
drivers/md/mddev.o(.text+0x7fbb): undefined reference to `lvm_fs_remove_vg'
drivers/md/mddev.o: In function `lvm_do_pv_create':
drivers/md/mddev.o(.text+0x81de): undefined reference to `lvm_fs_create_pv'
drivers/md/mddev.o: In function `lvm_do_pv_remove':
drivers/md/mddev.o(.text+0x8218): undefined reference to `lvm_fs_remove_pv'
drivers/md/mddev.o: In function `lvm_do_lv_create':
drivers/md/mddev.o(.text+0x8ba8): undefined reference to `lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_do_lv_remove':
drivers/md/mddev.o(.text+0x8ce7): undefined reference to `lvm_fs_remove_lv'
drivers/md/mddev.o: In function `lvm_do_lv_rename':
drivers/md/mddev.o(.text+0x9d1c): undefined reference to `lvm_fs_remove_lv'
drivers/md/mddev.o(.text+0x9d3b): undefined reference to `lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_snapshot_alloc':
drivers/md/mddev.o(.text+0xaa31): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xaa64): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xaaa3): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xaaca): undefined reference to `free_kiovec'
drivers/md/mddev.o: In function `lvm_snapshot_release':
drivers/md/mddev.o(.text+0xab65): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xab9a): undefined reference to `free_kiovec'
make[1]: *** [kallsyms] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.9-e.12'
make: *** [vmlinux] Error 2








thnx




------=_NextPart_000_0014_01C65A6A.1A833F00
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
AAALAFWACCAGAAAAAADAAAAAAAAARgAAAAAGhQAAAAAAAAMAVoAIIAYAAAAAAMAAAAAAAABGAAAA
AAGFAAAAAAAAAgH4DwEAAAAQAAAA2byqYFQKCUeQJSS4oENnGAIB+g8BAAAAEAAAANm8qmBUCglH
kCUkuKBDZxgCAfsPAQAAAJ8AAAAAAAAAOKG7EAXlEBqhuwgAKypWwgAAUFNUUFJYLkRMTAAAAAAA
AAAATklUQfm/uAEAqgA32W4AAABDOlxEb2N1bWVudHMgYW5kIFNldHRpbmdzXHZhbi5TQU5EWkZT
MDFcTG9jYWwgU2V0dGluZ3NcQXBwbGljYXRpb24gRGF0YVxNaWNyb3NvZnRcT3V0bG9va1xvdXRs
b29rLnBzdAAAAwD+DwUAAAADAA00/TcAAAIBfwABAAAAPQAAADxBSkVISkFDRlBOQUVBS0NERERC
Q0NFSVBDQkFBLmdpb3Zhbm5pX2JyaWxsYW50ZXNAc2FuZHouY29tPgAAAAADAAYQvbcEJwMABxDR
CAAAAwAQEAAAAAADABEQAAAAAB4ACBABAAAAZQAAAEdVRERBWSxBTU5FV1dJVEhMVk1BTkRJSEFW
RUVSUk9SSU5DT01QSUxJTkcoTUFLSU5HQlpJTUFHRSlMVk1PTlJFREhBVEVTMjEoMjQ5LUUxMilU
SEVFUlJPUklTUEFTVEVEQkUAAAAAGlU=

------=_NextPart_000_0014_01C65A6A.1A833F00--
