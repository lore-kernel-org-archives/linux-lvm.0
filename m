From: Jan Niehusmann <jan@gondor.com>
Message-ID: <20030828213258.GA7739@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] oops
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
Date: Fri Aug 29 07:09:13 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@uk.sistina.com>
Cc: linux-lvm@sistina.com

Here is the oops I mentioned on IRC.

# dmsetup table vgraid-kernelsource
0 2097152 linear 254:029 68059136
# dmsetup table vgraid-pvmove0
0 4194304 linear 003:004 64288496

(so vgraid-kernelsource points behind the end of vgraid-pvmove0)

# cat /dev/vgraid/kernelsource (which is a symlink to
				/dev/mapper/vgraid-kernelsource)
Segmentation fault

ksymoops 2.4.8 on i686 2.4.22.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.22/ (default)
     -m /boot/System.map-2.4.22 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Aug 28 23:22:07 sirith kernel: Unable to handle kernel paging request at virtual address 0d420295
Aug 28 23:22:07 sirith kernel: e0935bcb
Aug 28 23:22:07 sirith kernel: *pde = 00000000
Aug 28 23:22:07 sirith kernel: Oops: 0000
Aug 28 23:22:07 sirith kernel: CPU:    0
Aug 28 23:22:07 sirith kernel: EIP:    0010:[<e0935bcb>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
Aug 28 23:22:07 sirith kernel: EFLAGS: 00210292
Aug 28 23:22:07 sirith kernel: eax: c2f20770   ebx: d85f3d00   ecx: e081e01c   edx: 0d420285
Aug 28 23:22:07 sirith kernel: esi: 00100000   edi: d587b740   ebp: 00000000   esp: cffd7e40
Aug 28 23:22:07 sirith kernel: ds: 0018   es: 0018   ss: 0018
Aug 28 23:22:07 sirith kernel: Process cat (pid: 7599, stackpage=cffd7000)
Aug 28 23:22:07 sirith kernel: Stack: e081e01c d587b740 00000000 c2f20770 c2f20764 d587b740 00100000 00000008 
Aug 28 23:22:07 sirith kernel:        00000000 c01b9030 c02e5ce8 00000000 d587b740 d587b740 c114531c 00000000 
Aug 28 23:22:07 sirith kernel:        d587b740 00000008 00000000 00001000 c01b90db 00000000 d587b740 00000000 
Aug 28 23:22:07 sirith kernel: Call Trace:    [<c01b9030>] [<c01b90db>] [<c013d584>] [<c0133d9f>] [<c012c77f>]
Aug 28 23:22:07 sirith kernel:   [<c01406a0>] [<c012cc40>] [<c012cd92>] [<c012cc40>] [<c013a853>] [<c010730f>]
Aug 28 23:22:07 sirith kernel: Code: ff 52 10 e9 32 ff ff ff 31 f6 e9 31 ff ff ff 89 d8 ff 00 0f 


>>EIP; e0935bcb <[dm-mod]dm_request+17b/1d0>   <=====

>>eax; c2f20770 <_end+2c318c4/2059f1d4>
>>ebx; d85f3d00 <_end+18304e54/2059f1d4>
>>ecx; e081e01c <_end+2052f170/2059f1d4>
>>edi; d587b740 <_end+1558c894/2059f1d4>
>>esp; cffd7e40 <_end+fce8f94/2059f1d4>

Trace; c01b9030 <generic_make_request+e0/130>
Trace; c01b90db <submit_bh+5b/a0>
Trace; c013d584 <block_read_full_page+134/260>
Trace; c0133d9f <__alloc_pages+3f/170>
Trace; c012c77f <do_generic_file_read+29f/440>
Trace; c01406a0 <blkdev_get_block+0/60>
Trace; c012cc40 <file_read_actor+0/a0>
Trace; c012cd92 <generic_file_read+b2/1b0>
Trace; c012cc40 <file_read_actor+0/a0>
Trace; c013a853 <sys_read+a3/130>
Trace; c010730f <system_call+33/38>

Code;  e0935bcb <[dm-mod]dm_request+17b/1d0>
00000000 <_EIP>:
Code;  e0935bcb <[dm-mod]dm_request+17b/1d0>   <=====
   0:   ff 52 10                  call   *0x10(%edx)   <=====
Code;  e0935bce <[dm-mod]dm_request+17e/1d0>
   3:   e9 32 ff ff ff            jmp    ffffff3a <_EIP+0xffffff3a>
Code;  e0935bd3 <[dm-mod]dm_request+183/1d0>
   8:   31 f6                     xor    %esi,%esi
Code;  e0935bd5 <[dm-mod]dm_request+185/1d0>
   a:   e9 31 ff ff ff            jmp    ffffff40 <_EIP+0xffffff40>
Code;  e0935bda <[dm-mod]dm_request+18a/1d0>
   f:   89 d8                     mov    %ebx,%eax
Code;  e0935bdc <[dm-mod]dm_request+18c/1d0>
  11:   ff 00                     incl   (%eax)
Code;  e0935bde <[dm-mod]dm_request+18e/1d0>
  13:   0f 00 00                  sldtl  (%eax)


1 warning issued.  Results may not be reliable.
