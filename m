Return-Path: <jorg.de.jong@ida.xs4all.nl>
Message-ID: <3AD1AF65.CED00BC3@ida.xs4all.nl>
Date: Mon, 09 Apr 2001 14:47:33 +0200
From: Jorg de Jong <jorg.de.jong@ida.xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------CDDB23ECE668CC4A115B5B54"
Subject: [linux-lvm] oops during vgchange -a [y|n] name
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------CDDB23ECE668CC4A115B5B54
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I encounterd an oops during a series of vgchange -a [y|n] vgname.
That is in a short time activating and deactivating a volume group.
I am using a 2.4.3 vanila kernel with the lvm patch. usertools are 0.9.1.beta6.

Attached you will find the decoded oops text.

-- 
Jorg de Jong
Work : jorg.de.jong@ict.nl 
Play : jorg.de.jong@ida.xs4all.nl
--------------CDDB23ECE668CC4A115B5B54
Content-Type: text/plain; charset=us-ascii;
 name="oops.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="oops.txt"

ksymoops 2.3.4 on i686 2.4.3.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.3/ (default)
     -m /usr/src/linux/System.map (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Warning (compare_Version): Version mismatch.  System.map says 2.4.3, ac97 says 2.3.99.  Expect lots of address mismatches.
Warning (compare_Version): Version mismatch.  System.map says 2.4.3, audiobuf says 2.3.99.  Expect lots of address mismatches.
Warning (compare_Version): Version mismatch.  System.map says 2.4.3, midi says 2.3.99.  Expect lots of address mismatches.
Warning (compare_Version): Version mismatch.  System.map says 2.4.3, opl3 says 2.3.99.  Expect lots of address mismatches.
Warning (compare_Version): Version mismatch.  System.map says 2.4.3, soundbase says 2.3.99.  Expect lots of address mismatches.
Warning (compare_Version): Version mismatch.  System.map says 2.4.3, uart401 says 2.3.99.  Expect lots of address mismatches.
Warning (compare_Version): Version mismatch.  System.map says 2.4.3, ymf724 says 2.3.99.  Expect lots of address mismatches.
Apr  9 13:18:30 ida kernel: AC97: Codec/mixer chip doesn't seem to be alive.
Apr  9 13:57:15 ida kernel: Unable to handle kernel paging request at virtual address 00c0069d
Apr  9 13:57:15 ida kernel: c0146ad2
Apr  9 13:57:15 ida kernel: *pde = 00000000
Apr  9 13:57:15 ida kernel: Oops: 0000
Apr  9 13:57:15 ida kernel: CPU:    0
Apr  9 13:57:15 ida kernel: EIP:    0010:[proc_match+18/64]
Apr  9 13:57:15 ida kernel: EFLAGS: 00010202
Apr  9 13:57:15 ida kernel: eax: 00c0069d   ebx: 00000004   ecx: 00000004   edx: 00c0069d
Apr  9 13:57:15 ida kernel: esi: ca0bdcd8   edi: cdb73c10   ebp: ca0bdcdc   esp: ca0bdc9c
Apr  9 13:57:15 ida kernel: ds: 0018   es: 0018   ss: 0018
Apr  9 13:57:15 ida kernel: Process vgchange (pid: 9753, stackpage=ca0bd000)
Apr  9 13:57:15 ida kernel: Stack: c367b831 cdb73c10 c014756e 00000004 ca0bdcd8 00c0069d ca0bdcd8 c367b835 
Apr  9 13:57:15 ida kernel:        c02e556d c022f335 ca0bdcd8 cdb73be0 00000005 00200047 c010855c 31616473 
Apr  9 13:57:15 ida kernel:        c3ae4300 000004fd c3ae41e0 00000004 c01070b0 c3ae4300 00003a0a 00000001 
Apr  9 13:57:15 ida kernel: Call Trace: [remove_proc_entry+94/272] [lvm_snapshot_remap_block+85/240] [do_IRQ+140/176] [ret_from_intr+0/32] [schedule+631/944] [schedule_timeout+132/160] [lvm_map+636/1024] 
Apr  9 13:57:15 ida kernel: Code: 66 83 3a 00 74 08 0f b7 42 02 39 c8 74 04 31 c0 eb 15 fc 8b 
Using defaults from ksymoops -t elf32-i386 -a i386

Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   66 83 3a 00               cmpw   $0x0,(%edx)
Code;  00000004 Before first symbol
   4:   74 08                     je     e <_EIP+0xe> 0000000e Before first symbol
Code;  00000006 Before first symbol
   6:   0f b7 42 02               movzwl 0x2(%edx),%eax
Code;  0000000a Before first symbol
   a:   39 c8                     cmp    %ecx,%eax
Code;  0000000c Before first symbol
   c:   74 04                     je     12 <_EIP+0x12> 00000012 Before first symbol
Code;  0000000e Before first symbol
   e:   31 c0                     xor    %eax,%eax
Code;  00000010 Before first symbol
  10:   eb 15                     jmp    27 <_EIP+0x27> 00000027 Before first symbol
Code;  00000012 Before first symbol
  12:   fc                        cld    
Code;  00000013 Before first symbol
  13:   8b 00                     mov    (%eax),%eax


8 warnings issued.  Results may not be reliable.

--------------CDDB23ECE668CC4A115B5B54--
