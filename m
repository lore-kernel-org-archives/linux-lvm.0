Subject: Re: [linux-lvm] Oops when running snapshots
From: Andrew Patterson <andrew@fc.hp.com>
In-Reply-To: <20030710113223.D23240@sistina.com>
References: <1057789596.1368.28.camel@lvadplx> 
	<20030710113223.D23240@sistina.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1060985762.20809.129.camel@lvadplx>
Mime-Version: 1.0
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
Date: Fri Aug 15 17:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

On Thu, 2003-07-10 at 03:32, Heinz J . Mauelshagen wrote:
> On Wed, Jul 09, 2003 at 04:26:36PM -0600, Andrew Patterson wrote:
> > Ran a load test last night where we created snapshots two snapshots
> > every 2 hours under heavy file system load.  We got the following oops:
> > 
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 00000000
> > 802895f5
> <SNIP>
> >   11:   89 48 04                  mov    %ecx,0x4(%eax)
> > 
> > 
> > 10 warnings issued.  Results may not be reliable.
> > 
> > This was run on a 2.4.21 system using LVM 1.0.7.  The system has 2GB of
> > memory and is configured with HIGHME64G.  We are running the latest
> > 2.4.21 XFS and are using xfs_freeze to quiesce the file system.  We are
> > not using the VFS_LOCK patch.
> > 
> > Anyone have any ideas what may be causing this?
> 
> VM problems ? (we had some reports ITR)
> Do you have a chance to retest without HIGHMEM to see if it still fails ?
> 

I finally had a chance to rerun with HIMEM turned off.  I also made one
other change.  We are now using the linux-2.4.21-VFS-lock.patch I found
in the device mapper CVS archives instead of using xfs_freeze (we
thought we were running into some race condition with xfs_freeze.  Some
other details:

We are running multiple snapshots on the same volume.  The snapshots and
data set changes are very large (constantly changing up to 12 GB using
random and sequential read/writes). 

We have 2 GB of RAM on the system (the kernel only uses 1 GB due to no
HIMEM).

We then get the following oops after creating one or more snapshots:


ksymoops 2.4.8 on i686 2.4.21.  Options used
     -v /tmp/vmlinux (specified)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.21/ (default)
     -m /boot/System.map (specified)

Warning (compare_maps): ksyms_base symbol acpi_fadt_R__ver_acpi_fadt not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_gbl_FADT_R__ver_acpi_gbl_FADT not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_get_best_pio_mode_R__ver_ide_get_best_pio_mode not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_pci_register_driver_R__ver_ide_pci_register_driver not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_pci_unregister_driver_R__ver_ide_pci_unregister_driver not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_pio_timings_R__ver_ide_pio_timings not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_set_xfer_rate_R__ver_ide_set_xfer_rate not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_setup_pci_device_R__ver_ide_setup_pci_device not found in vmlinux.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_setup_pci_devices_R__ver_ide_setup_pci_devices not found in vmlinux.  Ignoring ksyms_base entry
Unable to handle kernel NULL pointer dereference at virtual address 00000000
c0286b55
*pde = 00000000
Oops: 0002
deadman multipath md bonding1 bonding cpqci cpqhealth cpqrom e100 lpfcdd
CPU:    0
EIP:    0010:[<c0286b55>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202
eax: 00000000   ebx: f9083e50   ecx: f8acbbf0   edx: f8aa19b0
esi: 0140e500   edi: f3967000   ebp: 00004400   esp: f7e17e58
ds: 0018   es: 0018   ss: 0018
Process kswapd (pid: 11, stackpage=f7e17000)
Stack: f3967000 f3967170 f3e3e770 01d50000 00000080 00000001 00000058 00000000
       c0283581 f7e17eb6 f7e17eb8 01400180 f3967000 00003a01 e5187800 013fe3d8
       01d50000 00000020 00000200 f3e3e600 f3c4a000 01400180 000013f0 44001000
Call Trace: [<c0283581>]  [<c0283667>]  [<c021892c>]  [<c02189a1>]  [<c013a6ac>]  [<c013a85f>]  [<c0138c70>]  [<c012f812>]  [<c012fb10>]  [<c012fb7c>]  [<c012fc81>]  [<c012fce6>]  [<c012fdfd>]  [<c0105684>]
Code: 89 10 c7 01 00 00 00 00 c7 41 04 00 00 00 00 8b 03 89 48 04


>>EIP; c0286b55 <lvm_snapshot_remap_block+a9/f8>   <=====

>>ebx; f9083e50 <[deadman].bss.end+654695/ffed2841>
>>ecx; f8acbbf0 <[deadman].bss.end+9c435/ffed2841>
>>edx; f8aa19b0 <[deadman].bss.end+721f5/ffed2841>
>>edi; f3967000 <_end+33564cdc/38492cdc>
>>esp; f7e17e58 <_end+37a15b34/38492cdc>

Trace; c0283581 <lvm_map+3b9/490>
Trace; c0283667 <lvm_make_request_fn+f/1c>
Trace; c021892c <generic_make_request+120/130>
Trace; c02189a1 <submit_bh+65/80>
Trace; c013a6ac <sync_page_buffers+94/ac>
Trace; c013a85f <try_to_free_buffers+19b/1c4>
Trace; c0138c70 <try_to_release_page+44/48>
Trace; c012f812 <shrink_cache+24e/3cc>
Trace; c012fb10 <shrink_caches+78/a8>
Trace; c012fb7c <try_to_free_pages_zone+3c/5c>
Trace; c012fc81 <kswapd_balance_pgdat+41/8c>
Trace; c012fce6 <kswapd_balance+1a/30>
Trace; c012fdfd <kswapd+99/b4>
Trace; c0105684 <arch_kernel_thread+28/38>

Code;  c0286b55 <lvm_snapshot_remap_block+a9/f8>
00000000 <_EIP>:
Code;  c0286b55 <lvm_snapshot_remap_block+a9/f8>   <=====
   0:   89 10                     mov    %edx,(%eax)   <=====
Code;  c0286b57 <lvm_snapshot_remap_block+ab/f8>
   2:   c7 01 00 00 00 00         movl   $0x0,(%ecx)
Code;  c0286b5d <lvm_snapshot_remap_block+b1/f8>
   8:   c7 41 04 00 00 00 00      movl   $0x0,0x4(%ecx)
Code;  c0286b64 <lvm_snapshot_remap_block+b8/f8>
   f:   8b 03                     mov    (%ebx),%eax
Code;  c0286b66 <lvm_snapshot_remap_block+ba/f8>
  11:   89 48 04                  mov    %ecx,0x4(%eax)


9 warnings issued.  Results may not be reliable. 

It looks like we are trying to shrink the buffer cache to release more memory 
for the block remap.  This then oopses.  Anyone have any idea how to fix this?

Andrew

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Andrew Patterson                          Voice:  (970) 898-3261
   Hewlett-Packard Company                   Email:  andrew@fc.hp.com
