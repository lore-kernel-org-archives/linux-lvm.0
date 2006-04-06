Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k369BeqV003132
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 05:11:40 -0400
From: "van" <giovanni_brillantes@sandz.com>
Date: Thu, 6 Apr 2006 17:16:04 +0800
Message-ID: <AJEHJACFPNAEAKCDDDBCOEIMCBAA.giovanni_brillantes@sandz.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0002_01C6599D.C915BB60"
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0002_01C6599D.C915BB60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

gud day, i have error in compiling(making bzImage) lvm on redhat AS
2.1(2.4.9-e.12smp) . the error is pasted below..hope anyone can help me on
this thanks in advance


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


Van Brillantes l Sandz Solutions (Philippines), Inc. | 26th floor, yuchengco
tower, rcbc plaza | ayala avenue corner sen. gil puyat avenue | makati city,
1200 philippines | hp: +63 927-8729206 | tel: +63-2-888-5757 | fax:
+63-2-887-1383



------=_NextPart_000_0002_01C6599D.C915BB60
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
AAA5LjAAHgAKgAggBgAAAAAAwAAAAAAAAEYAAAAANoUAAAEAAAABAAAAAAAAAB4AC4AIIAYAAAAA
AMAAAAAAAABGAAAAADeFAAABAAAAAQAAAAAAAAAeAAyACCAGAAAAAADAAAAAAAAARgAAAAA4hQAA
AQAAAAEAAAAAAAAACwANgAggBgAAAAAAwAAAAAAAAEYAAAAAgoUAAAEAAAALADqACCAGAAAAAADA
AAAAAAAARgAAAAAOhQAAAAAAAAMAPIAIIAYAAAAAAMAAAAAAAABGAAAAABGFAAAAAAAAAwA9gAgg
BgAAAAAAwAAAAAAAAEYAAAAAGIUAAAAAAAALAFWACCAGAAAAAADAAAAAAAAARgAAAAAGhQAAAAAA
AAMAVoAIIAYAAAAAAMAAAAAAAABGAAAAAAGFAAAAAAAAAgH4DwEAAAAQAAAA2byqYFQKCUeQJSS4
oENnGAIB+g8BAAAAEAAAANm8qmBUCglHkCUkuKBDZxgCAfsPAQAAAJ8AAAAAAAAAOKG7EAXlEBqh
uwgAKypWwgAAUFNUUFJYLkRMTAAAAAAAAAAATklUQfm/uAEAqgA32W4AAABDOlxEb2N1bWVudHMg
YW5kIFNldHRpbmdzXHZhbi5TQU5EWkZTMDFcTG9jYWwgU2V0dGluZ3NcQXBwbGljYXRpb24gRGF0
YVxNaWNyb3NvZnRcT3V0bG9va1xvdXRsb29rLnBzdAAAAwD+DwUAAAADAA00/TcAAAIBfwABAAAA
PQAAADxBSkVISkFDRlBOQUVBS0NERERCQ09FSU1DQkFBLmdpb3Zhbm5pX2JyaWxsYW50ZXNAc2Fu
ZHouY29tPgAAAAADAAYQFHAY+QMABxCFCQAAAwAQEAAAAAADABEQAAAAAB4ACBABAAAAZQAAAEdV
RERBWSxJSEFWRUVSUk9SSU5DT01QSUxJTkcoTUFLSU5HQlpJTUFHRSlMVk1PTlJFREhBVEFTMjEo
MjQ5LUUxMlNNUClUSEVFUlJPUklTUEFTVEVEQkVMT1dIT1BFQU5ZT04AAAAA2Mc=

------=_NextPart_000_0002_01C6599D.C915BB60--
