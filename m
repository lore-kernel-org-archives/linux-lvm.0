Message-ID: <54B8CA74.104@redhat.com>
Date: Fri, 16 Jan 2015 09:23:16 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010102040407090307050609"
Subject: [linux-lvm] pccardd  process takes 100% CPU
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
To: LVM general discussion and development <linux-lvm@redhat.com>, dbaryshkov@gmail.com, wsa@the-dreams.de

This is a multi-part message in MIME format.
--------------010102040407090307050609
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi

When I've tried  3.19-rc3/4 kernel - after boot I just see 1 CPU core being 
busy 100% with pccard process.

Here is also some kernel WARNING:
(unsure how it's related to busy looping)

------------[ cut here ]------------
WARNING: CPU: 0 PID: 185 at kernel/sched/core.c:7300 __might_sleep+0xbd/0xd0()
do not call blocking ops when !TASK_RUNNING; state=1 set at 
[<ffffffff81518538>] pccardd+0xe8/0x490
Modules linked in: uhci_hcd sr_mod cdrom yenta_socket ehci_pci ehci_hcd 
usbcore usb_common video backlight autofs4
CPU: 0 PID: 185 Comm: pccardd Not tainted 3.19.0-rc4-00143-gbeefabb #2
Hardware name: LENOVO 6464CTO/6464CTO, BIOS 7LETC9WW (2.29 ) 03/18/2011
  ffffffff819e4ac2 ffff8800b845bc58 ffffffff816389cd 0000000000000007
  ffff8800b845bca8 ffff8800b845bc98 ffffffff8105874a ffff880000000000
  ffffffff819e5dab 000000000000026d 0000000000000000 0000000000000080
Call Trace:
  [<ffffffff816389cd>] dump_stack+0x4f/0x7b
  [<ffffffff8105874a>] warn_slowpath_common+0x8a/0xc0
  [<ffffffff810587c6>] warn_slowpath_fmt+0x46/0x50
  [<ffffffff81518538>] ? pccardd+0xe8/0x490
  [<ffffffff81518538>] ? pccardd+0xe8/0x490
  [<ffffffff810840dd>] __might_sleep+0xbd/0xd0
  [<ffffffff8163c4de>] mutex_lock_nested+0x2e/0x440
  [<ffffffff81640ffd>] ? _raw_spin_unlock_irqrestore+0x5d/0x80
  [<ffffffff8108b3db>] ? preempt_count_sub+0xab/0x100
  [<ffffffff815185a0>] pccardd+0x150/0x490
  [<ffffffff81518450>] ? pcmcia_socket_dev_complete+0x40/0x40
  [<ffffffff8107dacf>] kthread+0x11f/0x140
  [<ffffffff8107d9b0>] ? kthread_create_on_node+0x260/0x260
  [<ffffffff81641b6c>] ret_from_fork+0x7c/0xb0
  [<ffffffff8107d9b0>] ? kthread_create_on_node+0x260/0x260
---[ end trace 9a800478929367fe ]---


My HW - Lenovo T61, 4G Ram, C2D, nothing in pcmcia slot is inserted.
Full dmesg and config attached.


Regards

Zdenek

--------------010102040407090307050609
Content-Type: text/plain; charset=UTF-8;
 name="dmesg"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg"

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.19.0-rc4-00143-gbeefabb (kabi@linux) (gcc version 4.9.2 20150107 (Red Hat 4.9.2-5) (GCC) ) #2 SMP PREEMPT Fri Jan 16 00:57:09 CET 2015
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-3.19.0-rc4-00143-gbeefabb root=/dev/sda2 ro selinux=0 kmemleak=off lockdep.prove_locking=0 lockdep.lock_stat=0 systemd.log_level=info systemd.log_target=kmsg quiet console=ttyS0,115200 console=tty LANG=cs_CZ.UTF-8
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bf6affff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bf6b0000-0x00000000bf6cbfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000bf6cc000-0x00000000bf6fffff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000bf700000-0x00000000bfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f3ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec0ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed003ff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed14000-0x00000000fed19fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed8ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000013bffffff] usable
[    0.000000] kmemleak: Kernel memory leak detector disabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: LENOVO 6464CTO/6464CTO, BIOS 7LETC9WW (2.29 ) 03/18/2011
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] AGP: No AGP bridge found
[    0.000000] e820: last_pfn = 0x13c000 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-CFFFF write-protect
[    0.000000]   D0000-DFFFF uncachable
[    0.000000]   E0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0C0000000 mask FC0000000 uncachable
[    0.000000]   1 base 13C000000 mask FFC000000 uncachable
[    0.000000]   2 base 000000000 mask F00000000 write-back
[    0.000000]   3 base 100000000 mask FC0000000 write-back
[    0.000000]   4 base 0BF700000 mask FFFF00000 uncachable
[    0.000000]   5 base 0BF800000 mask FFF800000 uncachable
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] PAT configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- UC  
[    0.000000] original variable MTRRs
[    0.000000] reg 0, base: 3GB, range: 1GB, type UC
[    0.000000] reg 1, base: 5056MB, range: 64MB, type UC
[    0.000000] reg 2, base: 0GB, range: 4GB, type WB
[    0.000000] reg 3, base: 4GB, range: 1GB, type WB
[    0.000000] reg 4, base: 3063MB, range: 1MB, type UC
[    0.000000] reg 5, base: 3064MB, range: 8MB, type UC
[    0.000000] total RAM covered: 4023M
[    0.000000] Found optimal setting for mtrr clean up
[    0.000000]  gran_size: 64K 	chunk_size: 128M 	num_reg: 6  	lose cover RAM: 0G
[    0.000000] New variable MTRRs
[    0.000000] reg 0, base: 0GB, range: 2GB, type WB
[    0.000000] reg 1, base: 2GB, range: 1GB, type WB
[    0.000000] reg 2, base: 3063MB, range: 1MB, type UC
[    0.000000] reg 3, base: 3064MB, range: 8MB, type UC
[    0.000000] reg 4, base: 4GB, range: 1GB, type WB
[    0.000000] reg 5, base: 5056MB, range: 64MB, type UC
[    0.000000] e820: update [mem 0xbf700000-0xffffffff] usable ==> reserved
[    0.000000] e820: last_pfn = 0xbf6b0 max_arch_pfn = 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000f68f0-0x000f68ff] mapped at [ffff8800000f68f0]
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Base memory trampoline at [ffff880000097000] 97000 size 24576
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x02ef7000, 0x02ef7fff] PGTABLE
[    0.000000] BRK [0x02ef8000, 0x02ef8fff] PGTABLE
[    0.000000] BRK [0x02ef9000, 0x02ef9fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x13be00000-0x13bffffff]
[    0.000000]  [mem 0x13be00000-0x13bffffff] page 2M
[    0.000000] BRK [0x02efa000, 0x02efafff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x120000000-0x13bdfffff]
[    0.000000]  [mem 0x120000000-0x13bdfffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x100000000-0x11fffffff]
[    0.000000]  [mem 0x100000000-0x11fffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0xbf6affff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0xbf5fffff] page 2M
[    0.000000]  [mem 0xbf600000-0xbf6affff] page 4k
[    0.000000] RAMDISK: [mem 0x3668c000-0x3733dfff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F68C0 000024 (v02 LENOVO)
[    0.000000] ACPI: XSDT 0x00000000BF6BB496 00009C (v01 LENOVO TP-7U    00002290  LTP 00000000)
[    0.000000] ACPI: FACP 0x00000000BF6BB600 0000F4 (v03 LENOVO TP-7U    00002290 LNVO 00000001)
[    0.000000] ACPI BIOS Warning (bug): 32/64X length mismatch in FADT/Gpe0Block: 64/32 (20141107/tbfadt-618)
[    0.000000] ACPI BIOS Warning (bug): 32/64X length mismatch in FADT/Gpe1Block: 0/32 (20141107/tbfadt-618)
[    0.000000] ACPI BIOS Warning (bug): Optional FADT field Gpe1Block has zero address or length: 0x000000000000102C/0x0 (20141107/tbfadt-649)
[    0.000000] ACPI: DSDT 0x00000000BF6BBA1D 01003C (v01 LENOVO TP-7U    00002290 MSFT 03000000)
[    0.000000] ACPI: FACS 0x00000000BF6E4000 000040
[    0.000000] ACPI: SSDT 0x00000000BF6BB7B4 000269 (v01 LENOVO TP-7U    00002290 MSFT 03000000)
[    0.000000] ACPI: ECDT 0x00000000BF6CBA59 000052 (v01 LENOVO TP-7U    00002290 LNVO 00000001)
[    0.000000] ACPI: TCPA 0x00000000BF6CBAAB 000032 (v02 LENOVO TP-7U    00002290 LNVO 00000001)
[    0.000000] ACPI: APIC 0x00000000BF6CBADD 000068 (v01 LENOVO TP-7U    00002290 LNVO 00000001)
[    0.000000] ACPI: MCFG 0x00000000BF6CBB45 00003C (v01 LENOVO TP-7U    00002290 LNVO 00000001)
[    0.000000] ACPI: HPET 0x00000000BF6CBB81 000038 (v01 LENOVO TP-7U    00002290 LNVO 00000001)
[    0.000000] ACPI: SLIC 0x00000000BF6CBBB9 000176 (v01 LENOVO TP-7U    00002290  LTP 00000000)
[    0.000000] ACPI: SLAC 0x00000000BF6CBDF0 000176 (v01 LENOVO TP-7U    00002290  LTP 00000000)
[    0.000000] ACPI: BOOT 0x00000000BF6CBF66 000028 (v01 LENOVO TP-7U    00002290  LTP 00000001)
[    0.000000] ACPI: ASF! 0x00000000BF6CBF8E 000072 (v16 LENOVO TP-7U    00002290 PTL  00000001)
[    0.000000] ACPI: SSDT 0x00000000BF6E26D9 00025F (v01 LENOVO TP-7U    00002290 INTL 20050513)
[    0.000000] ACPI: SSDT 0x00000000BF6E2938 0000A6 (v01 LENOVO TP-7U    00002290 INTL 20050513)
[    0.000000] ACPI: SSDT 0x00000000BF6E29DE 0004F7 (v01 LENOVO TP-7U    00002290 INTL 20050513)
[    0.000000] ACPI: SSDT 0x00000000BF6E2ED5 0001D8 (v01 LENOVO TP-7U    00002290 INTL 20050513)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] cma: Reserved 16 MiB at 0x000000013ac00000
[    0.000000]  [ffffea0000000000-ffffea0004ffffff] PMD -> [ffff880136400000-ffff88013a3fffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
[    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
[    0.000000]   Normal   [mem 0x100000000-0x13bffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00001000-0x0009cfff]
[    0.000000]   node   0: [mem 0x00100000-0xbf6affff]
[    0.000000]   node   0: [mem 0x100000000-0x13bffffff]
[    0.000000] Initmem setup node 0 [mem 0x00001000-0x13bffffff]
[    0.000000] On node 0 totalpages: 1029708
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 12187 pages used for memmap
[    0.000000]   DMA32 zone: 779952 pages, LIFO batch:31
[    0.000000]   Normal zone: 3840 pages used for memmap
[    0.000000]   Normal zone: 245760 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics stolen memory at 0xbf800000-0xbfffffff
[    0.000000] ACPI: PM-Timer IO Port: 0x1008
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x01] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xbf6b0000-0xbf6cbfff]
[    0.000000] PM: Registered nosave memory: [mem 0xbf6cc000-0xbf6fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xbf700000-0xbfffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xc0000000-0xefffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf0000000-0xf3ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf4000000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec10000-0xfecfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed13fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed14000-0xfed19fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1a000-0xfed1bfff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed8ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed90000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] e820: [mem 0xc0000000-0xefffffff] available for PCI devices
[    0.000000] setup_percpu: NR_CPUS:2 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:1
[    0.000000] PERCPU: Embedded 479 pages/cpu @ffff88013a800000 s1921152 r8192 d32640 u2097152
[    0.000000] pcpu-alloc: s1921152 r8192 d32640 u2097152 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 1013596
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-3.19.0-rc4-00143-gbeefabb root=/dev/sda2 ro selinux=0 kmemleak=off lockdep.prove_locking=0 lockdep.lock_stat=0 systemd.log_level=info systemd.log_target=kmsg quiet console=ttyS0,115200 console=tty LANG=cs_CZ.UTF-8
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] AGP: Checking aperture...
[    0.000000] AGP: No AGP bridge found
[    0.000000] Memory: 3915656K/4118832K available (6428K kernel code, 1052K rwdata, 2664K rodata, 3032K init, 15300K bss, 186792K reserved, 16384K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] 	RCU debugfs-based tracing is enabled.
[    0.000000] 	RCU dyntick-idle grace-period acceleration is enabled.
[    0.000000] 	RCU lockdep checking is enabled.
[    0.000000] 	Additional per-CPU info printed with stalls.
[    0.000000] Running RCU self tests
[    0.000000] NR_IRQS:4352 nr_irqs:440 16
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] console [ttyS0] enabled
[    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.000000] ... MAX_LOCK_DEPTH:          48
[    0.000000] ... MAX_LOCKDEP_KEYS:        8191
[    0.000000] ... CLASSHASH_SIZE:          4096
[    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
[    0.000000] ... CHAINHASH_SIZE:          32768
[    0.000000]  memory used by lock dependency info: 8671 kB
[    0.000000]  per task-struct memory footprint: 2688 bytes
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2194.504 MHz processor
[    0.003355] Calibrating delay loop (skipped), value calculated using timer frequency.. 4390.88 BogoMIPS (lpj=7315013)
[    0.003360] pid_max: default: 32768 minimum: 301
[    0.003375] ACPI: Core revision 20141107
[    0.044503] ACPI: All ACPI Tables successfully acquired
[    0.046762] Security Framework initialized
[    0.046773] SELinux:  Disabled at boot.
[    0.046797] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.046801] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.047487] Initializing cgroup subsys memory
[    0.047501] Initializing cgroup subsys devices
[    0.047515] Initializing cgroup subsys freezer
[    0.047529] Initializing cgroup subsys blkio
[    0.047536] Initializing cgroup subsys net_prio
[    0.047542] Initializing cgroup subsys hugetlb
[    0.047579] CPU: Physical Processor ID: 0
[    0.047581] CPU: Processor Core ID: 0
[    0.047584] mce: CPU supports 6 MCE banks
[    0.047591] CPU0: Thermal monitoring enabled (TM2)
[    0.047599] Last level iTLB entries: 4KB 128, 2MB 4, 4MB 4
Last level dTLB entries: 4KB 256, 2MB 0, 4MB 32, 1GB 0
[    0.047735] Freeing SMP alternatives memory: 20K (ffffffff81fff000 - ffffffff82004000)
[    0.047740] ftrace: allocating 21390 entries in 84 pages
[    0.054239] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.089361] smpboot: CPU0: Intel(R) Core(TM)2 Duo CPU     T7500  @ 2.20GHz (fam: 06, model: 0f, stepping: 0a)
[    0.089999] Performance Events: PEBS fmt0+, 4-deep LBR, Core2 events, Intel PMU driver.
[    0.089999] perf_event_intel: PEBS disabled due to CPU errata
[    0.089999] ... version:                2
[    0.089999] ... bit width:              40
[    0.089999] ... generic registers:      2
[    0.089999] ... value mask:             000000ffffffffff
[    0.089999] ... max period:             000000007fffffff
[    0.089999] ... fixed-purpose events:   3
[    0.089999] ... event mask:             0000000700000003
[    0.106913] x86: Booting SMP configuration:
[    0.106916] .... node  #0, CPUs:      #1
[    0.119999] TSC synchronization [CPU#0 -> CPU#1]:
[    0.119999] Measured 399784 cycles TSC warp between CPUs, turning off TSC clock.
[    0.119999] tsc: Marking TSC unstable due to check_tsc_sync_source failed
[    0.120298] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
[    0.120325] x86: Booted up 1 node, 2 CPUs
[    0.120328] smpboot: Total of 2 processors activated (8781.76 BogoMIPS)
[    0.122802] devtmpfs: initialized
[    0.123726] evm: security.selinux
[    0.123729] evm: security.capability
[    0.123811] PM: Registering ACPI NVS region [mem 0xbf6cc000-0xbf6fffff] (212992 bytes)
[    0.124055] RTC time:  0:03:13, date: 01/16/15
[    0.124323] NET: Registered protocol family 16
[    0.136690] cpuidle: using governor ladder
[    0.150011] cpuidle: using governor menu
[    0.150134] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.150146] ACPI: bus type PCI registered
[    0.150440] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf0000000-0xf3ffffff] (base 0xf0000000)
[    0.150445] PCI: MMCONFIG at [mem 0xf0000000-0xf3ffffff] reserved in E820
[    0.150565] PCI: Using configuration type 1 for base access
[    0.167006] ACPI: Added _OSI(Module Device)
[    0.167006] ACPI: Added _OSI(Processor Device)
[    0.167006] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.167006] ACPI: Added _OSI(Processor Aggregator Device)
[    0.180062] ACPI : EC: EC description table is found, configuring boot EC
[    0.208471] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.220612] ACPI: Dynamic OEM Table Load:
[    0.220648] ACPI: SSDT 0xFFFF8801363B4800 0002C4 (v01 PmRef  Cpu0Ist  00000100 INTL 20050513)
[    0.224448] ACPI: Dynamic OEM Table Load:
[    0.224483] ACPI: SSDT 0xFFFF880136270000 00085E (v01 PmRef  Cpu0Cst  00000100 INTL 20050513)
[    0.229165] ACPI: Dynamic OEM Table Load:
[    0.229198] ACPI: SSDT 0xFFFF88013629A100 0000C8 (v01 PmRef  Cpu1Ist  00000100 INTL 20050513)
[    0.232729] ACPI: Dynamic OEM Table Load:
[    0.232762] ACPI: SSDT 0xFFFF880136102180 000085 (v01 PmRef  Cpu1Cst  00000100 INTL 20050513)
[    0.236812] ACPI: Interpreter enabled
[    0.236821] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S1_] (20141107/hwxface-580)
[    0.236831] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20141107/hwxface-580)
[    0.236882] ACPI: (supports S0 S3 S4 S5)
[    0.236885] ACPI: Using IOAPIC for interrupt routing
[    0.236967] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.252841] ACPI: Power Resource [PUBS] (on)
[    0.253745] acpi PNP0C0A:01: ACPI dock station (docks/bays count: 1)
[    0.261423] acpi LNXIOBAY:00: ACPI dock station (docks/bays count: 2)
[    0.271321] acpi IBM0079:00: ACPI dock station (docks/bays count: 3)
[    0.273849] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 *10 11)
[    0.274278] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 10 *11)
[    0.274704] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 9 10 *11)
[    0.275127] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 9 10 *11)
[    0.275551] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11)
[    0.275975] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 *11)
[    0.276399] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 10 *11)
[    0.276832] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11)
[    0.277233] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.277243] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.279246] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
[    0.279320] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this bridge
[    0.279767] PCI host bridge to bus 0000:00
[    0.279772] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.279776] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
[    0.279779] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
[    0.279783] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
[    0.279786] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff]
[    0.279788] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff]
[    0.279792] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff]
[    0.279795] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff]
[    0.279798] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff]
[    0.279801] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed4bfff]
[    0.279832] pci 0000:00:00.0: [8086:2a00] type 00 class 0x060000
[    0.280283] pci 0000:00:02.0: [8086:2a02] type 00 class 0x030000
[    0.280311] pci 0000:00:02.0: reg 0x10: [mem 0xf8100000-0xf81fffff 64bit]
[    0.280328] pci 0000:00:02.0: reg 0x18: [mem 0xe0000000-0xefffffff 64bit pref]
[    0.280340] pci 0000:00:02.0: reg 0x20: [io  0x1800-0x1807]
[    0.280764] pci 0000:00:02.1: [8086:2a03] type 00 class 0x038000
[    0.280788] pci 0000:00:02.1: reg 0x10: [mem 0xf8200000-0xf82fffff 64bit]
[    0.281331] pci 0000:00:19.0: [8086:1049] type 00 class 0x020000
[    0.281403] pci 0000:00:19.0: reg 0x10: [mem 0xfe000000-0xfe01ffff]
[    0.281437] pci 0000:00:19.0: reg 0x14: [mem 0xfe025000-0xfe025fff]
[    0.281472] pci 0000:00:19.0: reg 0x18: [io  0x1840-0x185f]
[    0.281757] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.281982] pci 0000:00:19.0: System wakeup disabled by ACPI
[    0.282185] pci 0000:00:1a.0: [8086:2834] type 00 class 0x0c0300
[    0.282364] pci 0000:00:1a.0: reg 0x20: [io  0x1860-0x187f]
[    0.282699] pci 0000:00:1a.0: System wakeup disabled by ACPI
[    0.282904] pci 0000:00:1a.1: [8086:2835] type 00 class 0x0c0300
[    0.283082] pci 0000:00:1a.1: reg 0x20: [io  0x1880-0x189f]
[    0.283425] pci 0000:00:1a.1: System wakeup disabled by ACPI
[    0.283668] pci 0000:00:1a.7: [8086:283a] type 00 class 0x0c0320
[    0.283732] pci 0000:00:1a.7: reg 0x10: [mem 0xfe226c00-0xfe226fff]
[    0.284041] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
[    0.284246] pci 0000:00:1a.7: System wakeup disabled by ACPI
[    0.284487] pci 0000:00:1b.0: [8086:284b] type 00 class 0x040300
[    0.284563] pci 0000:00:1b.0: reg 0x10: [mem 0xfe020000-0xfe023fff 64bit]
[    0.284944] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.285190] pci 0000:00:1b.0: System wakeup disabled by ACPI
[    0.285411] pci 0000:00:1c.0: [8086:283f] type 01 class 0x060400
[    0.285805] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.286042] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    0.286265] pci 0000:00:1c.1: [8086:2841] type 01 class 0x060400
[    0.286662] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.286903] pci 0000:00:1c.1: System wakeup disabled by ACPI
[    0.287128] pci 0000:00:1c.2: [8086:2843] type 01 class 0x060400
[    0.287522] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.287760] pci 0000:00:1c.2: System wakeup disabled by ACPI
[    0.287985] pci 0000:00:1d.0: [8086:2830] type 00 class 0x0c0300
[    0.288162] pci 0000:00:1d.0: reg 0x20: [io  0x18a0-0x18bf]
[    0.288768] pci 0000:00:1d.0: System wakeup disabled by ACPI
[    0.288768] pci 0000:00:1d.1: [8086:2831] type 00 class 0x0c0300
[    0.288768] pci 0000:00:1d.1: reg 0x20: [io  0x18c0-0x18df]
[    0.290024] pci 0000:00:1d.1: System wakeup disabled by ACPI
[    0.290230] pci 0000:00:1d.2: [8086:2832] type 00 class 0x0c0300
[    0.290408] pci 0000:00:1d.2: reg 0x20: [io  0x18e0-0x18ff]
[    0.290741] pci 0000:00:1d.2: System wakeup disabled by ACPI
[    0.290985] pci 0000:00:1d.7: [8086:2836] type 00 class 0x0c0320
[    0.291056] pci 0000:00:1d.7: reg 0x10: [mem 0xfe227000-0xfe2273ff]
[    0.291399] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.291612] pci 0000:00:1d.7: System wakeup disabled by ACPI
[    0.291836] pci 0000:00:1e.0: [8086:2448] type 01 class 0x060401
[    0.292273] pci 0000:00:1e.0: System wakeup disabled by ACPI
[    0.292494] pci 0000:00:1f.0: [8086:2811] type 00 class 0x060100
[    0.292790] pci 0000:00:1f.0: can't claim BAR 13 [io  0x1000-0x107f]: address conflict with ACPI CPU throttle [io  0x1010-0x1015]
[    0.292804] pci 0000:00:1f.0: quirk: [io  0x1180-0x11bf] claimed by ICH6 GPIO
[    0.292812] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 1600 (mask 007f)
[    0.292820] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 2 PIO at 15e0 (mask 000f)
[    0.292827] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 3 PIO at 1680 (mask 001f)
[    0.293271] pci 0000:00:1f.1: [8086:2850] type 00 class 0x01018a
[    0.293321] pci 0000:00:1f.1: reg 0x10: [io  0x0000-0x0007]
[    0.293362] pci 0000:00:1f.1: reg 0x14: [io  0x0000-0x0003]
[    0.293397] pci 0000:00:1f.1: reg 0x18: [io  0x0000-0x0007]
[    0.293431] pci 0000:00:1f.1: reg 0x1c: [io  0x0000-0x0003]
[    0.293466] pci 0000:00:1f.1: reg 0x20: [io  0x1c00-0x1c0f]
[    0.293546] pci 0000:00:1f.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
[    0.293549] pci 0000:00:1f.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.293552] pci 0000:00:1f.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
[    0.293555] pci 0000:00:1f.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.293954] pci 0000:00:1f.2: [8086:2829] type 00 class 0x010601
[    0.294035] pci 0000:00:1f.2: reg 0x10: [io  0x1c50-0x1c57]
[    0.294070] pci 0000:00:1f.2: reg 0x14: [io  0x1c44-0x1c47]
[    0.294104] pci 0000:00:1f.2: reg 0x18: [io  0x1c48-0x1c4f]
[    0.294139] pci 0000:00:1f.2: reg 0x1c: [io  0x1c40-0x1c43]
[    0.294173] pci 0000:00:1f.2: reg 0x20: [io  0x1c20-0x1c3f]
[    0.294208] pci 0000:00:1f.2: reg 0x24: [mem 0xfe226000-0xfe2267ff]
[    0.294425] pci 0000:00:1f.2: PME# supported from D3hot
[    0.294829] pci 0000:00:1f.3: [8086:283e] type 00 class 0x0c0500
[    0.294878] pci 0000:00:1f.3: reg 0x10: [mem 0xfe227400-0xfe2274ff]
[    0.295010] pci 0000:00:1f.3: reg 0x20: [io  0x1c60-0x1c7f]
[    0.295713] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.295726] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.295737] pci 0000:00:1c.0:   bridge window [mem 0xfc000000-0xfdffffff]
[    0.295758] pci 0000:00:1c.0:   bridge window [mem 0xf8000000-0xf80fffff 64bit pref]
[    0.296149] pci 0000:03:00.0: [8086:4227] type 00 class 0x028000
[    0.296226] pci 0000:03:00.0: reg 0x10: [mem 0xdf6ff000-0xdf6fffff]
[    0.296765] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.303434] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.303442] pci 0000:00:1c.1:   bridge window [io  0x3000-0x3fff]
[    0.303450] pci 0000:00:1c.1:   bridge window [mem 0xdc100000-0xdf6fffff]
[    0.303461] pci 0000:00:1c.1:   bridge window [mem 0xdfe00000-0xdfefffff 64bit pref]
[    0.303699] pci 0000:00:1c.2: PCI bridge to [bus 04]
[    0.303711] pci 0000:00:1c.2:   bridge window [io  0x4000-0x4fff]
[    0.303723] pci 0000:00:1c.2:   bridge window [mem 0xd8000000-0xd9ffffff]
[    0.303744] pci 0000:00:1c.2:   bridge window [mem 0xdfb00000-0xdfbfffff 64bit pref]
[    0.304000] pci 0000:15:00.0: [1180:0476] type 02 class 0x060700
[    0.304061] pci 0000:15:00.0: proprietary Ricoh MMC controller disabled (via cardbus function)
[    0.304064] pci 0000:15:00.0: MMC cards are now supported by standard SDHCI controller
[    0.304112] pci 0000:15:00.0: reg 0x10: [mem 0xf8300000-0xf8300fff]
[    0.304242] pci 0000:15:00.0: supports D1 D2
[    0.304245] pci 0000:15:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.304533] pci 0000:15:00.2: [1180:0822] type 00 class 0x080500
[    0.304600] pci 0000:15:00.2: reg 0x10: [mem 0xf8301000-0xf83010ff]
[    0.304929] pci 0000:15:00.2: supports D1 D2
[    0.304932] pci 0000:15:00.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.305201] pci 0000:15:00.4: [1180:0592] type 00 class 0x088000
[    0.305270] pci 0000:15:00.4: reg 0x10: [mem 0xf8301800-0xf83018ff]
[    0.305602] pci 0000:15:00.4: supports D1 D2
[    0.305605] pci 0000:15:00.4: PME# supported from D0 D1 D2 D3hot D3cold
[    0.305865] pci 0000:15:00.5: [1180:0852] type 00 class 0x088000
[    0.305932] pci 0000:15:00.5: reg 0x10: [mem 0xf8301c00-0xf8301cff]
[    0.306261] pci 0000:15:00.5: supports D1 D2
[    0.306265] pci 0000:15:00.5: PME# supported from D0 D1 D2 D3hot D3cold
[    0.306659] pci 0000:00:1e.0: PCI bridge to [bus 15-18] (subtractive decode)
[    0.306678] pci 0000:00:1e.0:   bridge window [io  0x6000-0x9fff]
[    0.306691] pci 0000:00:1e.0:   bridge window [mem 0xf8300000-0xfbffffff]
[    0.306711] pci 0000:00:1e.0:   bridge window [mem 0xf4000000-0xf7ffffff 64bit pref]
[    0.306715] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7] (subtractive decode)
[    0.306718] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff] (subtractive decode)
[    0.306722] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
[    0.306725] pci 0000:00:1e.0:   bridge window [mem 0x000d0000-0x000d3fff] (subtractive decode)
[    0.306728] pci 0000:00:1e.0:   bridge window [mem 0x000d4000-0x000d7fff] (subtractive decode)
[    0.306731] pci 0000:00:1e.0:   bridge window [mem 0x000d8000-0x000dbfff] (subtractive decode)
[    0.306734] pci 0000:00:1e.0:   bridge window [mem 0x000dc000-0x000dffff] (subtractive decode)
[    0.306737] pci 0000:00:1e.0:   bridge window [mem 0xc0000000-0xfebfffff] (subtractive decode)
[    0.306740] pci 0000:00:1e.0:   bridge window [mem 0xfed40000-0xfed4bfff] (subtractive decode)
[    0.306950] pci_bus 0000:16: busn_res: can not insert [bus 16-ff] under [bus 15-18] (conflicts with (null) [bus 15-18])
[    0.306961] pci_bus 0000:16: busn_res: [bus 16-ff] end is updated to 17
[    0.307118] pci_bus 0000:00: on NUMA node 0
[    0.307122] acpi PNP0A08:00: Disabling ASPM (FADT indicates it is unsupported)
[    0.311233] ACPI: Enabled 3 GPEs in block 00 to 1F
[    0.311623] ACPI : EC: GPE = 0x12, I/O: command/status = 0x66, data = 0x62
[    0.311936] vgaarb: setting as boot device: PCI:0000:00:02.0
[    0.311936] vgaarb: device added: PCI:0000:00:02.0,decodes=io+mem,owns=io+mem,locks=none
[    0.311936] vgaarb: loaded
[    0.311936] vgaarb: bridge control possible 0000:00:02.0
[    0.311936] SCSI subsystem initialized
[    0.311936] libata version 3.00 loaded.
[    0.311936] PCI: Using ACPI for IRQ routing
[    0.315989] PCI: pci_cache_line_size set to 64 bytes
[    0.316138] e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
[    0.316143] e820: reserve RAM buffer [mem 0xbf6b0000-0xbfffffff]
[    0.316799] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
[    0.316799] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.316799] hpet0: 3 comparators, 64-bit 14.318180 MHz counter
[    0.318892] Switched to clocksource hpet
[    0.370087] pnp: PnP ACPI init
[    0.371912] system 00:00: [mem 0x00000000-0x0009ffff] could not be reserved
[    0.371919] system 00:00: [mem 0x000c0000-0x000c3fff] could not be reserved
[    0.371925] system 00:00: [mem 0x000c4000-0x000c7fff] could not be reserved
[    0.371929] system 00:00: [mem 0x000c8000-0x000cbfff] has been reserved
[    0.371934] system 00:00: [mem 0x000cc000-0x000cffff] has been reserved
[    0.371939] system 00:00: [mem 0x000e0000-0x000e3fff] could not be reserved
[    0.371944] system 00:00: [mem 0x000e4000-0x000e7fff] could not be reserved
[    0.371949] system 00:00: [mem 0x000e8000-0x000ebfff] could not be reserved
[    0.371953] system 00:00: [mem 0x000ec000-0x000effff] could not be reserved
[    0.371958] system 00:00: [mem 0x000f0000-0x000fffff] could not be reserved
[    0.371963] system 00:00: [mem 0x00100000-0xbfffffff] could not be reserved
[    0.371968] system 00:00: [mem 0xfec00000-0xfed3ffff] could not be reserved
[    0.371973] system 00:00: [mem 0xfed4c000-0xffffffff] could not be reserved
[    0.371997] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.372346] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.372352] system 00:01: [io  0x1000-0x107f] could not be reserved
[    0.372357] system 00:01: [io  0x1180-0x11bf] has been reserved
[    0.372362] system 00:01: [io  0x0800-0x080f] has been reserved
[    0.372366] system 00:01: [io  0x15e0-0x15ef] has been reserved
[    0.372371] system 00:01: [io  0x1600-0x165f] could not be reserved
[    0.372376] system 00:01: [mem 0xf0000000-0xf3ffffff] has been reserved
[    0.372380] system 00:01: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.372385] system 00:01: [mem 0xfed14000-0xfed17fff] has been reserved
[    0.372389] system 00:01: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.372393] system 00:01: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.372398] system 00:01: [mem 0xfed45000-0xfed4bfff] has been reserved
[    0.372406] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.372660] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.372795] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.372926] pnp 00:04: Plug and Play ACPI device, IDs IBM0057 PNP0f13 (active)
[    0.374129] pnp 00:05: Plug and Play ACPI device, IDs ATM1200 PNP0c31 (active)
[    0.375429] pnp: PnP ACPI: found 6 devices
[    0.390309] pci 0000:00:1f.0: BAR 13: [io  0x1000-0x107f] has bogus alignment
[    0.390316] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.390322] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.390332] pci 0000:00:1c.0:   bridge window [mem 0xfc000000-0xfdffffff]
[    0.390339] pci 0000:00:1c.0:   bridge window [mem 0xf8000000-0xf80fffff 64bit pref]
[    0.390352] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.390357] pci 0000:00:1c.1:   bridge window [io  0x3000-0x3fff]
[    0.390366] pci 0000:00:1c.1:   bridge window [mem 0xdc100000-0xdf6fffff]
[    0.390374] pci 0000:00:1c.1:   bridge window [mem 0xdfe00000-0xdfefffff 64bit pref]
[    0.390385] pci 0000:00:1c.2: PCI bridge to [bus 04]
[    0.390390] pci 0000:00:1c.2:   bridge window [io  0x4000-0x4fff]
[    0.390399] pci 0000:00:1c.2:   bridge window [mem 0xd8000000-0xd9ffffff]
[    0.390407] pci 0000:00:1c.2:   bridge window [mem 0xdfb00000-0xdfbfffff 64bit pref]
[    0.390423] pci 0000:15:00.0: res[15]=[mem 0x04000000-0x03ffffff pref] get_res_add_size add_size 4000000
[    0.390426] pci 0000:15:00.0: res[16]=[mem 0x04000000-0x03ffffff] get_res_add_size add_size 4000000
[    0.390430] pci 0000:15:00.0: res[13]=[io  0x0100-0x00ff] get_res_add_size add_size 100
[    0.390433] pci 0000:15:00.0: res[14]=[io  0x0100-0x00ff] get_res_add_size add_size 100
[    0.390441] pci 0000:15:00.0: BAR 15: assigned [mem 0xf4000000-0xf7ffffff pref]
[    0.390449] pci 0000:15:00.0: BAR 16: assigned [mem 0xc0000000-0xc3ffffff]
[    0.390452] pci 0000:15:00.0: BAR 13: assigned [io  0x6000-0x60ff]
[    0.390456] pci 0000:15:00.0: BAR 14: assigned [io  0x6400-0x64ff]
[    0.390462] pci 0000:15:00.0: CardBus bridge to [bus 16-17]
[    0.390465] pci 0000:15:00.0:   bridge window [io  0x6000-0x60ff]
[    0.390473] pci 0000:15:00.0:   bridge window [io  0x6400-0x64ff]
[    0.390481] pci 0000:15:00.0:   bridge window [mem 0xf4000000-0xf7ffffff pref]
[    0.390489] pci 0000:15:00.0:   bridge window [mem 0xc0000000-0xc3ffffff]
[    0.390498] pci 0000:00:1e.0: PCI bridge to [bus 15-18]
[    0.390503] pci 0000:00:1e.0:   bridge window [io  0x6000-0x9fff]
[    0.390512] pci 0000:00:1e.0:   bridge window [mem 0xf8300000-0xfbffffff]
[    0.390519] pci 0000:00:1e.0:   bridge window [mem 0xf4000000-0xf7ffffff 64bit pref]
[    0.390531] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
[    0.390535] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
[    0.390537] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
[    0.390540] pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000d3fff]
[    0.390543] pci_bus 0000:00: resource 8 [mem 0x000d4000-0x000d7fff]
[    0.390546] pci_bus 0000:00: resource 9 [mem 0x000d8000-0x000dbfff]
[    0.390549] pci_bus 0000:00: resource 10 [mem 0x000dc000-0x000dffff]
[    0.390551] pci_bus 0000:00: resource 11 [mem 0xc0000000-0xfebfffff]
[    0.390554] pci_bus 0000:00: resource 12 [mem 0xfed40000-0xfed4bfff]
[    0.390557] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    0.390560] pci_bus 0000:02: resource 1 [mem 0xfc000000-0xfdffffff]
[    0.390563] pci_bus 0000:02: resource 2 [mem 0xf8000000-0xf80fffff 64bit pref]
[    0.390566] pci_bus 0000:03: resource 0 [io  0x3000-0x3fff]
[    0.390569] pci_bus 0000:03: resource 1 [mem 0xdc100000-0xdf6fffff]
[    0.390572] pci_bus 0000:03: resource 2 [mem 0xdfe00000-0xdfefffff 64bit pref]
[    0.390575] pci_bus 0000:04: resource 0 [io  0x4000-0x4fff]
[    0.390577] pci_bus 0000:04: resource 1 [mem 0xd8000000-0xd9ffffff]
[    0.390580] pci_bus 0000:04: resource 2 [mem 0xdfb00000-0xdfbfffff 64bit pref]
[    0.390583] pci_bus 0000:15: resource 0 [io  0x6000-0x9fff]
[    0.390586] pci_bus 0000:15: resource 1 [mem 0xf8300000-0xfbffffff]
[    0.390589] pci_bus 0000:15: resource 2 [mem 0xf4000000-0xf7ffffff 64bit pref]
[    0.390592] pci_bus 0000:15: resource 4 [io  0x0000-0x0cf7]
[    0.390595] pci_bus 0000:15: resource 5 [io  0x0d00-0xffff]
[    0.390597] pci_bus 0000:15: resource 6 [mem 0x000a0000-0x000bffff]
[    0.390600] pci_bus 0000:15: resource 7 [mem 0x000d0000-0x000d3fff]
[    0.390603] pci_bus 0000:15: resource 8 [mem 0x000d4000-0x000d7fff]
[    0.390606] pci_bus 0000:15: resource 9 [mem 0x000d8000-0x000dbfff]
[    0.390608] pci_bus 0000:15: resource 10 [mem 0x000dc000-0x000dffff]
[    0.390611] pci_bus 0000:15: resource 11 [mem 0xc0000000-0xfebfffff]
[    0.390614] pci_bus 0000:15: resource 12 [mem 0xfed40000-0xfed4bfff]
[    0.390617] pci_bus 0000:16: resource 0 [io  0x6000-0x60ff]
[    0.390620] pci_bus 0000:16: resource 1 [io  0x6400-0x64ff]
[    0.390622] pci_bus 0000:16: resource 2 [mem 0xf4000000-0xf7ffffff pref]
[    0.390625] pci_bus 0000:16: resource 3 [mem 0xc0000000-0xc3ffffff]
[    0.390708] NET: Registered protocol family 2
[    0.391270] TCP established hash table entries: 32768 (order: 6, 262144 bytes)
[    0.391583] TCP bind hash table entries: 32768 (order: 9, 2621440 bytes)
[    0.394280] TCP: Hash tables configured (established 32768 bind 32768)
[    0.394399] TCP: reno registered
[    0.394425] UDP hash table entries: 2048 (order: 6, 393216 bytes)
[    0.394787] UDP-Lite hash table entries: 2048 (order: 6, 393216 bytes)
[    0.395384] NET: Registered protocol family 1
[    0.395420] pci 0000:00:02.0: Video device with shadowed ROM
[    0.399719] PCI: CLS mismatch (64 != 32), using 64 bytes
[    0.399948] Trying to unpack rootfs image as initramfs...
[    0.770561] Freeing initrd memory: 13000K (ffff88003668c000 - ffff88003733e000)
[    0.795694] DMA-API: preallocated 65536 debug entries
[    0.795700] DMA-API: debugging enabled by kernel config
[    0.795706] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.795710] software IO TLB [mem 0xbb6b0000-0xbf6b0000] (64MB) mapped at [ffff8800bb6b0000-ffff8800bf6affff]
[    0.795789] Simple Boot Flag at 0x35 set to 0x1
[    0.796376] Scanning for low memory corruption every 60 seconds
[    0.797777] futex hash table entries: 512 (order: 4, 65536 bytes)
[    0.797837] Initialise system trusted keyring
[    0.797919] audit: initializing netlink subsys (disabled)
[    0.798014] audit: type=2000 audit(1421366593.796:1): initialized
[    0.798928] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.809133] page_owner is disabled
[    0.813104] bounce: pool size: 64 pages
[    0.813139] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    0.813259] io scheduler noop registered
[    0.813264] io scheduler deadline registered (default)
[    0.815854] pcieport 0000:00:1c.0: Signaling PME through PCIe PME interrupt
[    0.815864] pcie_pme 0000:00:1c.0:pcie01: service driver pcie_pme loaded
[    0.815931] pcieport 0000:00:1c.1: Signaling PME through PCIe PME interrupt
[    0.815934] pci 0000:03:00.0: Signaling PME through PCIe PME interrupt
[    0.815942] pcie_pme 0000:00:1c.1:pcie01: service driver pcie_pme loaded
[    0.816005] pcieport 0000:00:1c.2: Signaling PME through PCIe PME interrupt
[    0.816014] pcie_pme 0000:00:1c.2:pcie01: service driver pcie_pme loaded
[    0.816038] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.816866] ACPI: AC Adapter [AC] (on-line)
[    0.817407] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    0.817613] ACPI: Lid Switch [LID]
[    0.817814] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    0.817836] ACPI: Sleep Button [SLPB]
[    0.818067] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    0.818074] ACPI: Power Button [PWRF]
[    0.825062] Monitor-Mwait will be used to enter C-1 state
[    0.825081] Monitor-Mwait will be used to enter C-2 state
[    0.825098] Monitor-Mwait will be used to enter C-3 state
[    0.825131] ACPI: acpi_idle registered with cpuidle
[    0.830226] thermal LNXTHERM:00: registered as thermal_zone0
[    0.830230] ACPI: Thermal Zone [THM0] (50 C)
[    0.832732] thermal LNXTHERM:01: registered as thermal_zone1
[    0.832736] ACPI: Thermal Zone [THM1] (46 C)
[    0.833504] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.835436] Linux agpgart interface v0.103
[    0.835901] agpgart-intel 0000:00:00.0: Intel 965GM Chipset
[    0.835945] agpgart-intel 0000:00:00.0: detected gtt size: 524288K total, 262144K mappable
[    0.837058] agpgart-intel 0000:00:00.0: detected 8192K stolen memory
[    0.837329] agpgart-intel 0000:00:00.0: AGP aperture is 256M @ 0xe0000000
[    0.846213] brd: module loaded
[    0.846723] ahci 0000:00:1f.2: version 3.0
[    0.847372] ahci 0000:00:1f.2: AHCI 0001.0100 32 slots 3 ports 3 Gbps 0x5 impl SATA mode
[    0.847378] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ccc 
[    0.851133] scsi host0: ahci
[    0.851745] scsi host1: ahci
[    0.852023] ACPI: Battery Slot [BAT0] (battery present)
[    0.852168] scsi host2: ahci
[    0.852450] ata1: SATA max UDMA/133 abar m2048@0xfe226000 port 0xfe226100 irq 27
[    0.852453] ata2: DUMMY
[    0.852456] ata3: SATA max UDMA/133 abar m2048@0xfe226000 port 0xfe226200 irq 27
[    0.852578] ata_piix 0000:00:1f.1: version 2.13
[    0.855170] scsi host3: ata_piix
[    0.855613] scsi host4: ata_piix
[    0.855839] ata4: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x1c00 irq 14
[    0.855842] ata5: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x1c08 irq 15
[    0.856063] ata5: port disabled--ignoring
[    0.856115] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[    0.864822] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.865025] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.865341] mousedev: PS/2 mouse device common for all mice
[    0.865536] rtc_cmos 00:02: RTC can wake from S4
[    0.865876] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    0.865919] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    0.865967] hdaps: inverting axis (3) readings
[    0.865969] hdaps: LENOVO ThinkPad T61 detected
[    0.866938] input: hdaps as /devices/platform/hdaps/input/input4
[    0.866943] hdaps: driver successfully loaded
[    0.867029] TCP: cubic registered
[    0.867036] NET: Registered protocol family 17
[    0.867073] Key type dns_resolver registered
[    0.868130] Loading compiled-in X.509 certificates
[    0.868174] registered taskstats version 1
[    0.871984] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    0.880913] Key type encrypted registered
[    0.880923] evm: HMAC attrs: 0x1
[    0.880925] evm: Error registering secfs
[    0.882037]   Magic number: 15:678:51
[    0.882199] rtc_cmos 00:02: setting system clock to 2015-01-16 00:03:14 UTC (1421366594)
[    0.888515] PM: Hibernation image not present or could not be loaded.
[    1.020734] ata4.00: ATAPI: MATSHITADVD-RAM UJ-842 z, RC01, max UDMA/33
[    1.033908] ata4.00: configured for UDMA/33
[    1.170156] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.171686] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succeeded
[    1.171699] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
[    1.171708] ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
[    1.172236] ata1.00: ATA-9: SAMSUNG SSD 830 Series, CXM03B1Q, max UDMA/133
[    1.172248] ata1.00: 500118192 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
[    1.173656] ata3: SATA link down (SStatus 0 SControl 300)
[    1.173727] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 (SET FEATURES) succeeded
[    1.173740] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
[    1.173750] ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
[    1.174299] ata1.00: configured for UDMA/133
[    1.175140] scsi 0:0:0:0: Direct-Access     ATA      SAMSUNG SSD 830  3B1Q PQ: 0 ANSI: 5
[    1.177173] sd 0:0:0:0: [sda] 500118192 512-byte logical blocks: (256 GB/238 GiB)
[    1.177818] sd 0:0:0:0: [sda] Write Protect is off
[    1.177830] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.178022] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.179468] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.181372]  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
[    1.182216] scsi 3:0:0:0: CD-ROM            MATSHITA DVD-RAM UJ-842 z RC01 PQ: 0 ANSI: 5
[    1.184382] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.192073] scsi 3:0:0:0: Attached scsi generic sg1 type 5
[    1.196175] Freeing unused kernel memory: 3032K (ffffffff81d09000 - ffffffff81fff000)
[    1.196183] Write protecting the kernel read-only data: 12288k
[    1.199886] Freeing unused kernel memory: 1752K (ffff88000164a000 - ffff880001800000)
[    1.202025] Freeing unused kernel memory: 1432K (ffff880001a9a000 - ffff880001c00000)
[    1.213845] systemd[1]: Inserted module 'autofs4'
[    1.214016] systemd[1]: Module 'ipv6' is blacklisted
[    1.216667] random: systemd urandom read with 8 bits of entropy available
[    1.221286] systemd[1]: systemd 218 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    1.222225] systemd[1]: Detected architecture 'x86-64'.
[    1.222242] systemd[1]: Running in initial RAM disk.
[    1.222388] systemd[1]: Set hostname to <linux>.
[    1.463848] systemd-sysctl[111]: Overwriting earlier assignment of kernel/sysrq in file '/etc/sysctl.d/99-sysctl.conf'.
[    1.464117] systemd-sysctl[111]: Overwriting earlier assignment of kernel/core_pattern in file '/etc/sysctl.d/mysysctl.conf'.
[    1.516847] audit: type=1130 audit(1421366595.133:2): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.727177] audit: type=1130 audit(1421366595.343:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.758848] audit: type=1130 audit(1421366595.373:4): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.781846] systemd-udevd[155]: starting version 218
[    1.790322] audit: type=1130 audit(1421366595.406:5): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.883027] audit: type=1130 audit(1421366595.496:6): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-vconsole-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.008887] audit: type=1130 audit(1421366595.623:7): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.091158] ACPI: bus type USB registered
[    2.091633] usbcore: registered new interface driver usbfs
[    2.092201] usbcore: registered new interface driver hub
[    2.099036] usbcore: registered new device driver usb
[    2.101130] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.102263] ehci-pci: EHCI PCI platform driver
[    2.106635] audit: type=1130 audit(1421366595.719:8): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.119701] ehci-pci 0000:00:1a.7: EHCI Host Controller
[    2.120368] ehci-pci 0000:00:1a.7: new USB bus registered, assigned bus number 1
[    2.125614] ehci-pci 0000:00:1a.7: cache line size of 64 is not supported
[    2.126159] ehci-pci 0000:00:1a.7: irq 22, io mem 0xfe226c00
[    2.132991] pci 0000:00:1e.0: enabling device (0005 -> 0007)
[    2.136362] yenta_cardbus 0000:15:00.0: CardBus bridge found [17aa:20c6]
[    2.143130] ehci-pci 0000:00:1a.7: USB 2.0 started, EHCI 1.00
[    2.153428] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    2.153899] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.155472] usb usb1: Product: EHCI Host Controller
[    2.157653] usb usb1: Manufacturer: Linux 3.19.0-rc4-00143-gbeefabb ehci_hcd
[    2.158135] usb usb1: SerialNumber: 0000:00:1a.7
[    2.163900] sr 3:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[    2.164506] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.167203] sr 3:0:0:0: Attached scsi CD-ROM sr0
[    2.175757] hub 1-0:1.0: USB hub found
[    2.176124] hub 1-0:1.0: 4 ports detected
[    2.183185] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    2.183627] ehci-pci 0000:00:1d.7: new USB bus registered, assigned bus number 2
[    2.184188] ehci-pci 0000:00:1d.7: debug port 1
[    2.190273] ehci-pci 0000:00:1d.7: cache line size of 64 is not supported
[    2.192039] ehci-pci 0000:00:1d.7: irq 19, io mem 0xfe227000
[    2.204776] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    2.207713] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[    2.208209] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.208728] usb usb2: Product: EHCI Host Controller
[    2.209086] usb usb2: Manufacturer: Linux 3.19.0-rc4-00143-gbeefabb ehci_hcd
[    2.209563] usb usb2: SerialNumber: 0000:00:1d.7
[    2.230760] hub 2-0:1.0: USB hub found
[    2.231812] hub 2-0:1.0: 6 ports detected
[    2.250798] uhci_hcd: USB Universal Host Controller Interface driver
[    2.251956] uhci_hcd 0000:00:1a.0: UHCI Host Controller
[    2.252376] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
[    2.252919] uhci_hcd 0000:00:1a.0: detected 2 ports
[    2.259512] uhci_hcd 0000:00:1a.0: irq 20, io base 0x00001860
[    2.262835] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[    2.263610] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.271625] yenta_cardbus 0000:15:00.0: ISA IRQ mask 0x0cb8, PCI irq 16
[    2.272089] yenta_cardbus 0000:15:00.0: Socket status: 30000006
[    2.272622] yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge window: [io  0x6000-0x9fff]
[    2.273229] yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge window: [mem 0xf8300000-0xfbffffff]
[    2.276039] pcmcia_socket pcmcia_socket0: cs: memory probe 0xf8300000-0xfbffffff:
[    2.276584]  excluding 0xf8300000-0xf86cffff
[    2.277406] yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge window: [mem 0xf4000000-0xf7ffffff 64bit pref]
[    2.278105] pcmcia_socket pcmcia_socket0: cs: memory probe 0xf4000000-0xf7ffffff:
[    2.278675]  excluding 0xf4000000-0xf7ffffff
[    2.283655] usb usb3: Product: UHCI Host Controller
[    2.284083] usb usb3: Manufacturer: Linux 3.19.0-rc4-00143-gbeefabb uhci_hcd
[    2.284574] usb usb3: SerialNumber: 0000:00:1a.0
[    2.303121] hub 3-0:1.0: USB hub found
[    2.305959] hub 3-0:1.0: 2 ports detected
[    2.312487] uhci_hcd 0000:00:1a.1: UHCI Host Controller
[    2.312905] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
[    2.322459] uhci_hcd 0000:00:1a.1: detected 2 ports
[    2.324770] uhci_hcd 0000:00:1a.1: irq 21, io base 0x00001880
[    2.343521] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
[    2.343992] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.344508] usb usb4: Product: UHCI Host Controller
[    2.344867] usb usb4: Manufacturer: Linux 3.19.0-rc4-00143-gbeefabb uhci_hcd
[    2.345345] usb usb4: SerialNumber: 0000:00:1a.1
[    2.352610] hub 4-0:1.0: USB hub found
[    2.365684] hub 4-0:1.0: 2 ports detected
[    2.368212] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    2.368632] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 5
[    2.369175] uhci_hcd 0000:00:1d.0: detected 2 ports
[    2.369577] uhci_hcd 0000:00:1d.0: irq 16, io base 0x000018a0
[    2.370581] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001
[    2.371052] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.371574] usb usb5: Product: UHCI Host Controller
[    2.371936] usb usb5: Manufacturer: Linux 3.19.0-rc4-00143-gbeefabb uhci_hcd
[    2.372423] usb usb5: SerialNumber: 0000:00:1d.0
[    2.399672] hub 5-0:1.0: USB hub found
[    2.401851] hub 5-0:1.0: 2 ports detected
[    2.410192] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    2.410620] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 6
[    2.411165] uhci_hcd 0000:00:1d.1: detected 2 ports
[    2.411620] uhci_hcd 0000:00:1d.1: irq 17, io base 0x000018c0
[    2.421200] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
[    2.421687] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.422219] usb usb6: Product: UHCI Host Controller
[    2.422589] usb usb6: Manufacturer: Linux 3.19.0-rc4-00143-gbeefabb uhci_hcd
[    2.423078] usb usb6: SerialNumber: 0000:00:1d.1
[    2.437351] hub 6-0:1.0: USB hub found
[    2.437712] hub 6-0:1.0: 2 ports detected
[    2.445685] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    2.445722] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 7
[    2.445749] uhci_hcd 0000:00:1d.2: detected 2 ports
[    2.445857] uhci_hcd 0000:00:1d.2: irq 18, io base 0x000018e0
[    2.455541] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001
[    2.456039] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.456559] usb usb7: Product: UHCI Host Controller
[    2.457198] usb usb7: Manufacturer: Linux 3.19.0-rc4-00143-gbeefabb uhci_hcd
[    2.458045] usb usb7: SerialNumber: 0000:00:1d.2
[    2.465761] hub 7-0:1.0: USB hub found
[    2.468229] hub 7-0:1.0: 2 ports detected
[    2.469310] audit: type=1130 audit(1421366596.083:9): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-fsck@dev-sda2 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
------------[ cut here ]------------
WARNING: CPU: 0 PID: 185 at kernel/sched/core.c:7300 __might_sleep+0xbd/0xd0()
do not call blocking ops when !TASK_RUNNING; state=1 set at [<ffffffff81518538>] pccardd+0xe8/0x490
Modules linked in: uhci_hcd sr_mod cdrom yenta_socket ehci_pci ehci_hcd usbcore usb_common video backlight autofs4
CPU: 0 PID: 185 Comm: pccardd Not tainted 3.19.0-rc4-00143-gbeefabb #2
Hardware name: LENOVO 6464CTO/6464CTO, BIOS 7LETC9WW (2.29 ) 03/18/2011
 ffffffff819e4ac2 ffff8800b845bc58 ffffffff816389cd 0000000000000007
 ffff8800b845bca8 ffff8800b845bc98 ffffffff8105874a ffff880000000000
 ffffffff819e5dab 000000000000026d 0000000000000000 0000000000000080
Call Trace:
 [<ffffffff816389cd>] dump_stack+0x4f/0x7b
 [<ffffffff8105874a>] warn_slowpath_common+0x8a/0xc0
 [<ffffffff810587c6>] warn_slowpath_fmt+0x46/0x50
 [<ffffffff81518538>] ? pccardd+0xe8/0x490
 [<ffffffff81518538>] ? pccardd+0xe8/0x490
 [<ffffffff810840dd>] __might_sleep+0xbd/0xd0
 [<ffffffff8163c4de>] mutex_lock_nested+0x2e/0x440
 [<ffffffff81640ffd>] ? _raw_spin_unlock_irqrestore+0x5d/0x80
 [<ffffffff8108b3db>] ? preempt_count_sub+0xab/0x100
 [<ffffffff815185a0>] pccardd+0x150/0x490
 [<ffffffff81518450>] ? pcmcia_socket_dev_complete+0x40/0x40
 [<ffffffff8107dacf>] kthread+0x11f/0x140
 [<ffffffff8107d9b0>] ? kthread_create_on_node+0x260/0x260
 [<ffffffff81641b6c>] ret_from_fork+0x7c/0xb0
 [<ffffffff8107d9b0>] ? kthread_create_on_node+0x260/0x260
---[ end trace 9a800478929367fe ]---
[    2.555726] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
[    2.695791] pcmcia_socket pcmcia_socket0: cs: memory probe 0x0c0000-0x0fffff:
[    2.696305]  excluding 0xc0000-0xcffff 0xe0000-0xfffff
[    2.698098] pcmcia_socket pcmcia_socket0: cs: memory probe 0xa0000000-0xa0ffffff:
[    2.698682]  excluding 0xa0000000-0xa0ffffff
[    2.699428] pcmcia_socket pcmcia_socket0: cs: memory probe 0x60000000-0x60ffffff:
[    2.702222]  excluding 0x60000000-0x60ffffff
[    2.746887] usb 3-1: new full-speed USB device number 2 using uhci_hcd
[    2.910888] usb 3-1: New USB device found, idVendor=0a5c, idProduct=2110
[    2.911357] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.911839] usb 3-1: Product: BCM2045B
[    2.912133] usb 3-1: Manufacturer: Broadcom Corp
[    3.149572] usb 3-2: new full-speed USB device number 3 using uhci_hcd
[    3.164413] audit: type=1130 audit(1421366596.779:10): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=initrd-parse-etc comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.319929] usb 3-2: New USB device found, idVendor=0483, idProduct=2016
[    3.321052] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.321536] usb 3-2: Product: Biometric Coprocessor
[    3.321901] usb 3-2: Manufacturer: STMicroelectronics
[    4.077611] systemd[1]: Module 'ipv6' is blacklisted
[    4.098629] systemd[1]: systemd 218 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    4.100441] systemd[1]: Detected architecture 'x86-64'.
[    4.103960] systemd[1]: Set hostname to <linux>.
[    4.847608] RPC: Registered named UNIX socket transport module.
[    4.848028] RPC: Registered udp transport module.
[    4.848375] RPC: Registered tcp transport module.
[    4.848721] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    4.978797] systemd[1]: Dependency failed for pNFS block layout mapping daemon.
[    5.021423] systemd-sysctl[289]: Overwriting earlier assignment of kernel/sysrq in file '/etc/sysctl.d/99-sysctl.conf'.
[    5.023553] systemd-sysctl[289]: Overwriting earlier assignment of kernel/core_pattern in file '/etc/sysctl.d/mysysctl.conf'.
[    5.241046] loop: module loaded
[    5.385163] EXT4-fs (sda2): re-mounted. Opts: data=ordered
[    5.692409] systemd-udevd[336]: starting version 218
[    5.726000] random: nonblocking pool is initialized
[    5.821739] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    5.893970] audit_printk_skb: 129 callbacks suppressed
[    5.894356] audit: type=1130 audit(1421366599.509:54): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.159623] audit: type=1130 audit(1421366599.773:55): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journal-flush comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.437453] Non-volatile memory driver v1.3
[    6.459087] thinkpad_acpi: ThinkPad ACPI Extras v0.25
[    6.459461] thinkpad_acpi: http://ibm-acpi.sf.net/
[    6.459813] thinkpad_acpi: ThinkPad BIOS 7LETC9WW (2.29 ), EC 7KHT24WW-1.08
[    6.480638] thinkpad_acpi: Lenovo ThinkPad T61, model 6464CTO
[    6.513597] wmi: Mapper loaded
[    6.527127] thinkpad_acpi: detected a 16-level brightness capable ThinkPad
[    6.570265] thinkpad_acpi: ACPI backlight control delay disabled
[    6.572006] thinkpad_acpi: radio switch found; radios are enabled
[    6.573056] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
[    6.576559] pps_core: LinuxPPS API ver. 1 registered
[    6.587521] thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
[    6.590076] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    6.620530] PTP clock support registered
[    6.702870] e1000e: Intel(R) PRO/1000 Network Driver - 2.3.2-k
[    6.703269] e1000e: Copyright(c) 1999 - 2014 Intel Corporation.
[    6.738328] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[    6.747020] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
[    6.800764] thinkpad_acpi: Cannot enable backlight brightness support, ACPI is already handling it.  Refer to the acpi_backlight kernel parameter.
[    6.913844] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input6
[    7.041903] cfg80211: Calling CRDA to update world regulatory domain
[    7.151556] sdhci: Secure Digital Host Controller Interface driver
[    7.151994] sdhci: Copyright(c) Pierre Ossman
[    7.160352] sdhci-pci 0000:15:00.2: SDHCI controller found [1180:0822] (rev 21)
[    7.162304] sdhci-pci 0000:15:00.2: Will use DMA mode even though HW doesn't fully claim to support it.
[    7.162962] sdhci-pci 0000:15:00.2: No vmmc regulator found
[    7.186770] sdhci-pci 0000:15:00.2: No vqmmc regulator found
[    7.188194] sdhci-pci 0000:15:00.2: Will use DMA mode even though HW doesn't fully claim to support it.
[    7.241761] sdhci-pci 0000:15:00.2: Will use DMA mode even though HW doesn't fully claim to support it.
[    7.248169] mmc0: SDHCI controller on PCI [0000:15:00.2] using DMA
[    7.267037] r592: driver successfully loaded
[    7.273614] r852: driver loaded successfully
[    7.315115] pcmcia_socket pcmcia_socket0: cs: memory probe 0x0c0000-0x0fffff:
[    7.315627]  excluding 0xc0000-0xcffff 0xe0000-0xfffff
[    7.316521] pcmcia_socket pcmcia_socket0: cs: memory probe 0xa0000000-0xa0ffffff:
[    7.362625]  excluding 0xa0000000-0xa0ffffff
[    7.363616] pcmcia_socket pcmcia_socket0: cs: memory probe 0x60000000-0x60ffffff:
[    7.364201]  excluding 0x60000000-0x60ffffff
[    7.392646] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1) 00:1c:25:14:4a:e2
[    7.393260] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connection
[    7.393803] e1000e 0000:00:19.0 eth0: MAC: 6, PHY: 6, PBA No: FFFFFF-0FF
[    7.394747] ACPI Warning: SystemIO range 0x0000000000001028-0x000000000000102f conflicts with OpRegion 0x0000000000001000-0x000000000000107f (\_SB_.PCI0.LPC_.PMIO) (20141107/utaddress-258)
[    7.395962] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    7.396654] ACPI Warning: SystemIO range 0x00000000000011b0-0x00000000000011bf conflicts with OpRegion 0x0000000000001180-0x00000000000011bf (\_SB_.PCI0.LPC_.LPIO) (20141107/utaddress-258)
[    7.398044] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    7.398722] ACPI Warning: SystemIO range 0x0000000000001180-0x00000000000011af conflicts with OpRegion 0x0000000000001180-0x00000000000011bf (\_SB_.PCI0.LPC_.LPIO) (20141107/utaddress-258)
[    7.399909] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    7.409462] lpc_ich: Resource conflict(s) found affecting gpio_ich
[    7.424529] snd_hda_intel 0000:00:1b.0: probe_mask set to 0x1 for device 17aa:20ac
[    7.470929] Bluetooth: Core ver 2.20
[    7.471277] NET: Registered protocol family 31
[    7.471612] Bluetooth: HCI device and connection manager initialized
[    7.472109] Bluetooth: HCI socket layer initialized
[    7.472477] Bluetooth: L2CAP socket layer initialized
[    7.472904] Bluetooth: SCO socket layer initialized
[    7.503953] usbcore: registered new interface driver btusb
[    7.608825] iwl3945: Intel(R) PRO/Wireless 3945ABG/BG Network Connection driver for Linux, in-tree:ds
[    7.609450] iwl3945: Copyright(c) 2003-2011 Intel Corporation
[    7.618570] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    7.624298] iwl3945 0000:03:00.0: can't disable ASPM; OS doesn't have ASPM control
[    7.680552] microcode: CPU0 sig=0x6fa, pf=0x80, revision=0x95
[    7.717220] microcode: CPU1 sig=0x6fa, pf=0x80, revision=0x95
[    7.721457] microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
[    7.892586] sound hdaudioC0D0: autoconfig: line_outs=1 (0x12/0x0/0x0/0x0/0x0) type:speaker
[    7.893162] sound hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    7.893633] sound hdaudioC0D0:    hp_outs=1 (0x11/0x0/0x0/0x0/0x0)
[    7.894065] sound hdaudioC0D0:    mono: mono_out=0x0
[    7.894424] sound hdaudioC0D0:    dig-out=0x1b/0x0
[    7.894778] sound hdaudioC0D0:    inputs:
[    7.895093] sound hdaudioC0D0:      Internal Mic=0x15
[    7.895465] sound hdaudioC0D0:      Mic=0x14
[    7.895795] sound hdaudioC0D0:      Dock Mic=0x1c
[    7.919519] input: HDA Intel Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input8
[    7.921792] input: HDA Intel Dock Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input9
[    7.923760] input: HDA Intel Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
[    8.205010] audit: type=1130 audit(1421366601.819:56): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-fsck@dev-sda6 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    8.296783] audit: type=1130 audit(1421366601.909:57): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-fsck@dev-sda1 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    8.371492] EXT4-fs (sda6): mounted filesystem with ordered data mode. Opts: data=ordered,user_xattr
[    8.423471] psmouse serio1: synaptics: Touchpad model: 1, fw: 6.2, id: 0x81a0b1, caps: 0xa04793/0x300000/0x0, board id: 71, fw id: 67352
[    8.424277] psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/serio1/input0
[    8.448833] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: data=ordered
[    8.472731] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input7
[    8.477433] iwl3945 0000:03:00.0: Tunable channels: 13 802.11bg, 23 802.11a channels
[    8.477982] iwl3945 0000:03:00.0: Detected Intel Wireless WiFi Link 3945ABG

--------------010102040407090307050609
Content-Type: text/plain; charset=UTF-8;
 name="config"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="config"

CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_CUSTOM_METHOD=m
CONFIG_ACPI_DEBUG=y
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_FAN=y
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_TOSHIBA=m
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_WMI=m
CONFIG_ACPI=y
CONFIG_AC97_BUS=m
CONFIG_ADVISE_SYSCALLS=y
CONFIG_AGP_AMD64=y
CONFIG_AGP_INTEL=y
CONFIG_AGP=y
CONFIG_AIO=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_AMD_NB=y
CONFIG_AMIGA_PARTITION=y
CONFIG_ANON_INODES=y
CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
CONFIG_ARCH_DISCARD_MEMBLOCK=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
CONFIG_ARCH_HAS_SG_CHAIN=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_HWEIGHT_CFLAGS="-fcall-saved-rdi -fcall-saved-rsi -fcall-saved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -fcall-saved-r11"
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ARCH_RANDOM=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_USE_QUEUE_RWLOCK=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_ASYNC_XOR=m
CONFIG_ATA_ACPI=y
CONFIG_ATA_BMDMA=y
CONFIG_ATA_PIIX=y
CONFIG_ATA_SFF=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA=y
CONFIG_AUDIT_ARCH=y
CONFIG_AUDITSYSCALL=y
CONFIG_AUDIT_TREE=y
CONFIG_AUDIT_WATCH=y
CONFIG_AUDIT=y
CONFIG_AUTOFS4_FS=m
CONFIG_AVERAGE=y
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_BACKLIGHT_GENERIC=m
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_BASE_FULL=y
CONFIG_BASE_SMALL=0
CONFIG_BCACHE=m
CONFIG_BCMA_POSSIBLE=y
CONFIG_BINARY_PRINTF=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_MISC=m
CONFIG_BINFMT_SCRIPT=y
CONFIG_BITREVERSE=y
CONFIG_BLK_CGROUP=y
CONFIG_BLK_CMDLINE_PARSER=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_CRYPTOLOOP=m
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_BLK_DEV_DRBD=m
CONFIG_BLK_DEV_FD=m
CONFIG_BLK_DEV_INITRD=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
CONFIG_BLK_DEV_MD=m
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=8192
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_SD=y
CONFIG_BLK_DEV_SR=m
CONFIG_BLK_DEV_SR_VENDOR=y
CONFIG_BLK_DEV_THROTTLING=y
CONFIG_BLK_DEV=y
CONFIG_BLOCK_COMPAT=y
CONFIG_BLOCK=y
CONFIG_BMP085_I2C=m
CONFIG_BMP085=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=0
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_BOUNCE=y
CONFIG_BPF=y
CONFIG_BQL=y
CONFIG_BRANCH_PROFILE_NONE=y
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE=m
CONFIG_BRIDGE_NETFILTER=m
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BT_BNEP=m
CONFIG_BT_BREDR=y
CONFIG_BT_HCIBTUSB=m
CONFIG_BT_HIDP=m
CONFIG_BT_LE=y
CONFIG_BT=m
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
CONFIG_BUG=y
CONFIG_BUILD_BIN2C=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_CACHEFILES_DEBUG=y
CONFIG_CACHEFILES=m
CONFIG_CARDBUS=y
CONFIG_CC_STACKPROTECTOR_REGULAR=y
CONFIG_CC_STACKPROTECTOR=y
CONFIG_CDROM_PKTCDVD_BUFFERS=8
CONFIG_CDROM_PKTCDVD=m
CONFIG_CFG80211_DEBUGFS=y
CONFIG_CFG80211_DEFAULT_PS=y
CONFIG_CFG80211_DEVELOPER_WARNINGS=y
CONFIG_CFG80211=m
CONFIG_CFG80211_WEXT=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_SCHED=y
CONFIG_CGROUPS=y
CONFIG_CIFS=m
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_XATTR=y
CONFIG_CLEANCACHE=y
CONFIG_CLKBLD_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_CMA_ALIGNMENT=8
CONFIG_CMA_AREAS=7
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_SEL_MBYTES=y
CONFIG_CMA=y
CONFIG_CMDLINE=""
CONFIG_CMDLINE_BOOL=y
CONFIG_CMDLINE_PARTITION=y
CONFIG_COMPACTION=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT=y
CONFIG_CONFIGFS_FS=m
CONFIG_CONNECTOR=m
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_COREDUMP=y
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_STAT_DETAILS=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
CONFIG_CPU_IDLE=y
CONFIG_CPU_RMAP=y
CONFIG_CPUSETS=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CRAMFS=m
CONFIG_CRC_CCITT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC_T10DIF=y
CONFIG_CRC16=y
CONFIG_CRC32_SLICEBY8=y
CONFIG_CRC32=y
CONFIG_CROSS_COMPILE=""
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_CRYPTO_ABLK_HELPER=m
CONFIG_CRYPTO_AEAD=m
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_AES_X86_64=m
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_CTR=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_ECB=m
CONFIG_CRYPTO_GF128MUL=m
CONFIG_CRYPTO_GLUE_HELPER_X86=m
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_PCOMP2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_SHA1_SSSE3=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=m
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_WORKQUEUE=y
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO=y
CONFIG_CUSE=m
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_DCA=m
CONFIG_DDR=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_BOOT_PARAMS=y
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_INFO_DWARF4=y
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_SPLIT=y
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y
CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=500
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_PREEMPT=y
CONFIG_DEBUG_RODATA=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DEFAULT_CUBIC=y
CONFIG_DEFAULT_DEADLINE=y
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_DEFAULT_IO_DELAY_TYPE=0
CONFIG_DEFAULT_IOSCHED="deadline"
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_DEFAULT_SECURITY="selinux"
CONFIG_DEFAULT_SECURITY_SELINUX=y
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVKMEM=y
CONFIG_DEVPORT=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS=y
CONFIG_DIRECT_GBPAGES=y
CONFIG_DLM=m
CONFIG_DMA_ACPI=y
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_CMA=y
CONFIG_DMADEVICES=y
CONFIG_DMA_ENGINE_RAID=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_BUFIO=m
CONFIG_DM_CACHE_CLEANER=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_MQ=m
CONFIG_DM_CRYPT=m
CONFIG_DM_DEBUG=y
CONFIG_DM_DELAY=m
CONFIG_DM_ERA=m
CONFIG_DM_FLAKEY=m
CONFIG_DMIID=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_DMI_SYSFS=m
CONFIG_DMI=y
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_MIRROR=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_PERSISTENT_DATA=m
CONFIG_DM_RAID=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_SWITCH=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_UEVENT=y
CONFIG_DM_VERITY=m
CONFIG_DM_ZERO=m
CONFIG_DNOTIFY=y
CONFIG_DNS_RESOLVER=y
CONFIG_DOUBLEFAULT=y
CONFIG_DQL=y
CONFIG_DRM_CIRRUS_QEMU=m
CONFIG_DRM_I915_FBDEV=y
CONFIG_DRM_I915=m
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM=m
CONFIG_DRM_MGA=m
CONFIG_DRM_TTM=m
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_A8293=m
CONFIG_DVB_CORE=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB8000=m
CONFIG_DVB_DRXK=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_DYNAMIC_MINORS=y
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_LNBP21=m
CONFIG_DVB_MAX_ADAPTERS=8
CONFIG_DVB_MB86A20S=m
CONFIG_DVB_MT352=m
CONFIG_DVB_M88DS3103=m
CONFIG_DVB_PLL=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_SI2168=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV0297=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_S5H1411=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_TDA10048=m
CONFIG_DVB_TDA10071=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_TTUSB_BUDGET=m
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m
CONFIG_DVB_USB_AF9015=m
CONFIG_DVB_USB_A800=m
CONFIG_DVB_USB_CXUSB=m
CONFIG_DVB_USB_DIBUSB_MC=m
CONFIG_DVB_USB_DIB0700=m
CONFIG_DVB_USB=m
CONFIG_DVB_USB_NOVA_T_USB2=m
CONFIG_DVB_USB_V2=m
CONFIG_DVB_VES1820=m
CONFIG_DVB_ZL10353=m
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_EARLY_PRINTK=y
CONFIG_EDAC_DEBUG=y
CONFIG_EDAC_DECODE_MCE=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_MM_EDAC=m
CONFIG_EDAC=y
CONFIG_EDD=m
CONFIG_EFI_PARTITION=y
CONFIG_EFI_RUNTIME_MAP=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_VARS=m
CONFIG_EFI=y
CONFIG_ELF_CORE=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_EPOLL=y
CONFIG_ETHERNET=y
CONFIG_EVENTFD=y
CONFIG_EVENT_TRACING=y
CONFIG_EVM_ATTR_FSUUID=y
CONFIG_EVM=y
CONFIG_EXPORTFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS=y
CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT3_FS_XATTR=y
CONFIG_EXT3_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_E1000E=m
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_FANOTIFY=y
CONFIG_FAT_DEFAULT_CODEPAGE=852
CONFIG_FAT_DEFAULT_IOCHARSET="cp1250"
CONFIG_FAT_FS=m
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_CMDLINE=y
CONFIG_FB_EFI=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_SIMPLE=y
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_TILEBLITTING=y
CONFIG_FB_VESA=y
CONFIG_FB=y
CONFIG_FHANDLE=y
CONFIG_FILE_LOCKING=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONT_8x16=y
CONFIG_FONT_8x8=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAME_POINTER=y
CONFIG_FRAME_WARN=2048
CONFIG_FREEZER=y
CONFIG_FRONTSWAP=y
CONFIG_FSCACHE_DEBUG=y
CONFIG_FSCACHE_HISTOGRAM=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
CONFIG_FS_MBCACHE=y
CONFIG_FSNOTIFY=y
CONFIG_FS_POSIX_ACL=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUSE_FS=m
CONFIG_FUTEX=y
CONFIG_FW_LOADER=y
CONFIG_GART_IOMMU=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_IOMAP=y
CONFIG_GENERIC_IO=y
CONFIG_GENERIC_IRQ_LEGACY_ALLOC_HWIRQ=y
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_TRACER=y
CONFIG_GLOB=y
CONFIG_GRACE_PERIOD=m
CONFIG_HANGCHECK_TIMER=m
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_HAS_DMA=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_HAVE_ARCH_KMEMCHECK=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_BPF_JIT=y
CONFIG_HAVE_CC_STACKPROTECTOR=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_HAVE_DMA_ATTRS=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_IDE=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM=y
CONFIG_HAVE_LATENCYTOP_SUPPORT=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_HAVE_NET_DSA=y
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_UID16=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HDMI=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HID_APPLE=m
CONFIG_HID_A4TECH=m
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HID_BELKIN=m
CONFIG_HID_CYPRESS=m
CONFIG_HID_EZKEY=m
CONFIG_HID_GENERIC=m
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_KYE=m
CONFIG_HID_LENOVO=m
CONFIG_HID_LOGITECH_HIDPP=m
CONFIG_HID_LOGITECH=m
CONFIG_HID=m
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_PLANTRONICS=m
CONFIG_HIGH_RES_TIMERS=y
CONFIG_HOTPLUG_CPU=y
CONFIG_HOTPLUG_PCI=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_HPET_MMAP_DEFAULT=y
CONFIG_HPET_MMAP=y
CONFIG_HPET_TIMER=y
CONFIG_HPET=y
CONFIG_HSI_BOARDINFO=y
CONFIG_HSI_CHAR=m
CONFIG_HSI=m
CONFIG_HT_IRQ=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HVC_DRIVER=y
CONFIG_HW_CONSOLE=y
CONFIG_HWMON=y
CONFIG_HW_RANDOM_INTEL=m
CONFIG_HW_RANDOM=m
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HYPERVISOR_GUEST=y
CONFIG_HZ=300
CONFIG_HZ_300=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CHR_DEV_SG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_IA32_AOUT=m
CONFIG_IA32_EMULATION=y
CONFIG_IKCONFIG=m
CONFIG_IKCONFIG_PROC=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_INET_TUNNEL=m
CONFIG_INET=y
CONFIG_INET6_XFRM_MODE_BEET=m
CONFIG_INET6_XFRM_MODE_TRANSPORT=m
CONFIG_INET6_XFRM_MODE_TUNNEL=m
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_INIT_FALLBACK=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_INOTIFY_USER=y
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_KEYBOARD=y
CONFIG_INPUT_MISC=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSE=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_UINPUT=m
CONFIG_INPUT=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_INTEGRITY=y
CONFIG_INTEL_GTT=y
CONFIG_INTEL_IOATDMA=m
CONFIG_INTEL_IPS=m
CONFIG_INTEL_MEI_ME=y
CONFIG_INTEL_MEI=y
CONFIG_INTEL_POWERCLAMP=m
CONFIG_INTEL_RST=m
CONFIG_INTEL_SMARTCONNECT=m
CONFIG_INTEL_SOC_DTS_THERMAL=m
CONFIG_INTERVAL_TREE=y
CONFIG_IO_DELAY_TYPE_NONE=3
CONFIG_IO_DELAY_TYPE_UDELAY=2
CONFIG_IO_DELAY_TYPE_0XED=1
CONFIG_IO_DELAY_TYPE_0X80=0
CONFIG_IO_DELAY_0X80=y
CONFIG_IOMMU_HELPER=y
CONFIG_IOMMU_SUPPORT=y
CONFIG_IOSF_MBI=m
CONFIG_IOSCHED_CFQ=m
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_NOOP=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IPC_NS=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_PNP_BOOTP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_IP_PNP=y
CONFIG_IP_SCTP=m
CONFIG_IPVLAN=m
CONFIG_IPV6=m
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_SIT=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
CONFIG_IRDA=m
CONFIG_IRQ_DOMAIN_DEBUG=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_IRQSOFF_TRACER=y
CONFIG_IRQ_WORK=y
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_TTUSBIR=m
CONFIG_IRTTY_SIR=m
CONFIG_ISA_DMA_API=y
CONFIG_ISO9660_FS=m
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_ITCO_WDT=m
CONFIG_IWLDVM=m
CONFIG_IWLEGACY_DEBUGFS=y
CONFIG_IWLEGACY_DEBUG=y
CONFIG_IWLEGACY=m
CONFIG_IWLWIFI_LEDS=y
CONFIG_IWLWIFI=m
CONFIG_IWLWIFI_OPMODE_MODULAR=y
CONFIG_IWL3945=m
CONFIG_IXGBEVF=m
CONFIG_I2C_ALGOBIT=m
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_I801=m
CONFIG_I2C=m
CONFIG_I2C_MUX=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_TINY_USB=m
CONFIG_I8253_LOCK=y
CONFIG_JBD=y
CONFIG_JBD2=y
CONFIG_JFFS2_CMODE_PRIORITY=y
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_LZO=y
CONFIG_JFFS2_RTIME=y
CONFIG_JFFS2_RUBIN=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JOLIET=y
CONFIG_JUMP_LABEL=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS=y
CONFIG_KERNEL_LZMA=y
CONFIG_KERNFS=y
CONFIG_KEXEC_JUMP=y
CONFIG_KEXEC=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYS_COMPAT=y
CONFIG_KEYS=y
CONFIG_KPROBE_EVENT=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_KPROBES=y
CONFIG_KRETPROBES=y
CONFIG_KSM=y
CONFIG_KVM_AMD=m
CONFIG_KVM_APIC_ARCHITECTURE=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_KVM_INTEL=m
CONFIG_KVM=m
CONFIG_KVM_MMIO=y
CONFIG_KVM_MMU_AUDIT=y
CONFIG_KVM_VFIO=y
CONFIG_LATENCYTOP=y
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_PLATFORM=m
CONFIG_LDM_PARTITION=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LIBCRC32C=m
CONFIG_LKDTM=m
CONFIG_LLC=m
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_LOCKDEP=y
CONFIG_LOCKD=m
CONFIG_LOCKD_V4=y
CONFIG_LOCK_STAT=y
CONFIG_LOCKUP_DETECTOR=y
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=17
CONFIG_LOGO_LINUX_CLUT224=y
CONFIG_LOGO=y
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_LRU_CACHE=m
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_MAC80211_DEBUGFS=y
CONFIG_MAC80211_DEBUG_MENU=y
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211=m
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_MINSTREL_HT=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ=y
CONFIG_MCORE2=y
CONFIG_MD_FAULTY=m
CONFIG_MD_LINEAR=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_ATTACH=y
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_PCI_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_RC_SUPPORT=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_TUNER=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_M88TS2022=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_USB_SUPPORT=y
CONFIG_MEMCG_SWAP_ENABLED=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG=y
CONFIG_MEMORY_BALLOON=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_MEMSTICK=m
CONFIG_MEMSTICK_REALTEK_USB=m
CONFIG_MEMSTICK_R592=m
CONFIG_MEMTEST=y
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_MFD_CORE=m
CONFIG_MFD_RTSX_USB=m
CONFIG_MFD_SM501=m
CONFIG_MICROCODE_AMD=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE=m
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_MIGRATION=y
CONFIG_MII=m
CONFIG_MISC_FILESYSTEMS=y
CONFIG_MMC_BLOCK_BOUNCE=y
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_MMC=m
CONFIG_MMC_REALTEK_USB=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDRICOH_CS=m
CONFIG_MMC_USHC=m
CONFIG_MMIOTRACE_TEST=m
CONFIG_MMIOTRACE=y
CONFIG_MMU_NOTIFIER=y
CONFIG_MMU=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2=m
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_SERIAL=m
CONFIG_MSDOS_PARTITION=y
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
CONFIG_MTD_BLOCK2MTD=m
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CMDLINE_PARTS=m
CONFIG_MTD=m
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_MTDRAM=m
CONFIG_MTD_NAND_ECC=m
CONFIG_MTD_NAND_ECC_SMC=y
CONFIG_MTD_NAND_IDS=m
CONFIG_MTD_NAND=m
CONFIG_MTD_NAND_RICOH=m
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_SM_COMMON=m
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR=y
CONFIG_NAMESPACES=y
CONFIG_NEED_BOUNCE_POOL=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NETCONSOLE=m
CONFIG_NET_CORE=y
CONFIG_NETDEVICES=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NETFILTER_XTABLES=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_HL=m
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TIME=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_LED=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER=y
CONFIG_NET_FLOW_LIMIT=y
CONFIG_NET_IP_TUNNEL=m
CONFIG_NETLINK_MMAP=y
CONFIG_NET_NS=y
CONFIG_NET_PKTGEN=m
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_NETPOLL=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_NET_VENDOR_INTEL=y
CONFIG_NET_VENDOR_REALTEK=y
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NETWORK_SECMARK=y
CONFIG_NET=y
CONFIG_NEW_LEDS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_IPV4=m
CONFIG_NF_CONNTRACK_IPV6=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_PROC_COMPAT=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_COMMON=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_LOG_IPV6=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IPV4=m
CONFIG_NF_NAT_IPV6=m
CONFIG_NF_NAT=m
CONFIG_NF_NAT_MASQUERADE_IPV4=m
CONFIG_NF_NAT_MASQUERADE_IPV6=m
CONFIG_NF_NAT_NEEDED=y
CONFIG_NF_NAT_REDIRECT=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NFS_ACL_SUPPORT=m
CONFIG_NFS_COMMON=y
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V4=y
CONFIG_NFS_FS=m
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_V2=m
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V3=m
CONFIG_NFS_V4=m
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_NLATTR=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_UTF8=m
CONFIG_NLS=y
CONFIG_NO_BOOTMEM=y
CONFIG_NO_HZ_COMMON=y
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
CONFIG_NOP_TRACER=y
CONFIG_NR_CPUS=2
CONFIG_NTB=m
CONFIG_NTFS_FS=m
CONFIG_NTFS_RW=y
CONFIG_NVRAM=m
CONFIG_OID_REGISTRY=m
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OPROFILE=m
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_OPTIMIZE_INLINING=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_OVERLAY_FS=m
CONFIG_PACKET=y
CONFIG_PADATA=y
CONFIG_PAGE_COUNTER=y
CONFIG_PAGE_EXTENSION=y
CONFIG_PAGEFLAGS_EXTENDED=y
CONFIG_PAGE_OWNER=y
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_PARTITION_ADVANCED=y
CONFIG_PATA_MPIIX=y
CONFIG_PCCARD_NONSTATIC=y
CONFIG_PCCARD=y
CONFIG_PCI_ATS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEAER=y
CONFIG_PCIEASPM_DEBUG=y
CONFIG_PCIEASPM_DEFAULT=y
CONFIG_PCIEASPM=y
CONFIG_PCIE_PME=y
CONFIG_PCIEPORTBUS=y
CONFIG_PCI_IOV=y
CONFIG_PCI_LABEL=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_MSI=y
CONFIG_PCI_PASID=y
CONFIG_PCI_PRI=y
CONFIG_PCI_QUIRKS=y
CONFIG_PCI_STUB=y
CONFIG_PCI=y
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_PCMCIA=m
CONFIG_PCSPKR_PLATFORM=y
CONFIG_PERCPU_RWSEM=y
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_PHYSICAL_ALIGN=0x1000000
CONFIG_PHYSICAL_START=0x1000000
CONFIG_PID_NS=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PMC_ATOM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_DEVFREQ=y
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_SLEEP=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_TRACE=y
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS=y
CONFIG_PM=y
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNPACPI=y
CONFIG_PNP=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POWER_AVS=y
CONFIG_POWER_SUPPLY=y
CONFIG_PPP_ASYNC=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_FILTER=y
CONFIG_PPP=m
CONFIG_PPP_MPPE=m
CONFIG_PPP_MULTILINK=y
CONFIG_PPS=m
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PREEMPT_RCU=y
CONFIG_PREEMPT_TRACER=y
CONFIG_PREEMPT=y
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK=y
CONFIG_PROBE_EVENTS=y
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROFILING=y
CONFIG_PROVE_LOCKING=y
CONFIG_PROVE_RCU=y
CONFIG_PTP_1588_CLOCK=m
CONFIG_PVPANIC=m
CONFIG_QUEUE_RWLOCK=y
CONFIG_QUOTACTL_COMPAT=y
CONFIG_QUOTACTL=y
CONFIG_RADIO_ADAPTERS=y
CONFIG_RAID_ATTRS=m
CONFIG_RAID6_PQ=m
CONFIG_RAS=y
CONFIG_RC_CORE=m
CONFIG_RC_DECODERS=y
CONFIG_RC_DEVICES=y
CONFIG_RC_LOOPBACK=m
CONFIG_RC_MAP=m
CONFIG_RCU_CPU_STALL_INFO=y
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FAST_NO_HZ=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_TRACE=y
CONFIG_RD_BZIP2=y
CONFIG_RD_GZIP=y
CONFIG_RD_LZMA=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_XZ=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR=y
CONFIG_REISERFS_FS=m
CONFIG_REISERFS_FS_POSIX_ACL=y
CONFIG_REISERFS_FS_SECURITY=y
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_PROC_INFO=y
CONFIG_RELAY=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_REGULATOR=m
CONFIG_RFKILL=y
CONFIG_RFS_ACCEL=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_RING_BUFFER=y
CONFIG_RPS=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_LIB=y
CONFIG_RTC_SYSTOHC=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_RTL_CARDS=m
CONFIG_RT_MUTEXES=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_SATA_AHCI=y
CONFIG_SATA_PMP=y
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_DEBUG=m
CONFIG_SCSI_DMA=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_LOWLEVEL=y
CONFIG_SCSI_MOD=y
CONFIG_SCSI_SCAN_ASYNC=y
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_VIRTIO=m
CONFIG_SCSI=y
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=y
CONFIG_SDIO_UART=m
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE=1
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_HDAPS=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_NR_UARTS=16
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_SHARE_IRQ=y
CONFIG_SERIAL_8250=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_RAW=m
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SHMEM=y
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_HRTICK=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_SCHEDSTATS=y
CONFIG_SCHED_TRACER=y
CONFIG_SIGNALFD=y
CONFIG_SLABINFO=y
CONFIG_SLHC=m
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB=y
CONFIG_SM_FTL=m
CONFIG_SMP=y
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_EMU10K1=m
CONFIG_SND_EMU10K1_SEQ=m
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_CA0110=m
CONFIG_SND_HDA_CODEC_CA0132=m
CONFIG_SND_HDA_CODEC_CIRRUS=m
CONFIG_SND_HDA_CODEC_CMEDIA=m
CONFIG_SND_HDA_CODEC_CONEXANT=m
CONFIG_SND_HDA_CODEC_HDMI=m
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_CODEC_SI3054=m
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_INPUT_BEEP_MODE=1
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_INPUT_JACK=y
CONFIG_SND_HDA_INTEL=m
CONFIG_SND_HDA_I915=y
CONFIG_SND_HDA=m
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=500
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_HDA_RECONFIG=y
CONFIG_SND_HRTIMER=m
CONFIG_SND_HWDEP=m
CONFIG_SND_INTEL8X0=m
CONFIG_SND_JACK=y
CONFIG_SND_KCTL_JACK=y
CONFIG_SND=m
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_MIXER_OSS=m
CONFIG_SND_MPU401=m
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OSSEMUL=y
CONFIG_SND_PCI=y
CONFIG_SND_PCM=m
CONFIG_SND_PCM_OSS=m
CONFIG_SND_PCM_OSS_PLUGINS=y
CONFIG_SND_RAWMIDI=m
CONFIG_SND_RAWMIDI_SEQ=m
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQUENCER_OSS=y
CONFIG_SND_SERIAL_U16550=m
CONFIG_SND_TIMER=m
CONFIG_SND_VERBOSE_PROCFS=y
CONFIG_SND_VMASTER=y
CONFIG_SOFT_WATCHDOG=m
CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SPARSE_IRQ=y
CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_SPARSEMEM=y
CONFIG_SPI_MASTER=y
CONFIG_SPI=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_SPMI=m
CONFIG_SQUASHFS_DECOMP_SINGLE=y
CONFIG_SQUASHFS_FILE_CACHE=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_SQUASHFS_LZ4=y
CONFIG_SQUASHFS=m
CONFIG_SQUASHFS_XZ=y
CONFIG_SQUASHFS_ZLIB=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSFDC=m
CONFIG_STACK_TRACER=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_STACKTRACE=y
CONFIG_STAGING=y
CONFIG_STANDALONE=y
CONFIG_STOP_MACHINE=y
CONFIG_STP=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC=m
CONFIG_SUSPEND_FREEZER=y
CONFIG_SUSPEND=y
CONFIG_SWAP=y
CONFIG_SWIOTLB=y
CONFIG_SYN_COOKIES=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_SYSCTL=y
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_SYSFS=y
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
CONFIG_TASKSTATS=y
CONFIG_TASK_XACCT=y
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TEST_UDELAY=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
CONFIG_THERMAL_EMULATION=y
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL=y
CONFIG_THINKPAD_ACPI_ALSA_SUPPORT=y
CONFIG_THINKPAD_ACPI_DEBUG=y
CONFIG_THINKPAD_ACPI=m
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_TICK_ONESHOT=y
CONFIG_TIMERFD=y
CONFIG_TIMER_STATS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACEPOINTS=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACING_SUPPORT=y
CONFIG_TRACING=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TREE_RCU_TRACE=y
CONFIG_TTY=y
CONFIG_TUN=m
CONFIG_UCS2_STRING=y
CONFIG_UDF_FS=m
CONFIG_UDF_NLS=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_UEVENT_HELPER=y
CONFIG_UID16=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_UNIX_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX98_PTYS=y
CONFIG_UPROBE_EVENT=y
CONFIG_UPROBES=y
CONFIG_USB_ACM=m
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB_COMMON=m
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_EHCI_HCD=m
CONFIG_USB_EHCI_PCI=m
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_HIDDEV=y
CONFIG_USB_HID=m
CONFIG_USB=m
CONFIG_USB_MON=m
CONFIG_USB_NET_DRIVERS=m
CONFIG_USB_OHCI_HCD=m
CONFIG_USB_OHCI_HCD_PCI=m
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_OTG_FSM=m
CONFIG_USB_OTG_WHITELIST=y
CONFIG_USB_OTG=y
CONFIG_USB_PHY=y
CONFIG_USB_PRINTER=m
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_PL2303=m
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_STORAGE=m
CONFIG_USB_SUPPORT=y
CONFIG_USB_TEST=m
CONFIG_USB_TMC=m
CONFIG_USB_UHCI_HCD=m
CONFIG_USB_WDM=m
CONFIG_USB_WPAN_HCD=m
CONFIG_USB_XHCI_HCD=m
CONFIG_USB_XHCI_PCI=m
CONFIG_USELIB=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_UTS_NS=y
CONFIG_VETH=m
CONFIG_VFAT_FS=m
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_VGA_ARB=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGA_CONSOLE=y
CONFIG_VHOST=m
CONFIG_VHOST_NET=m
CONFIG_VHOST_RING=m
CONFIG_VIDEO_ADV_DEBUG=y
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_DMA_SG=m
CONFIG_VIDEOBUF2_DVB=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_CX23885=m
CONFIG_VIDEO_CX25840=m
CONFIG_VIDEO_DEV=m
CONFIG_VIDEO_IR_I2C=m
CONFIG_VIDEO_MEM2MEM_DEINTERLACE=m
CONFIG_VIDEO_TUNER=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_VIDEO_VIM2M=m
CONFIG_VIDEO_V4L2=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_BLK=y
CONFIG_VIRTIO_CONSOLE=m
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
CONFIG_VIRTIO_MMIO=m
CONFIG_VIRTIO_NET=m
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO=y
CONFIG_VIRT_TO_BUS=y
CONFIG_VIRTUALIZATION=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_VSOCKETS=m
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_VT=y
CONFIG_V4L_MEM2MEM_DRIVERS=y
CONFIG_V4L_TEST_DRIVERS=y
CONFIG_V4L2_MEM2MEM_DEV=m
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WIRELESS=y
CONFIG_WLAN=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_XFRM=y
CONFIG_XFS_FS=m
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_RT=y
CONFIG_XOR_BLOCKS=m
CONFIG_XPS=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC=y
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_ACPI_CPUFREQ=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
CONFIG_X86_CMOV=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CPUID=m
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_X86_DEV_DMA_OPS=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_HT=y
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_INTEL_MPX=y
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_IO_APIC=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_MCE_AMD=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_MPPARSE=y
CONFIG_X86_MSR=m
CONFIG_X86_PAT=y
CONFIG_X86_PCC_CPUFREQ=m
CONFIG_X86_PKG_TEMP_THERMAL=m
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_X86_PM_TIMER=y
CONFIG_X86_P4_CLOCKMOD=m
CONFIG_X86_P6_NOP=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_RESERVE_LOW=64
CONFIG_X86_SMAP=y
CONFIG_X86_SPEEDSTEP_LIB=m
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
CONFIG_X86_SYSFB=y
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_TSC=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_X32=y
CONFIG_X86=y
CONFIG_X86_16BIT=y
CONFIG_X86_64_SMP=y
CONFIG_X86_64=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA=m
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_TOSHIBA=y
CONFIG_ZISOFS=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZONE_DMA_FLAG=1
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZPOOL=m
CONFIG_ZSMALLOC=y
CONFIG_64BIT=y
CONFIG_8139TOO=m
CONFIG_8139TOO_PIO=y

--------------010102040407090307050609--
