From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] kernel BUG at dm-snapshot.c:986!
Message-ID: <20030516130800.E24422@sistina.com>
References: <91120000.1052757190@valkyrie.lsit.ucsb.edu>
Mime-Version: 1.0
In-Reply-To: <91120000.1052757190@valkyrie.lsit.ucsb.edu>; from max+lists.lvm-dev@lsit.ucsb.edu on Mon, May 12, 2003 at 09:33:10AM -0700
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
Date: Fri May 16 06:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Max,

that code has changed recently. Have you tried if public device-mapper cvs 
fixes it?

Keep in mind, that code is under construction there!

Regards,
Heinz    -- The LVM Guy --


On Mon, May 12, 2003 at 09:33:10AM -0700, Max Kalika wrote:
> Hello lvm folk.
> 
> I didn't find this as a known issue on the mailing list archives so I
> figure I should post.  As the subject says I hit a BUG today playing with
> lvm2.  What I did was:
> 
> 1) create a 22 GB vg out using one pv
>    (one partition on a scsi disk -- /dev/sda2)
> 2) extend the vg to 22GB to another pv
>    (another partition on a different scsi disk -- /dev/sdb2)
> 3) create a lv of 15GB
> 4) mkreiserfs, mount and copy some stuff (contents of /etc)
>    over to the new volume
> 5) umount, resize the lv to 21GB, and resize reiserfs to fill the device
> 6) mount, and create a 4GB file --
>    (dd if=/dev/zero of=STUFF bs=1024k count=4096)
> 7) create a snapshot lv of 1GB
> 8) remove the STUFF file from the origin
> 9) remove the snapshot and attempt to create a smaller snapshot (100MB)
> 
> at this point I got the following:
> 
> (scsi0:A:2:0): Locking max tag count at 64
> device-mapper: snapshot is marked invalid
> device-mapper: Couldn't create exception store
> device-mapper: error adding target to table
> kernel BUG at dm-snapshot.c:986!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c0214300>]    Tainted: P
> EFLAGS: 00010246
> eax: 00000000   ebx: c03574d8   ecx: f7b50808   edx: 00000000
> esi: f7b4ac00   edi: f7037300   ebp: 00000001   esp: f2295e5c
> ds: 0018   es: 0018   ss: 0018
> Process lvcreate (pid: 1512, stackpage=f2295000)
> Stack: 0000fe01 f7037300 f7355400 c020e9ac d39b5240 f7037300 00000001
>        f42a4e8c f42a4e80 f7037300 00000008 01500000 000707c0 c01d99fc 
>        c03524d0 00000001 f7037300 00000012 000021d2 00000008 00000001 
>        0000c73c 00000000
> c01d9abb
> Call Trace:    [<c020e9ac>] [<c01d99fc>] [<c01d9abb>] [<c0141edc>]
>                [<c0141fc5>] [<c0142015>] [<c014213a>] [<c01422c7>] 
>                [<c014242f>] [<c010774f>]
> Code: 0f 0b da 03 b3 d8 28 c0 eb c3 8d b6 00 00 00 00 83 ec 20 83
>  kernel BUG at dm-snapshot.c:986!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c0214300>]    Tainted: P
> EFLAGS: 00010246
> eax: 00000000   ebx: c03574d8   ecx: f7b50808   edx: 00000000
> esi: f7b4ac00   edi: f7053b00   ebp: 00000001   esp: f7bade9c
> ds: 0018   es: 0018   ss: 0018
> Process kupdated (pid: 9, stackpage=f7bad000)
> Stack: 0000fe01 f7053b00 f7355400 c020e9ac d39b5240 f7053b00 00000001
>        f42a4ea4 f42a4e98 f7053b00 00000008 01500000 000708c0 c01d99fc 
>        c03524d0 00000001 f7053b00 00000296 f7bac000 00000008 00000001 
>        0000c720 00000000 c01d9abb
> Call Trace:    [<c020e9ac>] [<c01d99fc>] [<c01d9abb>] [<c0141edc>]
>                [<c0141fc5>] [<c0145b7d>] [<c0145ead>] [<c0105000>] 
>                [<c0105000>] [<c010590e>] [<c0145db0>]
> 
> Code: 0f 0b da 03 b3 d8 28 c0 eb c3 8d b6 00 00 00 00 83 ec 20 83
> 
> 
> The system stayed up however, but any further lvm commands would just hang.
> Attached, you will find the dmesg log (with the oops report in it) and the
> ksymoops log.  Please let me know if any further information is needed as
> this is my first kernel bug report.
> 
> Thank you for your time.
> 
> ---max kalika
> --max@lsit.ucsb.edu
> -lsit systems administrator
> at ffff6000
> __va_range(0xfdda0, 0x50): idx=8 mapped at ffff6000
> ACPI table found: SPCR v1 [DELL   PE2650   0.1]
> Enabling the CPU's according to the ACPI table
> Intel MultiProcessor Specification v1.4
>     Virtual Wire compatibility mode.
> OEM ID: DELL     Product ID: PE 0121      APIC at: 0xFEE00000
> I/O APIC #4 Version 17 at 0xFEC00000.
> I/O APIC #5 Version 17 at 0xFEC01000.
> I/O APIC #6 Version 17 at 0xFEC02000.
> Processors: 4
> Kernel command line: root=/dev/sda1
> Initializing CPU#0
> Detected 2786.929 MHz processor.
> Console: colour VGA+ 80x25
> Calibrating delay loop... 5557.45 BogoMIPS
> Memory: 2069512k/2097088k available (1442k kernel code, 27192k reserved, 325k data, 256k init, 1179584k highmem)
> Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
> Inode cache hash table entries: 131072 (order: 8, 1048576 bytes)
> Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)
> Buffer-cache hash table entries: 131072 (order: 7, 524288 bytes)
> Page-cache hash table entries: 524288 (order: 9, 2097152 bytes)
> CPU: L1 I cache: 0K, L1 D cache: 8K
> CPU: L2 cache: 512K
> CPU: Physical Processor ID: 0
> Intel machine check architecture supported.
> Intel machine check reporting enabled on CPU#0.
> CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
> CPU:             Common caps: bfebfbff 00000000 00000000 00000000
> Enabling fast FPU save and restore... done.
> Enabling unmasked SIMD FPU exception support... done.
> Checking 'hlt' instruction... OK.
> POSIX conformance testing by UNIFIX
> mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
> mtrr: detected mtrr type: Intel
> CPU: L1 I cache: 0K, L1 D cache: 8K
> CPU: L2 cache: 512K
> CPU: Physical Processor ID: 0
> Intel machine check reporting enabled on CPU#0.
> CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
> CPU:             Common caps: bfebfbff 00000000 00000000 00000000
> CPU0: Intel(R) Xeon(TM) CPU 2.80GHz stepping 07
> per-CPU timeslice cutoff: 1463.01 usecs.
> enabled ExtINT on CPU#0
> ESR value before enabling vector: 00000040
> ESR value after enabling vector: 00000000
> Booting processor 1/1 eip 2000
> Initializing CPU#1
> masked ExtINT on CPU#1
> ESR value before enabling vector: 00000000
> ESR value after enabling vector: 00000000
> Calibrating delay loop... 5570.56 BogoMIPS
> CPU: L1 I cache: 0K, L1 D cache: 8K
> CPU: L2 cache: 512K
> CPU: Physical Processor ID: 0
> Intel machine check reporting enabled on CPU#1.
> CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
> CPU:             Common caps: bfebfbff 00000000 00000000 00000000
> CPU1: Intel(R) Xeon(TM) CPU 2.80GHz stepping 07
> Booting processor 2/2 eip 2000
> Initializing CPU#2
> masked ExtINT on CPU#2
> ESR value before enabling vector: 00000000
> ESR value after enabling vector: 00000000
> Calibrating delay loop... 5570.56 BogoMIPS
> CPU: L1 I cache: 0K, L1 D cache: 8K
> CPU: L2 cache: 512K
> CPU: Physical Processor ID: 3
> Intel machine check reporting enabled on CPU#2.
> CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
> CPU:             Common caps: bfebfbff 00000000 00000000 00000000
> CPU2: Intel(R) Xeon(TM) CPU 2.80GHz stepping 07
> Booting processor 3/3 eip 2000
> Initializing CPU#3
> masked ExtINT on CPU#3
> ESR value before enabling vector: 00000000
> ESR value after enabling vector: 00000000
> Calibrating delay loop... 5570.56 BogoMIPS
> CPU: L1 I cache: 0K, L1 D cache: 8K
> CPU: L2 cache: 512K
> CPU: Physical Processor ID: 3
> Intel machine check reporting enabled on CPU#3.
> CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
> CPU:             Common caps: bfebfbff 00000000 00000000 00000000
> CPU3: Intel(R) Xeon(TM) CPU 2.80GHz stepping 07
> Total of 4 processors activated (22269.13 BogoMIPS).
> cpu_sibling_map[0] = 1
> cpu_sibling_map[1] = 0
> cpu_sibling_map[2] = 3
> cpu_sibling_map[3] = 2
> ENABLING IO-APIC IRQs
> Setting 4 in the phys_id_present_map
> ....changing IO-APIC physical APIC ID to 4 ... ok.
> Setting 5 in the phys_id_present_map
> ....changing IO-APIC physical APIC ID to 5 ... ok.
> Setting 6 in the phys_id_present_map
> ....changing IO-APIC physical APIC ID to 6 ... ok.
> init IO_APIC IRQs
>  IO-APIC (apicid-pin) 4-0, 4-7, 4-10, 4-11, 4-13, 6-0, 6-1, 6-2, 6-3, 6-4, 6-5, 6-6, 6-7, 6-8, 6-9, 6-10, 6-11, 6-12, 6-13, 6-14, 6-15 not connected.
> ...TIMER: vector=0x31 pin1=2 pin2=0
> ...MP-BIOS bug: 8254 timer not connected to IO-APIC
> ....trying to set up timer (IRQ0) through the 8259A ... 
> ...... (found pin 0) ...works.
> number of MP IRQ sources: 33.
> number of IO-APIC #4 registers: 16.
> number of IO-APIC #5 registers: 16.
> number of IO-APIC #6 registers: 16.
> testing the IO APIC.......................
> 
> IO APIC #4......
> ..... register #00: 04000000
> ........    : physical APIC id: 04
> ..... register #01: 000F0011
> ........     : max redirection entries: 000F
> ........     : PRQ implemented: 0
> ........     : IO APIC version: 0011
> ..... register #02: 04000000
> ........     : arbitration: 04
> ..... IRQ redirection table:
>  NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:   
>  00 00F 0F  0    0    0   0   0    1    1    31
>  01 00F 0F  0    0    0   0   0    1    1    39
>  02 000 00  1    0    0   0   0    0    0    00
>  03 00F 0F  0    0    0   0   0    1    1    41
>  04 00F 0F  0    0    0   0   0    1    1    49
>  05 00F 0F  1    1    0   1   0    1    1    51
>  06 00F 0F  0    0    0   0   0    1    1    59
>  07 000 00  1    0    0   0   0    0    0    00
>  08 00F 0F  0    0    0   0   0    1    1    61
>  09 00F 0F  0    0    0   0   0    1    1    69
>  0a 000 00  1    0    0   0   0    0    0    00
>  0b 000 00  1    0    0   0   0    0    0    00
>  0c 00F 0F  0    0    0   0   0    1    1    71
>  0d 000 00  1    0    0   0   0    0    0    00
>  0e 00F 0F  0    0    0   0   0    1    1    79
>  0f 00F 0F  0    0    0   0   0    1    1    81
> 
> IO APIC #5......
> ..... register #00: 05000000
> ........    : physical APIC id: 05
> ..... register #01: 000F0011
> ........     : max redirection entries: 000F
> ........     : PRQ implemented: 0
> ........     : IO APIC version: 0011
> ..... register #02: 05000000
> ........     : arbitration: 05
> ..... IRQ redirection table:
>  NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:   
>  00 00F 0F  1    1    0   1   0    1    1    89
>  01 00F 0F  1    1    0   1   0    1    1    91
>  02 00F 0F  1    1    0   1   0    1    1    99
>  03 00F 0F  1    1    0   1   0    1    1    A1
>  04 00F 0F  1    1    0   1   0    1    1    A9
>  05 00F 0F  1    1    0   1   0    1    1    B1
>  06 00F 0F  1    1    0   1   0    1    1    B9
>  07 00F 0F  1    1    0   1   0    1    1    C1
>  08 00F 0F  1    1    0   1   0    1    1    C9
>  09 00F 0F  1    1    0   1   0    1    1    D1
>  0a 00F 0F  1    1    0   1   0    1    1    D9
>  0b 00F 0F  1    1    0   1   0    1    1    E1
>  0c 00F 0F  1    1    0   1   0    1    1    E9
>  0d 00F 0F  1    1    0   1   0    1    1    32
>  0e 00F 0F  1    1    0   1   0    1    1    3A
>  0f 00F 0F  1    1    0   1   0    1    1    42
> 
> IO APIC #6......
> ..... register #00: 06000000
> ........    : physical APIC id: 06
> ..... register #01: 000F0011
> ........     : max redirection entries: 000F
> ........     : PRQ implemented: 0
> ........     : IO APIC version: 0011
> ..... register #02: 06000000
> ........     : arbitration: 06
> ..... IRQ redirection table:
>  NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:   
>  00 000 00  1    0    0   0   0    0    0    00
>  01 000 00  1    0    0   0   0    0    0    00
>  02 000 00  1    0    0   0   0    0    0    00
>  03 000 00  1    0    0   0   0    0    0    00
>  04 000 00  1    0    0   0   0    0    0    00
>  05 000 00  1    0    0   0   0    0    0    00
>  06 000 00  1    0    0   0   0    0    0    00
>  07 000 00  1    0    0   0   0    0    0    00
>  08 000 00  1    0    0   0   0    0    0    00
>  09 000 00  1    0    0   0   0    0    0    00
>  0a 000 00  1    0    0   0   0    0    0    00
>  0b 000 00  1    0    0   0   0    0    0    00
>  0c 000 00  1    0    0   0   0    0    0    00
>  0d 000 00  1    0    0   0   0    0    0    00
>  0e 000 00  1    0    0   0   0    0    0    00
>  0f 000 00  1    0    0   0   0    0    0    00
> IRQ to pin mappings:
> IRQ0 -> 0:0
> IRQ1 -> 0:1
> IRQ3 -> 0:3
> IRQ4 -> 0:4
> IRQ5 -> 0:5
> IRQ6 -> 0:6
> IRQ8 -> 0:8
> IRQ9 -> 0:9
> IRQ12 -> 0:12
> IRQ14 -> 0:14
> IRQ15 -> 0:15
> IRQ16 -> 1:0
> IRQ17 -> 1:1
> IRQ18 -> 1:2
> IRQ19 -> 1:3
> IRQ20 -> 1:4
> IRQ21 -> 1:5
> IRQ22 -> 1:6
> IRQ23 -> 1:7
> IRQ24 -> 1:8
> IRQ25 -> 1:9
> IRQ26 -> 1:10
> IRQ27 -> 1:11
> IRQ28 -> 1:12
> IRQ29 -> 1:13
> IRQ30 -> 1:14
> IRQ31 -> 1:15
> ..................................... done.
> Using local APIC timer interrupts.
> calibrating APIC timer ...
> ...... CPU clock speed is 2787.0443 MHz.
> ...... host bus clock speed is 99.5372 MHz.
> cpu: 0, clocks: 995372, slice: 199074
> CPU0<T0:995360,T1:796272,D:14,S:199074,C:995372>
> cpu: 1, clocks: 995372, slice: 199074
> cpu: 3, clocks: 995372, slice: 199074
> cpu: 2, clocks: 995372, slice: 199074
> CPU1<T0:995360,T1:597200,D:12,S:199074,C:995372>
> CPU2<T0:995360,T1:398128,D:10,S:199074,C:995372>
> CPU3<T0:995360,T1:199056,D:8,S:199074,C:995372>
> checking TSC synchronization across CPUs: passed.
> Waiting on wait_init_idle (map = 0xe)
> All processors have done init_idle
> PCI: PCI BIOS revision 2.10 entry at 0xfc97e, last bus=5
> PCI: Using configuration type 1
> PCI: Probing PCI hardware
> PCI: Discovered primary peer bus 01 [IRQ]
> PCI: Discovered primary peer bus 02 [IRQ]
> PCI: Discovered primary peer bus 03 [IRQ]
> PCI: Discovered primary peer bus 04 [IRQ]
> PCI: Using IRQ router ServerWorks [1166/0201] at 00:0f.0
> PCI->APIC IRQ transform: (B0,I4,P0) -> 19
> PCI->APIC IRQ transform: (B0,I4,P1) -> 23
> PCI->APIC IRQ transform: (B0,I4,P2) -> 27
> PCI->APIC IRQ transform: (B3,I6,P0) -> 28
> PCI->APIC IRQ transform: (B3,I8,P0) -> 29
> PCI->APIC IRQ transform: (B5,I6,P0) -> 30
> PCI->APIC IRQ transform: (B5,I6,P1) -> 31
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Initializing RT netlink socket
> Starting kswapd
> allocated 32 pages and 32 bhs reserved for the highmem bounces
> VFS: Diskquotas version dquot_6.5.1 initialized
> Journalled Block Device driver loaded
> devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
> devfs: boot_options: 0x1
> pty: 256 Unix98 ptys configured
> Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
> ttyS00 at 0x03f8 (irq = 4) is a 16550A
> ttyS01 at 0x02f8 (irq = 3) is a 16550A
> Real Time Clock Driver v1.10e
> tg3.c:v1.2 (Nov 14, 2002)
> eth0: Tigon3 [partno(BCM95701A10) rev 0105 PHY(5701)] (PCIX:133MHz:64-bit) 10/100/1000BaseT Ethernet 00:06:5b:fc:b8:34
> eth1: Tigon3 [partno(BCM95701A10) rev 0105 PHY(5701)] (PCIX:133MHz:64-bit) 10/100/1000BaseT Ethernet 00:06:5b:fc:b8:35
> SCSI subsystem driver Revision: 1.00
> scsi0 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.2.8
>         <Adaptec aic7899 Ultra160 SCSI adapter>
>         aic7899: Ultra160 Wide Channel A, SCSI Id=7, 32/253 SCBs
> 
> scsi1 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.2.8
>         <Adaptec aic7899 Ultra160 SCSI adapter>
>         aic7899: Ultra160 Wide Channel B, SCSI Id=7, 32/253 SCBs
> 
> blk: queue f7b6de18, I/O limit 4095Mb (mask 0xffffffff)
>   Vendor: SEAGATE   Model: ST318453LC        Rev: DX03
>   Type:   Direct-Access                      ANSI SCSI revision: 03
> blk: queue f7b6dc18, I/O limit 4095Mb (mask 0xffffffff)
> (scsi0:A:0): 160.000MB/s transfers (80.000MHz DT, offset 63, 16bit)
>   Vendor: SEAGATE   Model: ST318453LC        Rev: DX03
>   Type:   Direct-Access                      ANSI SCSI revision: 03
> blk: queue f7b6d418, I/O limit 4095Mb (mask 0xffffffff)
> (scsi0:A:2): 160.000MB/s transfers (80.000MHz DT, offset 63, 16bit)
>   Vendor: PE/PV     Model: 1x5 SCSI BP       Rev: 1.1 
>   Type:   Processor                          ANSI SCSI revision: 02
> blk: queue f7b59818, I/O limit 4095Mb (mask 0xffffffff)
> scsi0:A:0:0: Tagged Queuing enabled.  Depth 253
> scsi0:A:2:0: Tagged Queuing enabled.  Depth 253
> Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
> Attached scsi disk sdb at scsi0, channel 0, id 2, lun 0
> SCSI device sda: 35566478 512-byte hdwr sectors (18210 MB)
> Partition check:
>  /dev/scsi/host0/bus0/target0/lun0: p1 p2 p3
> SCSI device sdb: 35566478 512-byte hdwr sectors (18210 MB)
>  /dev/scsi/host0/bus0/target2/lun0: p1 p2
> device-mapper: 1.0.10-ioctl (2003-03-27) initialised: dm@uk.sistina.com
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP, IGMP
> IP: routing cache hash table of 16384 buckets, 128Kbytes
> TCP: Hash tables configured (established 262144 bind 65536)
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> reiserfs: checking transaction log (device 08:01) ...
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> VFS: Mounted root (reiserfs filesystem) readonly.
> Mounted devfs on /dev
> Freeing unused kernel memory: 256k freed
> Adding Swap: 1710912k swap-space (priority -1)
> tg3: eth0: Link is up at 100 Mbps, full duplex.
> tg3: eth0: Flow control is off for TX and off for RX.
> Attached scsi generic sg2 at scsi0, channel 0, id 6, lun 0,  type 3
> reiserfs: checking transaction log (device fe:02) ...
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device fe:03) ...
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> (scsi0:A:0:0): Locking max tag count at 64
> reiserfs: checking transaction log (device fe:02) ...
> reiserfs: replayed 4 transactions in 2 seconds
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device fe:03) ...
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device fe:02) ...
> reiserfs: replayed 1 transactions in 1 seconds
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device fe:02) ...
> Using r5 hash to sort names
> ReiserFS version 3.6.25
> (scsi0:A:2:0): Locking max tag count at 64
> device-mapper: snapshot is marked invalid
> device-mapper: Couldn't create exception store
> device-mapper: error adding target to table
> kernel BUG at dm-snapshot.c:986!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c0214300>]    Tainted: P 
> EFLAGS: 00010246
> eax: 00000000   ebx: c03574d8   ecx: f7b50808   edx: 00000000
> esi: f7b4ac00   edi: f7037300   ebp: 00000001   esp: f2295e5c
> ds: 0018   es: 0018   ss: 0018
> Process lvcreate (pid: 1512, stackpage=f2295000)
> Stack: 0000fe01 f7037300 f7355400 c020e9ac d39b5240 f7037300 00000001 f42a4e8c 
>        f42a4e80 f7037300 00000008 01500000 000707c0 c01d99fc c03524d0 00000001 
>        f7037300 00000012 000021d2 00000008 00000001 0000c73c 00000000 c01d9abb 
> Call Trace:    [<c020e9ac>] [<c01d99fc>] [<c01d9abb>] [<c0141edc>] [<c0141fc5>]
>   [<c0142015>] [<c014213a>] [<c01422c7>] [<c014242f>] [<c010774f>]
> 
> Code: 0f 0b da 03 b3 d8 28 c0 eb c3 8d b6 00 00 00 00 83 ec 20 83 
>  kernel BUG at dm-snapshot.c:986!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c0214300>]    Tainted: P 
> EFLAGS: 00010246
> eax: 00000000   ebx: c03574d8   ecx: f7b50808   edx: 00000000
> esi: f7b4ac00   edi: f7053b00   ebp: 00000001   esp: f7bade9c
> ds: 0018   es: 0018   ss: 0018
> Process kupdated (pid: 9, stackpage=f7bad000)
> Stack: 0000fe01 f7053b00 f7355400 c020e9ac d39b5240 f7053b00 00000001 f42a4ea4 
>        f42a4e98 f7053b00 00000008 01500000 000708c0 c01d99fc c03524d0 00000001 
>        f7053b00 00000296 f7bac000 00000008 00000001 0000c720 00000000 c01d9abb 
> Call Trace:    [<c020e9ac>] [<c01d99fc>] [<c01d9abb>] [<c0141edc>] [<c0141fc5>]
>   [<c0145b7d>] [<c0145ead>] [<c0105000>] [<c0105000>] [<c010590e>] [<c0145db0>]
> 
> Code: 0f 0b da 03 b3 d8 28 c0 eb c3 8d b6 00 00 00 00 83 ec 20 83 
>  

> ksymoops 2.4.8 on i686 2.4.20-lsit-r0.  Options used
>      -V (default)
>      -k /proc/ksyms (default)
>      -l /proc/modules (default)
>      -o /lib/modules/2.4.20-lsit-r0/ (default)
>      -m /boot/System.map.ike (specified)
> 
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c0214300>]    Tainted: P 
> Using defaults from ksymoops -t elf32-i386 -a i386
> EFLAGS: 00010246
> eax: 00000000   ebx: c03574d8   ecx: f7b50808   edx: 00000000
> esi: f7b4ac00   edi: f7037300   ebp: 00000001   esp: f2295e5c
> ds: 0018   es: 0018   ss: 0018
> Process lvcreate (pid: 1512, stackpage=f2295000)
> Stack: 0000fe01 f7037300 f7355400 c020e9ac d39b5240 f7037300 00000001 f42a4e8c 
>        f42a4e80 f7037300 00000008 01500000 000707c0 c01d99fc c03524d0 00000001 
>        f7037300 00000012 000021d2 00000008 00000001 0000c73c 00000000 c01d9abb 
> Call Trace:    [<c020e9ac>] [<c01d99fc>] [<c01d9abb>] [<c0141edc>] [<c0141fc5>]
>   [<c0142015>] [<c014213a>] [<c01422c7>] [<c014242f>] [<c010774f>]
> Code: 0f 0b da 03 b3 d8 28 c0 eb c3 8d b6 00 00 00 00 83 ec 20 83 
> 
> 
> >>EIP; c0214300 <do_origin+60/70>   <=====
> 
> >>ebx; c03574d8 <_origins_lock+0/28>
> >>ecx; f7b50808 <_end+377e5ab0/3863f308>
> >>esi; f7b4ac00 <_end+377dfea8/3863f308>
> >>edi; f7037300 <_end+36ccc5a8/3863f308>
> >>esp; f2295e5c <_end+31f2b104/3863f308>
> 
> Trace; c020e9ac <dm_request+17c/1d0>
> Trace; c01d99fc <generic_make_request+dc/140>
> Trace; c01d9abb <submit_bh+5b/80>
> Trace; c0141edc <write_locked_buffers+2c/40>
> Trace; c0141fc5 <write_some_buffers+d5/100>
> Trace; c0142015 <write_unlocked_buffers+25/30>
> Trace; c014213a <sync_buffers+1a/70>
> Trace; c01422c7 <fsync_dev+27/b0>
> Trace; c014242f <sys_sync+f/20>
> Trace; c010774f <system_call+33/38>
> 
> Code;  c0214300 <do_origin+60/70>
> 00000000 <_EIP>:
> Code;  c0214300 <do_origin+60/70>   <=====
>    0:   0f 0b                     ud2a      <=====
> Code;  c0214302 <do_origin+62/70>
>    2:   da 03                     fiaddl (%ebx)
> Code;  c0214304 <do_origin+64/70>
>    4:   b3 d8                     mov    $0xd8,%bl
> Code;  c0214306 <do_origin+66/70>
>    6:   28 c0                     sub    %al,%al
> Code;  c0214308 <do_origin+68/70>
>    8:   eb c3                     jmp    ffffffcd <_EIP+0xffffffcd>
> Code;  c021430a <do_origin+6a/70>
>    a:   8d b6 00 00 00 00         lea    0x0(%esi),%esi
> Code;  c0214310 <origin_ctr+0/80>
>   10:   83 ec 20                  sub    $0x20,%esp
> Code;  c0214313 <origin_ctr+3/80>
>   13:   83 00 00                  addl   $0x0,(%eax)
> 
>  kernel BUG at dm-snapshot.c:986!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c0214300>]    Tainted: P 
> EFLAGS: 00010246
> eax: 00000000   ebx: c03574d8   ecx: f7b50808   edx: 00000000
> esi: f7b4ac00   edi: f7053b00   ebp: 00000001   esp: f7bade9c
> ds: 0018   es: 0018   ss: 0018
> Process kupdated (pid: 9, stackpage=f7bad000)
> Stack: 0000fe01 f7053b00 f7355400 c020e9ac d39b5240 f7053b00 00000001 f42a4ea4 
>        f42a4e98 f7053b00 00000008 01500000 000708c0 c01d99fc c03524d0 00000001 
>        f7053b00 00000296 f7bac000 00000008 00000001 0000c720 00000000 c01d9abb 
> Call Trace:    [<c020e9ac>] [<c01d99fc>] [<c01d9abb>] [<c0141edc>] [<c0141fc5>]
>   [<c0145b7d>] [<c0145ead>] [<c0105000>] [<c0105000>] [<c010590e>] [<c0145db0>]
> Code: 0f 0b da 03 b3 d8 28 c0 eb c3 8d b6 00 00 00 00 83 ec 20 83 
> 
> 
> >>EIP; c0214300 <do_origin+60/70>   <=====
> 
> >>ebx; c03574d8 <_origins_lock+0/28>
> >>ecx; f7b50808 <_end+377e5ab0/3863f308>
> >>esi; f7b4ac00 <_end+377dfea8/3863f308>
> >>edi; f7053b00 <_end+36ce8da8/3863f308>
> >>esp; f7bade9c <_end+37843144/3863f308>
> 
> Trace; c020e9ac <dm_request+17c/1d0>
> Trace; c01d99fc <generic_make_request+dc/140>
> Trace; c01d9abb <submit_bh+5b/80>
> Trace; c0141edc <write_locked_buffers+2c/40>
> Trace; c0141fc5 <write_some_buffers+d5/100>
> Trace; c0145b7d <sync_old_buffers+7d/b0>
> Trace; c0145ead <kupdate+fd/140>
> Trace; c0105000 <_stext+0/0>
> Trace; c0105000 <_stext+0/0>
> Trace; c010590e <kernel_thread+2e/40>
> Trace; c0145db0 <kupdate+0/140>
> 
> Code;  c0214300 <do_origin+60/70>
> 00000000 <_EIP>:
> Code;  c0214300 <do_origin+60/70>   <=====
>    0:   0f 0b                     ud2a      <=====
> Code;  c0214302 <do_origin+62/70>
>    2:   da 03                     fiaddl (%ebx)
> Code;  c0214304 <do_origin+64/70>
>    4:   b3 d8                     mov    $0xd8,%bl
> Code;  c0214306 <do_origin+66/70>
>    6:   28 c0                     sub    %al,%al
> Code;  c0214308 <do_origin+68/70>
>    8:   eb c3                     jmp    ffffffcd <_EIP+0xffffffcd>
> Code;  c021430a <do_origin+6a/70>
>    a:   8d b6 00 00 00 00         lea    0x0(%esi),%esi
> Code;  c0214310 <origin_ctr+0/80>
>   10:   83 ec 20                  sub    $0x20,%esp
> Code;  c0214313 <origin_ctr+3/80>
>   13:   83 00 00                  addl   $0x0,(%eax)
> 

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
