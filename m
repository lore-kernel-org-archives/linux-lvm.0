Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9F52gOd012587
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2013 01:02:42 -0400
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9F52d2f020985
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2013 01:02:39 -0400
Received: by mail-oa0-f46.google.com with SMTP id g12so969997oah.33
	for <linux-lvm@redhat.com>; Mon, 14 Oct 2013 22:02:39 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 15 Oct 2013 13:02:38 +0800
Message-ID: <CAHuLeS=H3X0e3yV9_Z3-jSPYcp33QfPC=tqFXNEdsLHHZ+xeQA@mail.gmail.com>
From: Justin Lee <justinlee5455@gmail.com>
Subject: [linux-lvm] vgcfgrestore crashed, for double free or corruption,
 after some hot swapping of HDDs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

*****  Here is the message when vgcfgrestore crashed:

[root@localhost tmp]# vgcfgrestore -f
/var/lib/3gen/lvm_mirror.vg_hur.metadata.vg vh_hur
  /dev/md0: read failed after 0 of 2048 at 0: Input/output error
  /dev/md0: read failed after 0 of 2048 at 600125931520: Input/output error
  /dev/md0: read failed after 0 of 2048 at 600126033920: Input/output error
  /dev/md0: read failed after 0 of 2048 at 4096: Input/output error
  /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 214748299264:
Input/output error
  /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 214748356608:
Input/output error
  /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 0: Input/output error
  /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 4096: Input/output error
  Couldn't find device with uuid 5sNFQj-9DrG-abBO-cKnP-rP7g-i9Lc-47rpfX.
  '/var/lib/3gen/lvm_mirror.vg_hur.metadata.vg' does not contain
volume group 'vh_hur'.
*** glibc detected *** vgcfgrestore: double free or corruption
(!prev): 0x0000000001ed0620 ***
======= Backtrace: =========
/lib64/libc.so.6(+0x75146)[0x7ffcdf999146]
/lib64/libdevmapper.so.1.02(dm_pool_destroy+0x29)[0x7ffcdff07c59]
vgcfgrestore(backup_read_vg+0x9e)[0x44820e]
vgcfgrestore(backup_restore_from_file+0xe)[0x44858e]
vgcfgrestore(vgcfgrestore+0x24e)[0x42b91e]
vgcfgrestore(lvm_run_command+0xb38)[0x41b328]
vgcfgrestore(lvm2_main+0x402)[0x41dbd2]
/lib64/libc.so.6(__libc_start_main+0xfd)[0x7ffcdf942cdd]
vgcfgrestore[0x4115a9]
======= Memory map: ========
00400000-004c1000 r-xp 00000000 fd:00 89741
  /sbin/lvm
006c1000-006c8000 rw-p 000c1000 fd:00 89741
  /sbin/lvm
006c8000-006d0000 rw-p 00000000 00:00 0
01e7f000-01f0a000 rw-p 00000000 00:00 0                                  [heap]
7ffcdf50b000-7ffcdf521000 r-xp 00000000 fd:00 182277
  /usr/lib64/libgcc_s.so.1
7ffcdf521000-7ffcdf720000 ---p 00016000 fd:00 182277
  /usr/lib64/libgcc_s.so.1
7ffcdf720000-7ffcdf721000 rw-p 00015000 fd:00 182277
  /usr/lib64/libgcc_s.so.1
7ffcdf721000-7ffcdf724000 r-xp 00000000 fd:00 24461
  /lib64/libtermcap.so.2.0.8
7ffcdf724000-7ffcdf923000 ---p 00003000 fd:00 24461
  /lib64/libtermcap.so.2.0.8
7ffcdf923000-7ffcdf924000 rw-p 00002000 fd:00 24461
  /lib64/libtermcap.so.2.0.8
7ffcdf924000-7ffcdfaaa000 r-xp 00000000 fd:00 24555
  /lib64/libc-2.12.so
7ffcdfaaa000-7ffcdfca9000 ---p 00186000 fd:00 24555
  /lib64/libc-2.12.so
7ffcdfca9000-7ffcdfcad000 r--p 00185000 fd:00 24555
  /lib64/libc-2.12.so
7ffcdfcad000-7ffcdfcae000 rw-p 00189000 fd:00 24555
  /lib64/libc-2.12.so
7ffcdfcae000-7ffcdfcb3000 rw-p 00000000 00:00 0
7ffcdfcb3000-7ffcdfce8000 r-xp 00000000 fd:00 182141
  /usr/lib64/libreadline.so.5.2
7ffcdfce8000-7ffcdfee8000 ---p 00035000 fd:00 182141
  /usr/lib64/libreadline.so.5.2
7ffcdfee8000-7ffcdfef0000 rw-p 00035000 fd:00 182141
  /usr/lib64/libreadline.so.5.2
7ffcdfef0000-7ffcdfef1000 rw-p 00000000 00:00 0
7ffcdfef1000-7ffcdff16000 r-xp 00000000 fd:00 24549
  /lib64/libdevmapper.so.1.02
7ffcdff16000-7ffce0116000 ---p 00025000 fd:00 24549
  /lib64/libdevmapper.so.1.02
7ffce0116000-7ffce0118000 rw-p 00025000 fd:00 24549
  /lib64/libdevmapper.so.1.02
7ffce0118000-7ffce011d000 r-xp 00000000 fd:00 24551
  /lib64/libdevmapper-event.so.1.02
7ffce011d000-7ffce031c000 ---p 00005000 fd:00 24551
  /lib64/libdevmapper-event.so.1.02
7ffce031c000-7ffce031d000 rw-p 00004000 fd:00 24551
  /lib64/libdevmapper-event.so.1.02
7ffce031d000-7ffce031f000 r-xp 00000000 fd:00 24766
  /lib64/libdl-2.12.so
7ffce031f000-7ffce051f000 ---p 00002000 fd:00 24766
  /lib64/libdl-2.12.so
7ffce051f000-7ffce0520000 r--p 00002000 fd:00 24766
  /lib64/libdl-2.12.so
7ffce0520000-7ffce0521000 rw-p 00003000 fd:00 24766
  /lib64/libdl-2.12.so
7ffce0521000-7ffce052f000 r-xp 00000000 fd:00 24761
  /lib64/libudev.so.0.7.0
7ffce052f000-7ffce072e000 ---p 0000e000 fd:00 24761
  /lib64/libudev.so.0.7.0
7ffce072e000-7ffce072f000 rw-p 0000d000 fd:00 24761
  /lib64/libudev.so.0.7.0
7ffce072f000-7ffce074e000 r-xp 00000000 fd:00 24503
  /lib64/ld-2.12.so
7ffce07dc000-7ffce07dd000 rw-p 00000000 00:00 0
7ffce07dd000-7ffce081c000 r--p 00000000 fd:00 40818
  /usr/lib/locale/en_US.utf8/LC_CTYPE
7ffce081c000-7ffce093a000 r--p 00000000 fd:00 40821
  /usr/lib/locale/en_US.utf8/LC_COLLATE
7ffce093a000-7ffce093f000 rw-p 00000000 00:00 0
7ffce0943000-7ffce0944000 r--p 00000000 fd:00 40797
  /usr/lib/locale/en_US.utf8/LC_NUMERIC
7ffce0944000-7ffce0945000 r--p 00000000 fd:00 48959
  /usr/lib/locale/en_US.utf8/LC_TIME
7ffce0945000-7ffce0946000 r--p 00000000 fd:00 48962
  /usr/lib/locale/en_US.utf8/LC_MONETARY
7ffce0946000-7ffce0947000 r--p 00000000 fd:00 42815
  /usr/lib/locale/en_US.utf8/LC_MESSAGES/SYS_LC_MESSAGES
7ffce0947000-7ffce0948000 r--p 00000000 fd:00 40871
  /usr/lib/locale/en_US.utf8/LC_PAPER
7ffce0948000-7ffce0949000 r--p 00000000 fd:00 40967
  /usr/lib/locale/en_US.utf8/LC_NAME
7ffce0949000-7ffce094a000 r--p 00000000 fd:00 48963
  /usr/lib/locale/en_US.utf8/LC_ADDRESS
7ffce094a000-7ffce094b000 r--p 00000000 fd:00 42812
  /usr/lib/locale/en_US.utf8/LC_TELEPHONE
7ffce094b000-7ffce094c000 r--p 00000000 fd:00 40870
  /usr/lib/locale/en_US.utf8/LC_MEASUREMENT
7ffce094c000-7ffce094d000 r--p 00000000 fd:00 48960
  /usr/lib/locale/en_US.utf8/LC_IDENTIFICATION
7ffce094d000-7ffce094e000 rw-p 00000000 00:00 0
7ffce094e000-7ffce094f000 r--p 0001f000 fd:00 24503
  /lib64/ld-2.12.so
7ffce094f000-7ffce0950000 rw-p 00020000 fd:00 24503
  /lib64/ld-2.12.so
7ffce0950000-7ffce0951000 rw-p 00000000 00:00 0
7fffd6535000-7fffd654a000 rw-p 00000000 00:00 0                          [stack]
7fffd65ff000-7fffd6600000 r-xp 00000000 00:00 0                          [vdso]
ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0
  [vsyscall]
Aborted
[root@localhost tmp]#
[root@localhost tmp]#
[root@localhost tmp]#
[root@localhost tmp]#
[root@localhost tmp]#
[root@localhost tmp]# cat /var/lib/3gen/lvm_mirror.vg_hur.metadata.vg
# Generated by LVM2 version 2.02.86(2) (2011-07-08): Mon Oct 14 15:01:41 2013

contents = "Text Format Volume Group"
version = 1

description = "Created *before* executing 'lvconvert --config
devices{ignore_suspended_devices=1} --repair --use-policies
vg_hur/lv_hur'"

creation_host = "localhost.localdomain"    # Linux
localhost.localdomain 2.6.32.57 #106 SMP Tue Jul 9 14:35:24 PDT 2013
x86_64
creation_time = 1381734101    # Mon Oct 14 15:01:41 2013

vg_hur {
    id = "q6jzVB-q9o2-lZcw-D6Dl-xp7F-iCug-B4lRCz"
    seqno = 4
    status = ["RESIZEABLE", "READ", "WRITE"]
    flags = []
    extent_size = 65536        # 32 Megabytes
    max_lv = 0
    max_pv = 0
    metadata_copies = 0

    physical_volumes {

        pv0 {
            id = "2ZVQ7F-keRI-CJgV-aX3i-WqAD-9OIa-WoIur0"
            device = "unknown device"    # Hint only

            status = ["ALLOCATABLE"]
            flags = []
            dev_size = 1320353725    # 629.594 Gigabytes
            pe_start = 2048
            pe_count = 20146    # 629.562 Gigabytes
        }

        pv1 {
            id = "5sNFQj-9DrG-abBO-cKnP-rP7g-i9Lc-47rpfX"
            device = "/dev/md0"    # Hint only

            status = ["ALLOCATABLE"]
            flags = []
            dev_size = 1172121180    # 558.911 Gigabytes
            pe_start = 2048
            pe_count = 17885    # 558.906 Gigabytes
        }

        pv2 {
            id = "n517xc-9YNY-8QyG-MiSk-xjgZ-I7Rj-0EVUyw"
            device = "/dev/sda13"    # Hint only

            status = ["ALLOCATABLE"]
            flags = []
            dev_size = 1953124    # 953.674 Megabytes
            pe_start = 2053
            pe_count = 29    # 928 Megabytes
        }
    }

    logical_volumes {

        lv_hur {
            id = "wfUh83-cUtV-VrZN-23qe-Y5su-dm8g-67yhYv"
            status = ["READ", "WRITE", "VISIBLE"]
            flags = []
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 3200    # 100 Gigabytes

                type = "mirror"
                mirror_count = 2
                mirror_log = "lv_hur_mlog"
                region_size = 2048

                mirrors = [
                    "lv_hur_mimage_0", 0,
                    "lv_hur_mimage_1", 0
                ]
            }
        }

        lv_hur_mimage_0 {
            id = "fyfbhC-7xpH-a5RP-3KFL-FY0A-pIyp-ssw2BE"
            status = ["READ", "WRITE"]
            flags = []
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 3200    # 100 Gigabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv1", 0
                ]
            }
        }

        lv_hur_mimage_1 {
            id = "EbmINi-XXd3-tG5t-71XH-JuTK-wZp8-WE9bfG"
            status = ["READ", "WRITE"]
            flags = []
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 3200    # 100 Gigabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv0", 0
                ]
            }
        }

        lv_hur_mlog {
            id = "GBtQFi-5GQX-ZHJE-r5Q3-PdBI-VcyD-Fe54hF"
            status = ["READ", "WRITE"]
            flags = []
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 1    # 32 Megabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv2", 0
                ]
            }
        }
    }
}
[root@localhost tmp]#
[root@localhost tmp]#



*****  Other info. after the crash is here:

http://sites.google.com/site/justinlee5455/files/vgcfgrestore_crashed_for_double_free_or_corruption_after_some_hot_swapping_of_HDDs.extra_info.tbz2


Justin
