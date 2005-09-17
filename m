Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8H8VaV07005
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 04:31:36 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.204])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8H8VTgK020126
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 04:31:29 -0400
Received: by zproxy.gmail.com with SMTP id m7so481412nzf
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 01:31:24 -0700 (PDT)
Message-ID: <95bbd19050917013169702266@mail.gmail.com>
Date: Sat, 17 Sep 2005 16:31:24 +0800
From: Bear Wolf <sportbear@gmail.com>
Subject: Re: [linux-lvm] new process dead after create multiple snapshot
	volumes
In-Reply-To: <95bbd190509170123538ba44a@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <95bbd190509111934b306235@mail.gmail.com>
	<20050912080543.GD25756@barkeeper1.linbit>
	<95bbd19050912014220e457b@mail.gmail.com>
	<95bbd1905091623272f7455ec@mail.gmail.com>
	<95bbd190509170123538ba44a@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Reply-To: sportbear@gmail.com,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

verbose log from console when created snapshot then process hang.
lvcreate -s -L64 -n s6 /dev/VG01/lv1

*************************************
.............
      Suspending VG01-s3-cow
        dm suspend VG01-s3-cow  N
      Suspending VG01-s1
        dm suspend VG01-s1  N
      Suspending VG01-s4
        dm suspend VG01-s4  N
      Suspending VG01-s2
        dm suspend VG01-s2  N
      Suspending VG01-lv1-real
        dm suspend VG01-lv1-real  N
      Suspending VG01-s1-cow
        dm suspend VG01-s1-cow  N
      Suspending VG01-s4-cow
        dm suspend VG01-s4-cow  N
      Suspending VG01-s2-cow
        dm suspend VG01-s2-cow  N
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7    145: NULL(0:0)
        Writing VG01 metadata to /dev/sda at 26624 len 3047
        Pre-Committing VG01 metadata (12) to /dev/sda header at 4096
        Committing VG01 metadata (12) to /dev/sda header at 4096
        Unlocking LV
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT
      Finding volume group for uuid
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT
      /dev/sda: lvm2 label detected
      /dev/sda: lvm2 label detected
        Read VG01 metadata (12) from /dev/sda at 26624 size 3047
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7    145: NULL(0:0)
    Found volume group "VG01"
        Getting device info for VG01-lv1
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT N
        dm names   O
        Found existing layer 'VG01-s2-cow'
        Getting device info for VG01-s2-cow
        dm info VG01-s2-cow  N
        Found existing layer 'VG01-s3-cow'
        Getting device info for VG01-s3-cow
        dm info VG01-s3-cow  N
        Found existing layer 'VG01-s4'
        Getting device info for VG01-s4
        dm info VG01-s4  N
        Found existing layer 'VG01-s3'
        Getting device info for VG01-s3
        dm info VG01-s3  N
        Found existing layer 'VG01-lv1-real'
        Getting device info for VG01-lv1-real
        dm info VG01-lv1-real  N
        Found existing layer 'VG01-lv1'
        Getting device info for VG01-lv1
        dm info VG01-lv1  N
        Found existing layer 'VG01-s4-cow'
        Getting device info for VG01-s4-cow
        dm info VG01-s4-cow  N
        Found existing layer 'VG01-s2'
        Getting device info for VG01-s2
        dm info VG01-s2  N
        Found existing layer 'VG01-s1'
        Getting device info for VG01-s1
        dm info VG01-s1  N
        Found existing layer 'VG01-s1-cow'
        Getting device info for VG01-s1-cow
        dm info VG01-s1-cow  N
        Found active lv lv1 (suspended)
        Found active lv s1 (suspended)
        Found active lv s2 (suspended)
        Found active lv s3 (suspended)
        Found active lv s4 (suspended)
        Getting device info for VG01-s5-cow
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7-cow N
        dm info VG01-s5-cow  N
        Getting device info for VG01-s5
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7 N
        dm info VG01-s5  N
    Loading VG01-s3-cow
        Adding target: 0 131072 linear /dev/sda 525440
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq0pE5C9lW88MYp9h2NH27bpf49N0DB2lA-cow N
      Activated VG01-s3-cow
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq0pE5C9lW88MYp9h2NH27bpf49N0DB2lA-cow
253:006
    Loading VG01-lv1-real
        Adding target: 0 262144 linear /dev/sda 1152
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT-real
N
      Resuming VG01-lv1-real
        dm resume VG01-lv1-real  N
      Activated VG01-lv1-real
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT-real
253:001
    Loading VG01-s3
        Adding target: 0 262144 snapshot 253:001 253:006 P 16
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq0pE5C9lW88MYp9h2NH27bpf49N0DB2lA N
      Activated VG01-s3
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq0pE5C9lW88MYp9h2NH27bpf49N0DB2lA
253:007
    Loading VG01-s5-cow
        Adding target: 0 131072 linear /dev/sda 787584
        dm create VG01-s5-cow
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7-cow O
        dm reload VG01-s5-cow  O
        dm resume VG01-s5-cow  N
      Activated VG01-s5-cow
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7-cow
253:010
    Loading VG01-s5
        Adding target: 0 262144 snapshot 253:001 253:010 P 16
        dm create VG01-s5
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7 O
        dm reload VG01-s5  O
        dm resume VG01-s5  N
      Activated VG01-s5
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqsGoa5JEGpk4nXxhxd75lDLjzMXKs1nD7
253:011
    Loading VG01-s1-cow
        Adding target: 0 131072 linear /dev/sda 263296
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqU8iY0rdEugG8mBkjL0p24O2XxuG67fCC-cow N
      Activated VG01-s1-cow
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqU8iY0rdEugG8mBkjL0p24O2XxuG67fCC-cow
253:002
    Loading VG01-s1
        Adding target: 0 262144 snapshot 253:001 253:002 P 16
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqU8iY0rdEugG8mBkjL0p24O2XxuG67fCC N
      Activated VG01-s1
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqU8iY0rdEugG8mBkjL0p24O2XxuG67fCC
253:003
    Loading VG01-s4-cow
        Adding target: 0 131072 linear /dev/sda 656512
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqpkUBhz1E4jcl9ljQOayfUUwZY0nF3u8M-cow N
      Activated VG01-s4-cow
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqpkUBhz1E4jcl9ljQOayfUUwZY0nF3u8M-cow
253:008
    Loading VG01-s4
        Adding target: 0 262144 snapshot 253:001 253:008 P 16
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqpkUBhz1E4jcl9ljQOayfUUwZY0nF3u8M N
      Activated VG01-s4
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqpkUBhz1E4jcl9ljQOayfUUwZY0nF3u8M
253:009
    Loading VG01-s2-cow
        Adding target: 0 131072 linear /dev/sda 394368
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq3IM2X651mCRcEXfTqa7AkNJsKv1skiBu-cow N
      Activated VG01-s2-cow
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq3IM2X651mCRcEXfTqa7AkNJsKv1skiBu-cow
253:004
    Loading VG01-s2
        Adding target: 0 262144 snapshot 253:001 253:004 P 16
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq3IM2X651mCRcEXfTqa7AkNJsKv1skiBu N
      Activated VG01-s2
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsq3IM2X651mCRcEXfTqa7AkNJsKv1skiBu
253:005
    Loading VG01-lv1
        Adding target: 0 262144 snapshot-origin 253:001
        dm reload 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT N
      Activated VG01-lv1
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT
253:000
      Resuming VG01-s3-cow
        dm resume VG01-s3-cow  N
      Resuming VG01-s3
        dm resume VG01-s3  N
      Resuming VG01-s2-cow
        dm resume VG01-s2-cow  N
      Resuming VG01-s1-cow
        dm resume VG01-s1-cow  N
      Resuming VG01-s1
        dm resume VG01-s1  N
      Resuming VG01-s4-cow
        dm resume VG01-s4-cow  N
      Resuming VG01-s4
        dm resume VG01-s4  N
      Resuming VG01-s2
        dm resume VG01-s2  N
      Resuming VG01-lv1
        dm resume VG01-lv1  N
      Unlocking memory
        memlock_count dec to 0
      Removing /dev/VG01/s3
      Linking /dev/VG01/s3 -> /dev/mapper/VG01-s3
      Linking /dev/VG01/s5 -> /dev/mapper/VG01-s5
      Removing /dev/VG01/s1
      Linking /dev/VG01/s1 -> /dev/mapper/VG01-s1
      Removing /dev/VG01/s4
      Linking /dev/VG01/s4 -> /dev/mapper/VG01-s4
      Removing /dev/VG01/s2
      Linking /dev/VG01/s2 -> /dev/mapper/VG01-s2
      Removing /dev/VG01/lv1
      Linking /dev/VG01/lv1 -> /dev/mapper/VG01-lv1
    Creating volume group backup "/etc/lvm/backup/VG01" (seqno 12).
        Writing VG01 metadata to /etc/lvm/backup/.lvm_proNAS_2497_1510734533
        Committing VG01 metadata (12)
        Renaming /etc/lvm/backup/VG01.tmp to /etc/lvm/backup/VG01
  Logical volume "s5" created
      Unlocking /var/lock/lvm/V_VG01
        Closed /dev/sda
      Dumping persistent device cache to /etc/lvm/.cache
    Wiping internal VG cache
-bash-3.00# cp -af /etc/ /mnt/lv1/etc6
-bash-3.00# lvcreate -s -L64 -n s6 /dev/VG01/lv1
      Setting log/indent to 1
      Setting log/prefix to
      Setting log/command_names to 0
      Setting global/test to 0
      Setting log/overwrite to 1
      Setting log/file to /var/log/lvm2.log
      log/activation not found in config: defaulting to 0
    Logging initialised at Sun Sep 18 00:13:12 2005

      Setting global/umask to 63
    Set umask to 0077
      Setting devices/dir to /dev
      Setting global/proc to /proc
      Setting global/activation to 1
      global/suffix not found in config: defaulting to 1
      global/units not found in config: defaulting to h
        Matcher built with 5 dfa states
      Setting devices/cache to /etc/lvm/.cache
      Setting devices/write_cache_state to 1
        Opened /etc/lvm/.cache RO
        Closed /etc/lvm/.cache
        /dev/sda: Added to device cache
      Loaded persistent filter cache from /etc/lvm/.cache
      Setting activation/reserved_stack to 256
      Setting activation/reserved_memory to 8192
      Setting activation/process_priority to -18
      Initialised format: lvm1
      Initialised format: pool
      Initialised format: lvm2
      global/format not found in config: defaulting to lvm2
      Initialised segtype: striped
      Initialised segtype: zero
      Initialised segtype: error
      Initialised segtype: snapshot
      Initialised segtype: mirror
      Setting backup/retain_days to 30
      Setting backup/retain_min to 10
      Setting backup/archive_dir to /etc/lvm/archive
      Setting backup/backup_dir to /etc/lvm/backup
      global/fallback_to_lvm1 not found in config: defaulting to 0
        Parsing: lvcreate -s -L64 -n s6 /dev/VG01/lv1
        Processing: lvcreate -s -L64 -n s6 /dev/VG01/lv1
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Setting chunksize to 16 sectors.
      Getting target version for snapshot
        dm version   O
        dm versions   O
      Getting target version for snapshot-origin
        dm versions   O
      Setting activation/mirror_region_size to 512
      Locking /var/lock/lvm/V_VG01 WB
    Finding volume group "VG01"
        Opened /dev/sda RW O_DIRECT
        /dev/sda: block size is 4096 bytes
      /dev/sda: lvm2 label detected
        lvmcache: /dev/sda now orphaned
        lvmcache: /dev/sda now in VG VG01
      /dev/sda: lvm2 label detected
      /dev/sda: lvm2 label detected
        Read VG01 metadata (12) from /dev/sda at 26624 size 3047
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7    145: NULL(0:0)
    Creating logical volume s6
        Allowing allocation on /dev/sda start PE 7 length 145
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7      1: s6(0:0)
        /dev/sda 7:      8    144: NULL(0:0)
        Writing VG01 metadata to /dev/sda at 29696 len 3273
        Pre-Committing VG01 metadata (13) to /dev/sda header at 4096
    Creating volume group backup "/etc/lvm/backup/VG01" (seqno 13).
        Writing VG01 metadata to /etc/lvm/backup/.lvm_proNAS_2516_4686790
        Committing VG01 metadata (13)
        Renaming /etc/lvm/backup/VG01.tmp to /etc/lvm/backup/VG01
        Committing VG01 metadata (13) to /dev/sda header at 4096
        Locking LV
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP (R)
      Finding volume group for uuid
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
      /dev/sda: lvm2 label detected
      /dev/sda: lvm2 label detected
        Read VG01 metadata (13) from /dev/sda at 29696 size 3273
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7      1: s6(0:0)
        /dev/sda 7:      8    144: NULL(0:0)
    Found volume group "VG01"
      Setting activation/missing_stripe_filler to /dev/ioerror
        Getting device info for VG01-s6
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP N
        dm info VG01-s6  N
      Locking memory
        memlock_count inc to 1
        dm names   O
        Found existing layer 'VG01-s2-cow'
        Getting device info for VG01-s2-cow
        dm info VG01-s2-cow  N
        Found existing layer 'VG01-s5'
        Getting device info for VG01-s5
        dm info VG01-s5  N
        Found existing layer 'VG01-s3-cow'
        Getting device info for VG01-s3-cow
        dm info VG01-s3-cow  N
        Found existing layer 'VG01-s4'
        Getting device info for VG01-s4
        dm info VG01-s4  N
        Found existing layer 'VG01-s3'
        Getting device info for VG01-s3
        dm info VG01-s3  N
        Found existing layer 'VG01-lv1-real'
        Getting device info for VG01-lv1-real
        dm info VG01-lv1-real  N
        Found existing layer 'VG01-lv1'
        Getting device info for VG01-lv1
        dm info VG01-lv1  N
        Found existing layer 'VG01-s4-cow'
        Getting device info for VG01-s4-cow
        dm info VG01-s4-cow  N
        Found existing layer 'VG01-s2'
        Getting device info for VG01-s2
        dm info VG01-s2  N
        Found existing layer 'VG01-s1'
        Getting device info for VG01-s1
        dm info VG01-s1  N
        Found existing layer 'VG01-s5-cow'
        Getting device info for VG01-s5-cow
        dm info VG01-s5-cow  N
        Found existing layer 'VG01-s1-cow'
        Getting device info for VG01-s1-cow
        dm info VG01-s1-cow  N
        Found active lv lv1
        Found active lv s1
        Found active lv s2
        Found active lv s3
        Found active lv s4
        Found active lv s5
        Getting device info for VG01-s6
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP N
        dm info VG01-s6  N
    Loading VG01-s6
        Adding target: 0 131072 linear /dev/sda 918656
        dm create VG01-s6
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP O
        dm reload VG01-s6  O
        dm resume VG01-s6  N
      Activated VG01-s6
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
253:012
      Unlocking memory
        memlock_count dec to 0
      Linking /dev/VG01/s6 -> /dev/mapper/VG01-s6
    Zeroing start of logical volume "s6"
        /dev/VG01/s6: Added to device cache
        Opened /dev/VG01/s6 RW O_DIRECT
        Wiping /dev/VG01/s6 at sector 0 length 8 sectors
        /dev/VG01/s6: block size is 4096 bytes
        Closed /dev/VG01/s6
        Locking LV
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP (NL)
      Finding volume group for uuid
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
      /dev/sda: lvm2 label detected
      /dev/sda: lvm2 label detected
        Read VG01 metadata (13) from /dev/sda at 29696 size 3273
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7      1: s6(0:0)
        /dev/sda 7:      8    144: NULL(0:0)
    Found volume group "VG01"
        Getting device info for VG01-s6
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP O
      Locking memory
        memlock_count inc to 1
        dm names   O
        Found existing layer 'VG01-s2-cow'
        Getting device info for VG01-s2-cow
        dm info VG01-s2-cow  N
        Found existing layer 'VG01-s6'
        Getting device info for VG01-s6
        dm info VG01-s6  N
        Found existing layer 'VG01-s5'
        Getting device info for VG01-s5
        dm info VG01-s5  N
        Found existing layer 'VG01-s3-cow'
        Getting device info for VG01-s3-cow
        dm info VG01-s3-cow  N
        Found existing layer 'VG01-s4'
        Getting device info for VG01-s4
        dm info VG01-s4  N
        Found existing layer 'VG01-s3'
        Getting device info for VG01-s3
        dm info VG01-s3  N
        Found existing layer 'VG01-lv1-real'
        Getting device info for VG01-lv1-real
        dm info VG01-lv1-real  N
        Found existing layer 'VG01-lv1'
        Getting device info for VG01-lv1
        dm info VG01-lv1  N
        Found existing layer 'VG01-s4-cow'
        Getting device info for VG01-s4-cow
        dm info VG01-s4-cow  N
        Found existing layer 'VG01-s2'
        Getting device info for VG01-s2
        dm info VG01-s2  N
        Found existing layer 'VG01-s1'
        Getting device info for VG01-s1
        dm info VG01-s1  N
        Found existing layer 'VG01-s5-cow'
        Getting device info for VG01-s5-cow
        dm info VG01-s5-cow  N
        Found existing layer 'VG01-s1-cow'
        Getting device info for VG01-s1-cow
        dm info VG01-s1-cow  N
        Found active lv lv1
        Found active lv s6
        Found active lv s1
        Found active lv s2
        Found active lv s3
        Found active lv s4
        Found active lv s5
    Removing VG01-s6
      Unlocking memory
        memlock_count dec to 0
      Removing link /dev/VG01/s6
        Unlocking LV
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
      Finding volume group for uuid
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP
      /dev/sda: lvm2 label detected
      /dev/sda: lvm2 label detected
        Read VG01 metadata (13) from /dev/sda at 29696 size 3273
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7      1: s6(0:0)
        /dev/sda 7:      8    144: NULL(0:0)
    Found volume group "VG01"
        Getting device info for VG01-s6
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP N
        dm info VG01-s6  N
        Locking LV
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT (W)
      Finding volume group for uuid
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT
      /dev/sda: lvm2 label detected
      /dev/sda: lvm2 label detected
        Read VG01 metadata (13) from /dev/sda at 29696 size 3273
        /dev/sda 0:      0      2: lv1(0:0)
        /dev/sda 1:      2      1: s1(0:0)
        /dev/sda 2:      3      1: s2(0:0)
        /dev/sda 3:      4      1: s3(0:0)
        /dev/sda 4:      5      1: s4(0:0)
        /dev/sda 5:      6      1: s5(0:0)
        /dev/sda 6:      7      1: s6(0:0)
        /dev/sda 7:      8    144: NULL(0:0)
    Found volume group "VG01"
        Getting device info for VG01-lv1
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqmUxJX5Qie6tyA0ztVEJcQvJi9CvcngrT N
      Locking memory
        memlock_count inc to 1
        dm names   O
        Found existing layer 'VG01-s2-cow'
        Getting device info for VG01-s2-cow
        dm info VG01-s2-cow  N
        Found existing layer 'VG01-s5'
        Getting device info for VG01-s5
        dm info VG01-s5  N
        Found existing layer 'VG01-s3-cow'
        Getting device info for VG01-s3-cow
        dm info VG01-s3-cow  N
        Found existing layer 'VG01-s4'
        Getting device info for VG01-s4
        dm info VG01-s4  N
        Found existing layer 'VG01-s3'
        Getting device info for VG01-s3
        dm info VG01-s3  N
        Found existing layer 'VG01-lv1-real'
        Getting device info for VG01-lv1-real
        dm info VG01-lv1-real  N
        Found existing layer 'VG01-lv1'
        Getting device info for VG01-lv1
        dm info VG01-lv1  N
        Found existing layer 'VG01-s4-cow'
        Getting device info for VG01-s4-cow
        dm info VG01-s4-cow  N
        Found existing layer 'VG01-s2'
        Getting device info for VG01-s2
        dm info VG01-s2  N
        Found existing layer 'VG01-s1'
        Getting device info for VG01-s1
        dm info VG01-s1  N
        Found existing layer 'VG01-s5-cow'
        Getting device info for VG01-s5-cow
        dm info VG01-s5-cow  N
        Found existing layer 'VG01-s1-cow'
        Getting device info for VG01-s1-cow
        dm info VG01-s1-cow  N
        Found active lv lv1
        Found active lv s1
        Found active lv s2
        Found active lv s3
        Found active lv s4
        Found active lv s5
        Getting device info for VG01-s6
        dm info 
mGsdNLkAeP8eWiFjBTybhs35PB8xBwsqkryMnURZK7A5JOgpUBnciRrm1UQPLpjP N
        dm info VG01-s6  N
      Suspending VG01-lv1
        dm suspend VG01-lv1  N


*************************
process hang here..........
