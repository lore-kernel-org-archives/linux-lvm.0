From: Michelle Boyle <michelleb@t3t.com>
In-Reply-To: <1059074019.8299.11.camel@t3silver>
References: <1059074019.8299.11.camel@t3silver>
Message-Id: <1059078969.8299.30.camel@t3silver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: LVM Help Please Version 1.0.7 segmentation fault -- redhat
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
Date: Fri Jul 25 08:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Also I am new to this list so please email me with anything special I
need to do or know. 


Thanks,
Michelle

On Thu, 2003-07-24 at 15:13, Michelle Boyle wrote:
> Can any one please help.. I the following set up and when I add one move
> logical volume to s390c I then get a segmentation fault on just about
> everything vgdisplay works but vgdisplay -v does not -- any assistance
> would be greatly appreciated..
> 
> 
> --- Volume group ---
> 
> VG Name s390b
> 
> VG Access read/write
> 
> VG Status available/resizable
> 
> VG # 0
> 
> MAX LV 256
> 
> Cur LV 120
> 
> Open LV 0
> 
> MAX LV Size 2 TB
> 
> Max PV 256
> 
> Cur PV 1
> 
> Act PV 1
> 
> VG Size 332 GB
> 
> PE Size 32 MB
> 
> Total PE 10624
> 
> Alloc PE / Size 10560 / 330 GB
> 
> Free PE / Size 64 / 2 GB
> 
> VG UUID iCeK0G-BD0P-THPH-neCU-OzVX-Ydog-5lZGOZ
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_1
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 1
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:0
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_2
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 2
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:1
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_3
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 3
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:2
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_4
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 4
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:3
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_5
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 5
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:4
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_6
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 6
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:5
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_7
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 7
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:6
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_8
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 8
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:7
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_9
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 9
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:8
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_10
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 10
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:9
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_11
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 11
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:10
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_12
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 12
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:11
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_13
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 13
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:12
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_14
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 14
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:13
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_15
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 15
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:14
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_16
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 16
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:15
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_17
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 17
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:16
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_18
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 18
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:17
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_19
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 19
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:18
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_20
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 20
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:19
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_21
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 21
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:20
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_22
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 22
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:21
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_23
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 23
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:22
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_24
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 24
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:23
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_25
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 25
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:24
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_26
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 26
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:25
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_27
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 27
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:26
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_28
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 28
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:27
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_29
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 29
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:28
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_30
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 30
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:29
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_31
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 31
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:30
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_32
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 32
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:31
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_33
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 33
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:32
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_34
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 34
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:33
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_35
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 35
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:34
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_36
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 36
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:35
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_37
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 37
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:36
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_38
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 38
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:37
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_39
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 39
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:38
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_40
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 40
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:39
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_41
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 41
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:40
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_42
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 42
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:41
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_43
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 43
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:42
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_44
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 44
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:43
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_45
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 45
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:44
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_46
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 46
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:45
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_47
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 47
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:46
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_48
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 48
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:47
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_49
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 49
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:48
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_50
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 50
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:49
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_51
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 51
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:50
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_52
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 52
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:51
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_53
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 53
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:52
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_54
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 54
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:53
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_55
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 55
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:54
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_56
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 56
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:55
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_57
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 57
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:56
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_58
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 58
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:57
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_59
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 59
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:58
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_60
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 60
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:59
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_61
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 61
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:60
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_62
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 62
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:61
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_63
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 63
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:62
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_64
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 64
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:63
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_65
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 65
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:64
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_66
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 66
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:65
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_67
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 67
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:66
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_68
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 68
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:67
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_69
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 69
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:68
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_70
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 70
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:69
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_71
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 71
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:70
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_72
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 72
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:71
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_73
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 73
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:72
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_74
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 74
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:73
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_75
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 75
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:74
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_76
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 76
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:75
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_77
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 77
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:76
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_78
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 78
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:77
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_79
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 79
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:78
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_80
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 80
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:79
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_81
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 81
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:80
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_82
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 82
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:81
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_83
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 83
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:82
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_84
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 84
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:83
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_85
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 85
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:84
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_86
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 86
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:85
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_87
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 87
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:86
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_88
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 88
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:87
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_89
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 89
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:88
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_90
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 90
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:89
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_91
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 91
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:90
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_92
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 92
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:91
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_93
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 93
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:92
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_94
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 94
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:93
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_95
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 95
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:94
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_96
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 96
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:95
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_97
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 97
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:96
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_98
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 98
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:97
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_99
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 99
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:98
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_100
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 100
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:99
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_101
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 101
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:100
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_102
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 102
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:101
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_103
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 103
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:102
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_104
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 104
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:103
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_105
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 105
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:104
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_106
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 106
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:105
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_107
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 107
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:106
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_108
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 108
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:107
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_109
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 109
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:108
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_110
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 110
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:109
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_111
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 111
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:110
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_112
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 112
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:111
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_113
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 113
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:112
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_114
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 114
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:113
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_115
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 115
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:114
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_116
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 116
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:115
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_117
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 117
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:116
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_118
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 118
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:117
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_119
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 119
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:118
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390b/s3390-3_120
> 
> VG Name s390b
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 120
> 
> # open 0
> 
> LV Size 2.75 GB
> 
> Current LE 88
> 
> Allocated LE 88
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:119
> 
> 
> 
> --- Physical volumes ---
> 
> PV Name (#) /dev/sdb (1)
> 
> PV Status available / allocatable
> 
> Total PE / Free PE 10624 / 64
> 
> 
> 
> --- Volume group ---
> 
> VG Name s390c
> 
> VG Access read/write
> 
> VG Status available/resizable
> 
> VG # 1
> 
> MAX LV 256
> 
> Cur LV 31
> 
> Open LV 0
> 
> MAX LV Size 2 TB
> 
> Max PV 256
> 
> Cur PV 1
> 
> Act PV 1
> 
> VG Size 615.25 GB
> 
> PE Size 32 MB
> 
> Total PE 19688
> 
> Alloc PE / Size 8122 / 253.81 GB
> 
> Free PE / Size 11566 / 361.44 GB
> 
> VG UUID rebSTN-w3OA-FcgI-UD9l-mfHv-uaOm-tpD3vN
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_1
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 1
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:120
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_2
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 2
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:121
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_3
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 3
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:122
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_4
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 4
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:123
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_5
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 5
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:124
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_6
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 6
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:125
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_7
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 7
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:126
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_8
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 8
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:127
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_9
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 9
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:128
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_10
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 10
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:129
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_11
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 11
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:130
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_12
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 12
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:131
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_13
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 13
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:132
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_14
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 14
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:133
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_15
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 15
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:134
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_16
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 16
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:135
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_17
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 17
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:136
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_18
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 18
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:137
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_19
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 19
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:138
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_20
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 20
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:139
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_21
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 21
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:140
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_22
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 22
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:141
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_23
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 23
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:142
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_24
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 24
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:143
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_25
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 25
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:144
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_26
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 26
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:145
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_27
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 27
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:146
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_28
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 28
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:147
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_29
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 29
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:148
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_30
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 30
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:149
> 
> 
> --- Logical volume ---
> 
> LV Name /dev/s390c/s3390-9_31
> 
> VG Name s390c
> 
> LV Write Access read/write
> 
> LV Status available
> 
> LV # 31
> 
> # open 0
> 
> LV Size 8.19 GB
> 
> Current LE 262
> 
> Allocated LE 262
> 
> Allocation next free
> 
> Read ahead sectors 1024
> 
> Block device 58:150
> 
> 
> 
> --- Physical volumes ---
> 
> PV Name (#) /dev/sdc (1)
> 
> PV Status available / allocatable
> 
> Total PE / Free PE 19688 / 11566
> 
> 
> 
> 
-- 
Thank You,
Michelle Boyle
michelleb@t3t.com
