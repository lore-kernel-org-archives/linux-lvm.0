Message-ID: <3B90C9A4.3080005@st-peter.stw.uni-erlangen.de>
Date: Sat, 01 Sep 2001 13:42:28 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de> <20010831110512.V541@turbolinux.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-xfs@oss.sgi.com, raiddev@nuclecu.unam.mx, linux-lvm@sistina.com

Hi

a small adition i've tried to format the LV with ext2 and reiserfs, but 
it didn't worked : mkfs segfaults
a strange one : i'm able to format with IBM JFS , and i can work without 
a problem with the LV everything just to be fine with JFS

i'm currently building:
  clean 2.4.9-linus with LVM-1.0.1rc1
       2.4.9-ac5 with LVM-1.0 ( i couldn't do it with LVM-1.0.1rc1 & rc2)
       2.4.10-pre2-xfs-cvs with LVM-1.0.1rc2
to find out what is going on with ext2 reiserfs XFS ,
is the problem coming from the XFS kernel changes

 >Hi
 >i'm having a serios trouble with creating
 >a LVM over software linear RAID
 >well i created it, formated it with XFS
 >but every time i try to mount the LV mount segfaults
 >and then i can not mount any other file system ( partition, CD, ..
 >until i reboot, when i try to mount smth mount simple stop to respond
 >without an error and blocks the console
 >
 >i'm using XFS cvs kernel 2.4.9 and LVM-1.0.1rc1
 >on ABIT's BP6 2xCelleron 533 512Mb RAM
 >the drives are on onboard HPT366 controler 2xWD 30Gb 1xMaxtor 40Gb
 >
 >the LV is striped over the 3 devices of the VG
 >the VG is /dev/hdh10 /dev/md6 /dev/md7
 >/dev/md6 is linear software RAID /dev/hde6 /dev/hde12
 >/dev/md7 is linear software RAID /dev/hdg1 /dev/hdg5 /dev/hdg6 >dev/hdg11
 >
 >i posted  to the LVM-lists and there i was told
 >to try  "dmesg | ksymoops"
 >
 >and i became the folowing answer
 >
 > > >>EIP; e29c0266 <[linear]linear_make_request+36/f0> <=====
 > >
 > >> Trace; c023fa12 <__make_request+412/6d0>
 > >> Trace; c0278dcd <md_make_request+4d/80>
 > >> Trace; c027fa0f <lvm_make_request_fn+f/20>
 > >> Trace; c023fd89 <generic_make_request+b9/120>
 > >
 > >OK, so the oops is inside the RAID layer, but it may be that it is
 > >being fed bogus data from a higher layer.  Even so, it should not
 > >oops in this case.  Since XFS changes a lot of the kernel code, I
 > >would either suggest asking the XFS folks to look at this oops,
 > >or maybe on the MD RAID mailing list, as they will know more about >it.
 >
 >this is the full "dmesg | ksymoops" , i'll try to use other FS to find
 >out whether it's a problem with XFS, but i wish me not to have to use
 >other FS, i realy love XFS


Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010247
eax: 004ac1ab   ebx: 004ac1ab   ecx: 00000000   edx: 00000000
esi: d54eb320   edi: c188b928   ebp: 00958357   esp: d4eb3670
ds: 0018   es: 0018   ss: 0018
Process mount (pid: 5536, stackpage=d4eb3000)
Stack: d54eb3e0 c023fa12 00000907 d54eb320 00000000 01c02000 c0278dcd
dcec43c0
         00000000 d54eb320 d54eb320 00000000 01c02000 c027fa0f 00000001
d54eb320
         c023fd89 c03a7254 00000000 d54eb320 00000282 00000021 00000000
00000000
Call Trace: [<c023fa12>] [<c0278dcd>] [<c027fa0f>] [<c023fd89>] [<c01a6814>]
     [<c01a6a85>] [<c01a6fc1>] [<c01a6c47>] [<c01a6990>] [<c0105dac>]
[<c0105f1c>]
     [<c02e2140>] [<c021c10a>] [<c01fe5b8>] [<c01ff2a4>] [<c01a553e>]
[<c01feb6f>]
     [<c01feed8>] [<c01fc322>] [<c0201f40>] [<c01fb8f3>] [<c0202fdf>]
[<c02026bf>]
     [<c01a60be>] [<c02026eb>] [<c021e674>] [<c020b69c>] [<c020b843>]
[<c020b871>]
     [<c021cf48>] [<c01294e0>] [<c0125f0e>] [<c0125d9d>] [<c013cd72>]
[<c013d01b>]
     [<c013dafc>] [<c01131e0>] [<c010724c>] [<c013dd56>] [<c013dbfc>]
[<c013de13>]
     [<c010715b>]
Code: f7 f9 85 d2 74 24 55 51 68 c0 03 9c e2 e8 58 6c 75 dd 6a 00

   >>EIP; e29c0266 <[linear]linear_make_request+36/f0>   <=====
Trace; c023fa12 <__make_request+412/6d0>
Trace; c0278dcd <md_make_request+4d/80>
Trace; c027fa0f <lvm_make_request_fn+f/20>
Trace; c023fd89 <generic_make_request+b9/120>
Trace; c01a6814 <_pagebuf_page_io+1f4/370>
Trace; c01a6a85 <_page_buf_page_apply+f5/1c0>
Trace; c01a6fc1 <pagebuf_segment_apply+b1/e0>
Trace; c01a6c47 <pagebuf_iorequest+f7/160>
Trace; c01a6990 <_page_buf_page_apply+0/1c0>
Trace; c0105dac <__down+bc/d0>
Trace; c0105f1c <__down_failed+8/c>
Trace; c02e2140 <stext_lock+45b4/99d6>
Trace; c021c10a <xfsbdstrat+3a/40>
Trace; c01fe5b8 <xlog_bread+48/80>
Trace; c01ff2a4 <xlog_find_zeroed+94/1e0>
Trace; c01a553e <_pagebuf_get_object+3e/170>
Trace; c01feb6f <xlog_find_head+1f/370>
Trace; c01feed8 <xlog_find_tail+18/350>
Trace; c01fc322 <xlog_alloc_log+2a2/2e0>
Trace; c0201f40 <xlog_recover+20/c0>
Trace; c01fb8f3 <xfs_log_mount+73/b0>
Trace; c0202fdf <xfs_mountfs+55f/e20>
Trace; c02026bf <xfs_readsb+af/f0>
Trace; c01a60be <pagebuf_rele+3e/80>
Trace; c02026eb <xfs_readsb+db/f0>
Trace; c021e674 <kmem_alloc+e4/110>
Trace; c020b69c <xfs_cmountfs+4bc/590>
Trace; c020b843 <xfs_mount+63/70>
Trace; c020b871 <xfs_vfsmount+21/40>
Trace; c021cf48 <linvfs_read_super+188/270>
Trace; c01294e0 <filemap_nopage+2c0/410>
Trace; c0125f0e <handle_mm_fault+ce/e0>
Trace; c0125d9d <do_no_page+4d/f0>
Trace; c013cd72 <read_super+72/110>
Trace; c013d01b <get_sb_bdev+18b/1e0>
Trace; c013dafc <do_add_mount+1dc/290>
Trace; c01131e0 <do_page_fault+0/4b0>
Trace; c010724c <error_code+34/3c>
Trace; c013dd56 <do_mount+106/120>
Trace; c013dbfc <copy_mount_options+4c/a0>
Trace; c013de13 <sys_mount+a3/130>
Trace; c010715b <system_call+33/38>
Code;  e29c0266 <[linear]linear_make_request+36/f0>
00000000 <_EIP>:
Code;  e29c0266 <[linear]linear_make_request+36/f0>   <=====
     0:   f7 f9                     idiv   %ecx,%eax   <=====
Code;  e29c0268 <[linear]linear_make_request+38/f0>
     2:   85 d2                     test   %edx,%edx
Code;  e29c026a <[linear]linear_make_request+3a/f0>
     4:   74 24                     je     2a <_EIP+0x2a> e29c0290
<[linear]linear_make_request+60/f0>
Code;  e29c026c <[linear]linear_make_request+3c/f0>
     6:   55                        push   %ebp
Code;  e29c026d <[linear]linear_make_request+3d/f0>
     7:   51                        push   %ecx
Code;  e29c026e <[linear]linear_make_request+3e/f0>
     8:   68 c0 03 9c e2            push   $0xe29c03c0
Code;  e29c0273 <[linear]linear_make_request+43/f0>
     d:   e8 58 6c 75 dd            call   dd756c6a <_EIP+0xdd756c6a>
c0116ed0 <printk+0/1a0>
Code;  e29c0278 <[linear]linear_make_request+48/f0>
    12:   6a 00                     push   $0x0

Andreas Dilger wrote:

  >On Aug 31, 2001  15:08 +0200, svetljo wrote:
  >
  >>[root@svetljo mnt]# mount -t xfs /dev/myData/Music music
  >>Segmentation fault
  >>
  >
  >Generally this is a bad sign.  Either mount is segfaulting (unlikely)
  >or you are getting an oops in the kernel.  You need do run something
  >like "dmesg | ksymoops" in order to get some useful data about where
  >the problem is (could be xfs, LVM, or elsewhere in the kernel).
  >
  >Once you have an oops, you are best off rebooting the system, because
  >your kernel memory may be corrupted, and cause more oopses which do
  >not mean anything.  If you look in /var/log/messages (or 
/var/log/kern.log
  >or some other place, depending on where kernel messages go), you can
  >decode the FIRST oops in the log with ksymoops.  All subsequent ones are
  >useless.
  >
  >
  >>the LV ( lvcreate -i3 -I4 -L26G -nMusic )
  >>
  >>the VG -> myData   /dev/hdh10 /dev/linVG1/linLV1 /dev/linVG2/linLV2
  >>
  >>/dev/hdh10 normal partition 14G
  >>/dev/linVG1/linLV1 ->  linear LV 14G /dev/hde6 /dev/hde12
  >>/dev/linVg2/linLV2 ->  linear LV 14G /dev/hdg1 /dev/hdg5 /dev/hdg6
/dev/hdg12
  >>
  >
  >There is absolutely no point in doing this (not that it is possible to do
  >so anyways).  First of all, striping is almost never needed "for
performance"
  >unless you are normally doing very large sequential I/Os, and even so 
most
  >disks today have very good sequential I/O rates (e.g. 15-30MB/s).
Secondly,
  >you _should_ be able to just create a single LV that is striped 
across all
  >of the PVs above.  You would likely need to build it in steps, to ensure
  >that it is striped across the disks correctly.
  >
  >Cheers, Andreas
  >
