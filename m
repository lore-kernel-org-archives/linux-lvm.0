From: Steve McIntyre <smcintyre@software.plasmon.com>
Message-ID: <20040105103500.GA7540@software.plasmon.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Oops when running snapshots
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
Date: Mon Jan  5 04:36:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Has there been any progress on the issue reported by Andrew Patterson
in

http://lists.sistina.com/pipermail/linux-lvm/2003-July/014422.html

???

I've got a brand new server that seems to have just shown the same
problem over the Christmas period: twin P4 Xeon, 1GB RAM (configured
for 4GB highmem), kernel 2.4.23. Oops message:

ksymoops 2.4.5 on i686 2.4.23.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.23/ (default)
     -m /boot/System.map-2.4.23-20031224 (specified)

No modules in ksyms, skipping objects
Warning (read_lsmod): no symbols in lsmod, is /proc/modules a valid lsmod file?
Warning (compare_maps): ksyms_base symbol IO_APIC_get_PCI_irq_vector_R__ver_IO_APIC_get_PCI_irq_vector not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol __br_write_lock_R__ver___br_write_lock not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol __br_write_unlock_R__ver___br_write_unlock not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol __brlock_array_R__ver___brlock_array not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol __global_cli_R__ver___global_cli not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol __global_restore_flags_R__ver___global_restore_flags not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol __global_save_flags_R__ver___global_save_flags not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol __global_sti_R__ver___global_sti not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol atomic_dec_and_lock_R__ver_atomic_dec_and_lock not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol cpu_data_R__ver_cpu_data not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol cpu_online_map_R__ver_cpu_online_map not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol create_bounce_R__ver_create_bounce not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol del_timer_sync_R__ver_del_timer_sync not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol drive_info_R__ver_drive_info not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol flush_tlb_page_R__ver_flush_tlb_page not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol global_irq_holder_R__ver_global_irq_holder not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol highmem_start_page_R__ver_highmem_start_page not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_pci_register_host_proc_R__ver_ide_pci_register_host_proc not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol kernel_flag_cacheline_R__ver_kernel_flag_cacheline not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol kmap_high_R__ver_kmap_high not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol kmap_prot_R__ver_kmap_prot not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol kmap_pte_R__ver_kmap_pte not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol kunmap_high_R__ver_kunmap_high not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol set_cpus_allowed_R__ver_set_cpus_allowed not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol smp_call_function_R__ver_smp_call_function not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol smp_num_cpus_R__ver_smp_num_cpus not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol synchronize_irq_R__ver_synchronize_irq not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol tqueue_lock_R__ver_tqueue_lock not found in System.map.  Ignoring ksyms_base entry
Dec 29 03:04:59 cetus kernel: c0287ed5
Dec 29 03:04:59 cetus kernel: Oops: 0002
Dec 29 03:04:59 cetus kernel: CPU:    3
Dec 29 03:04:59 cetus kernel: EIP:    0010:[<c0287ed5>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
Dec 29 03:04:59 cetus kernel: EFLAGS: 00010202
Dec 29 03:04:59 cetus kernel: eax: 00000000   ebx: f91e89a8   ecx: f8b09450   edx: f8b02778
Dec 29 03:04:59 cetus kernel: esi: 01fb8200   edi: d8858800   ebp: 00000831   esp: f6abfc3c
Dec 29 03:04:59 cetus kernel: ds: 0018   es: 0018   ss: 0018
Dec 29 03:04:59 cetus kernel: Process nfsd (pid: 286, stackpage=f6abf000)
Dec 29 03:04:59 cetus kernel: Stack: d8858800 d8858970 f7dee770 05a00000 00000080 00000002 00000070 00000000 
Dec 29 03:04:59 cetus kernel:        c0284951 f6abfc9a f6abfc9c 01fb8180 d8858800 00003a00 e5ddfa00 076800f0 
Dec 29 03:04:59 cetus kernel:        05a00000 dea60780 02dc00e8 f7dee600 f786d000 01fb8180 0003b400 08310000 
Dec 29 03:04:59 cetus kernel: Call Trace:    [<c0284951>] [<c0284a37>] [<c01e3b8c>] [<c01e3bf2>] [<c013d06c>]
Dec 29 03:04:59 cetus kernel:   [<c013d1a7>] [<c013b309>] [<c0130f72>] [<c01312e0>] [<c0131350>] [<c0131e78>]
Dec 29 03:04:59 cetus kernel:   [<c014e7fd>] [<c0132182>] [<c0131e2e>] [<c01294ce>] [<c0129be5>] [<c0129e3c>]
Dec 29 03:04:59 cetus kernel:   [<c012a4df>] [<c012a36c>] [<c0191f84>] [<c019714b>] [<c018e5d3>] [<c02fec67>]
Dec 29 03:04:59 cetus kernel:   [<c018e3bf>] [<c0105694>]
Dec 29 03:04:59 cetus kernel: Code: 89 10 c7 01 00 00 00 00 c7 41 04 00 00 00 00 8b 03 89 48 04 


>>EIP; c0287ed5 <lvm_snapshot_remap_block+a9/f8>   <=====

>>ebx; f91e89a8 <END_OF_CODE+38d5cae8/????>
>>ecx; f8b09450 <END_OF_CODE+3867d590/????>
>>edx; f8b02778 <END_OF_CODE+386768b8/????>
>>esi; 01fb8200 Before first symbol
>>edi; d8858800 <END_OF_CODE+183cc940/????>
>>ebp; 00000831 Before first symbol
>>esp; f6abfc3c <END_OF_CODE+36633d7c/????>

Trace; c0284951 <lvm_map+3b9/490>
Trace; c0284a37 <lvm_make_request_fn+f/1c>
Trace; c01e3b8c <generic_make_request+120/130>
Trace; c01e3bf2 <submit_bh+56/e0>
Trace; c013d06c <sync_page_buffers+94/ac>
Trace; c013d1a7 <try_to_free_buffers+123/148>
Trace; c013b309 <try_to_release_page+49/4c>
Trace; c0130f72 <shrink_cache+21e/3f4>
Trace; c01312e0 <shrink_caches+3c/48>
Trace; c0131350 <try_to_free_pages_zone+64/e4>
Trace; c0131e78 <balance_classzone+48/1c8>
Trace; c014e7fd <iget4+4d/e8>
Trace; c0132182 <__alloc_pages+18a/28c>
Trace; c0131e2e <_alloc_pages+16/18>
Trace; c01294ce <page_cache_read+7a/d0>
Trace; c0129be5 <generic_file_readahead+105/13c>
Trace; c0129e3c <do_generic_file_read+1f0/494>
Trace; c012a4df <generic_file_read+93/190>
Trace; c012a36c <file_read_actor+0/e0>
Trace; c0191f84 <nfsd_read+1bc/260>
Trace; c019714b <nfsd3_proc_read+127/184>
Trace; c018e5d3 <nfsd_dispatch+d3/19a>
Trace; c02fec67 <svc_process+28f/4f0>
Trace; c018e3bf <nfsd+1f3/334>
Trace; c0105694 <arch_kernel_thread+28/38>

Code;  c0287ed5 <lvm_snapshot_remap_block+a9/f8>
00000000 <_EIP>:
Code;  c0287ed5 <lvm_snapshot_remap_block+a9/f8>   <=====
   0:   89 10                     mov    %edx,(%eax)   <=====
Code;  c0287ed7 <lvm_snapshot_remap_block+ab/f8>
   2:   c7 01 00 00 00 00         movl   $0x0,(%ecx)
Code;  c0287edd <lvm_snapshot_remap_block+b1/f8>
   8:   c7 41 04 00 00 00 00      movl   $0x0,0x4(%ecx)
Code;  c0287ee4 <lvm_snapshot_remap_block+b8/f8>
   f:   8b 03                     mov    (%ebx),%eax
Code;  c0287ee6 <lvm_snapshot_remap_block+ba/f8>
  11:   89 48 04                  mov    %ecx,0x4(%eax)

Jan  2 08:50:33 cetus kernel: ACPI: LAPIC_NMI (acpi_id[0x00] polarity[0x1] trigger[0x3] lint[0x1])
Jan  2 08:50:33 cetus kernel: ACPI: LAPIC_NMI (acpi_id[0x01] polarity[0x1] trigger[0x3] lint[0x1])
Jan  2 08:50:33 cetus kernel: cpu: 0, clocks: 1329112, slice: 265822
Jan  2 08:50:33 cetus kernel: cpu: 1, clocks: 1329112, slice: 265822
Jan  2 08:50:33 cetus kernel: cpu: 3, clocks: 1329112, slice: 265822
Jan  2 08:50:33 cetus kernel: cpu: 2, clocks: 1329112, slice: 265822
Jan  2 08:50:33 cetus kernel: e1000: eth0 NIC Link is Up 100 Mbps Full Duplex

29 warnings issued.  Results may not be reliable.


-- 
Steve McIntyre, Plasmon                      smcintyre@software.plasmon.com
		Oh My God! They Killed init! You Bastards!
"Can't keep my eyes from the circling sky,                 
"Tongue-tied & twisted, Just an earth-bound misfit, I..."  
