Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2IETXj14072
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 09:29:33 -0500
Message-ID: <34310.62.200.65.42.1079620164.squirrel@linux.mfservis.cz>
Date: Thu, 18 Mar 2004 15:29:24 +0100 (CET)
From: psindelar@mfservis.cz
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LV crossover problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I have problem with LVM 1.0.3 (shipped with Rh 7.3).
I have 2 VGs, one is at FC FASTt200 shared with 2nd node (it's cluster
configuration 2nodes, LifeKeeper on top of it).
On this VG I have 14 LV....it all worked like a charm until yesterday. 3
lv isn't active (info from /proc/lvm/global) but mount and df
reports,that all fs are mounted. Those three lv's are mixed together with
another 3 lv's in this way: in both mount points are all files form
originating lv and from the crosse one. df reports whole size for the
activated fs but used size is cumulated from both fs.

All filesystems is ext3.

It happend once but after reboot all was back (so fs "splitted") without
any error message. I can't fin any error message which could enlighten me
whats wrong and what I should repair (reboots and takeover to 2nd node
doesn't help).

Is this known bug? Should I try leave RH's lvm and try LVM 1.0.8 from
sistina? Am I risking something?


Thanks
Petr Sindelar

***

IBM xSeries (Xeon with HT)
Node configuration: rh7.3, lk 4.3.0 (lkDb2,lkLVM)
Kernel: 2.4.18-5custom (custom ips driver and imbasm)
---
cat /proc/lvm/global (only 2nd VG pasted here)

VG:  db2vg  [2 PV, 14 LV/11 open]  PE Size: 4096 KB
  Usage [KB/PE]: 143269888 /34978 total  73756672 /18007 used  69513216
/16971 free
  PVs: [AA] sdc1                  71634944 /17489   45404160 /11085
26230784 /6404
       [AA] sdd1                  71634944 /17489   28352512 /6922
43282432 /10567
    LVs: [AWDL  ] db2dump_lv                 2097152 /512      close
         [AWDL  ] log_archive_lv            11534336 /2816     close [AWDL
 ] log_dir_lv                 6082560 /1485     close [AWDL  ]
db2_lv                      524288 /128      1x open
(mixed with db2dump_lv)
         [AWDL  ] pdata1_lv                  8388608 /2048     1x open
(mixed with log_archive_lv)
         [AWDL  ] pindex1_lv                 4194304 /1024     1x open
(mixed with log_dir_lv)
         [AWDL  ] sdata1_lv                  8388608 /2048     1x open
[AWDL  ] sindex1_lv                 4194304 /1024     1x open
[AWDL  ] ocs_log_dir_lv             6291456 /1536     1x open
[AWDL  ] ocs_pdata1_lv              5242880 /1280     1x open
[AWDL  ] ocs_pindex1_lv             2662400 /650      1x open
[AWDL  ] sid_log_dir_lv             6291456 /1536     1x open
[AWDL  ] sid_pdata1_lv              5242880 /1280     1x open
[AWDL  ] sid_pindex1_lv             2621440 /640      1x open
---
lvscan:

lvscan -- ACTIVE            "/dev/db2vg/db2dump_lv" [2 GB]
lvscan -- ACTIVE            "/dev/db2vg/log_archive_lv" [11 GB]
lvscan -- ACTIVE            "/dev/db2vg/log_dir_lv" [5.80 GB]
lvscan -- ACTIVE            "/dev/db2vg/db2_lv" [512 MB]
lvscan -- ACTIVE            "/dev/db2vg/pdata1_lv" [8 GB]
lvscan -- ACTIVE            "/dev/db2vg/pindex1_lv" [4 GB]
lvscan -- ACTIVE            "/dev/db2vg/sdata1_lv" [8 GB]
lvscan -- ACTIVE            "/dev/db2vg/sindex1_lv" [4 GB]
lvscan -- ACTIVE            "/dev/db2vg/ocs_log_dir_lv" [6 GB]
lvscan -- ACTIVE            "/dev/db2vg/ocs_pdata1_lv" [5 GB]
lvscan -- ACTIVE            "/dev/db2vg/ocs_pindex1_lv" [2.54 GB]
lvscan -- ACTIVE            "/dev/db2vg/sid_log_dir_lv" [6 GB]
lvscan -- ACTIVE            "/dev/db2vg/sid_pdata1_lv" [5 GB]
lvscan -- ACTIVE            "/dev/db2vg/sid_pindex1_lv" [2.50 GB]
lvscan -- 17 logical volumes with 101.94 GB total in 2 volume groups
lvscan -- 17 active logical volumes
---
df -k
/dev/db2vg/db2_lv       507748     26655    454879   6% /db2
/dev/db2vg/db2dump_lv
                        507748     26655    454879   6%
/db2/db2inst1/etatm/db2dump
/dev/db2vg/log_archive_lv
                       8256952   5288880   2548644  68%
/db2/db2inst1/etatm/log_archive
/dev/db2vg/log_dir_lv
                       4128448   3629416    289320  93%
/db2/db2inst1/etatm/log_dir
/dev/db2vg/pdata1_lv   8256952   5288880   2548644  68%
/db2/db2inst1/etatm/pdata1
/dev/db2vg/pindex1_lv
                       4128448   3629416    289320  93%
/db2/db2inst1/etatm/pindex1
/dev/db2vg/sdata1_lv   8256952   5280840   2556684  68%
/db2/db2inst1/etatm/sdata1
/dev/db2vg/sindex1_lv
                       4128448   3181632    737104  82%
/db2/db2inst1/etatm/sindex1
/dev/db2vg/ocs_log_dir_lv
                       6192704    298640   5579492   6%
/db2/db2inst1/ocs/log_dir
/dev/db2vg/ocs_pdata1_lv
                       5160576   2132032   2766400  44%
/db2/db2inst1/ocs/pdata1
/dev/db2vg/ocs_pindex1_lv
                       2620520   2132032    355368  86%
/db2/db2inst1/ocs/pindex1
/dev/db2vg/sid_log_dir_lv
                       6192704    594256   5283876  11%
/db2/db2inst1/sid/log_dir
/dev/db2vg/sid_pdata1_lv
                       5160576   2132032   2766400  44%
/db2/db2inst1/sid/pdata1
/dev/db2vg/sid_pindex1_lv
                       2580272   2132032    317168  88%
/db2/db2inst1/sid/pindex1


---
mount: (pasted only interesting part)

/dev/db2vg/db2_lv on /db2 type ext3 (rw)
/dev/db2vg/db2dump_lv on /db2/db2inst1/etatm/db2dump type ext3 (rw)
/dev/db2vg/log_archive_lv on /db2/db2inst1/etatm/log_archive type ext3 (rw)
/dev/db2vg/log_dir_lv on /db2/db2inst1/etatm/log_dir type ext3 (rw)
/dev/db2vg/pdata1_lv on /db2/db2inst1/etatm/pdata1 type ext3 (rw)
/dev/db2vg/pindex1_lv on /db2/db2inst1/etatm/pindex1 type ext3 (rw)
/dev/db2vg/sdata1_lv on /db2/db2inst1/etatm/sdata1 type ext3 (rw)
/dev/db2vg/sindex1_lv on /db2/db2inst1/etatm/sindex1 type ext3 (rw)
/dev/db2vg/ocs_log_dir_lv on /db2/db2inst1/ocs/log_dir type ext3 (rw)
/dev/db2vg/ocs_pdata1_lv on /db2/db2inst1/ocs/pdata1 type ext3 (rw)
/dev/db2vg/ocs_pindex1_lv on /db2/db2inst1/ocs/pindex1 type ext3 (rw)
/dev/db2vg/sid_log_dir_lv on /db2/db2inst1/sid/log_dir type ext3 (rw)
/dev/db2vg/sid_pdata1_lv on /db2/db2inst1/sid/pdata1 type ext3 (rw)
/dev/db2vg/sid_pindex1_lv on /db2/db2inst1/sid/pindex1 type ext3 (rw)
