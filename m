Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8E2ZI3o002968
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2006 22:35:18 -0400
Received: from mail.thecus.com (mail.thecus.com [220.130.176.208])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8E2Z8hF021004
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2006 22:35:09 -0400
Received: from kevincheng (kevincheng.thecus.com [172.16.66.73])
	(authenticated bits=0)
	by mail.thecus.com (8.13.1/8.13.1) with ESMTP id k8E2aCa7024082
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2006 10:36:18 +0800
Message-Id: <200609140236.k8E2aCa7024082@mail.thecus.com>
From: "kevin Cheng" <kevin_cheng@thecus.com>
Date: Thu, 14 Sep 2006 10:36:25 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0341_01C6D7E9.A23FF490"
Subject: [linux-lvm] Out of memory happen in snapshot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_0341_01C6D7E9.A23FF490
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear all:
   We create the 8 snapshots in one volumn ,and copy a 4G file to the volumn
,
and system happen "out of memory" and oom-killer kill my processes. 
Someone have happen this problem ,have any way to solve it ? Thanks!!
 
My PC info:
celoron M 1,5GHz
memory :256MB
My volumn be created on RAID0
kernel is 2.6.17
Filesyetm is ext3
swap memory have 1GB
 
 
Out of memory Info :
-killer: gfp_mask=0x201d2, order=0
 <c012977a> out_of_memory+0x28/0x7a  <c012a603> __alloc_pages+0x1e5/0x26a
 <c012778b> page_cache_read+0x3d/0x91  <c0127972> filemap_nopage+0x193/0x2a8
 <c0130f17> do_no_page+0x6a/0x1c1  <c013118b> __handle_mm_fault+0xbc/0x15a
 <c010d87f> do_page_fault+0x239/0x561  <c010d646> do_page_fault+0x0/0x561
 <c0102e87> error_code+0x4f/0x54
Mem-info:
DMA per-cpu:
cpu 0 hot: high 0, batch 1 used:0
cpu 0 cold: high 0, batch 1 used:0
DMA32 per-cpu: empty
Normal per-cpu:
cpu 0 hot: high 90, batch 15 used:18
cpu 0 cold: high 30, batch 7 used:24
HighMem per-cpu: empty
Free pages:       24772kB (0kB HighMem)
Active:1061 inactive:17650 dirty:3602 writeback:4502 unstable:0 free:6193
slab:32454 mapped:66 pagetables:169
DMA free:2880kB min:1928kB low:2408kB high:2892kB active:68kB
inactive:4640kB present:16384kB pages_scanned:4506 all_unreclaimable? yes
lowmem_reserve[]: 0 0 238 238
DMA32 free:0kB min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB
pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 238 238
Normal free:21892kB min:28788kB low:35984kB high:43180kB active:4176kB
inactive:65960kB present:244672kB pages_scanned:73425 all_unreclaimable? yes
lowmem_reserve[]: 0 0 0 0
HighMem free:0kB min:128kB low:128kB high:128kB active:0kB inactive:0kB
present:0kB pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 0 0
DMA: 0*4kB 42*8kB 147*16kB 0*32kB 1*64kB 1*128kB 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB = 2880kB
DMA32: empty
Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB 1*512kB
0*1024kB 1*2048kB 0*4096kB = 21892kB
HighMem: empty
Swap cache: add 5930, delete 5875, find 21346/21816, race 0+0
Free swap  = 975336kB
Total swap = 987832kB
Free swap:       975336kB
65264 pages of RAM
0 pages of HIGHMEM
1324 reserved pages
9298 pages shared
55 pages swap cached
3602 pages dirty
4502 pages writeback
66 pages mapped
32454 pages slab
169 pages pagetables
oom-killer: gfp_mask=0x200d2, order=0
 <c012977a> out_of_memory+0x28/0x7a  <c012a603> __alloc_pages+0x1e5/0x26a
 <c0135cc7> read_swap_cache_async+0x2e/0x73  <c0130c1a>
do_swap_page+0x62/0x1ec
 <c01311c1> __handle_mm_fault+0xf2/0x15a  <c010d87f>
do_page_fault+0x239/0x561
 <c010d646> do_page_fault+0x0/0x561  <c0102e87> error_code+0x4f/0x54
Mem-info:
DMA per-cpu:
cpu 0 hot: high 0, batch 1 used:0
cpu 0 cold: high 0, batch 1 used:0
DMA32 per-cpu: empty
Normal per-cpu:
cpu 0 hot: high 90, batch 15 used:18
cpu 0 cold: high 30, batch 7 used:24
HighMem per-cpu: empty
Free pages:       24772kB (0kB HighMem)
Active:1061 inactive:17650 dirty:3591 writeback:4513 unstable:0 free:6193
slab:32454 mapped:66 pagetables:169
DMA free:2880kB min:1928kB low:2408kB high:2892kB active:68kB
inactive:4640kB present:16384kB pages_scanned:4538 all_unreclaimable? yes
lowmem_reserve[]: 0 0 238 238
DMA32 free:0kB min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB
pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 238 238
Normal free:21892kB min:28788kB low:35984kB high:43180kB active:4176kB
inactive:65960kB present:244672kB pages_scanned:73489 all_unreclaimable? yes
lowmem_reserve[]: 0 0 0 0
HighMem free:0kB min:128kB low:128kB high:128kB active:0kB inactive:0kB
present:0kB pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 0 0
DMA: 0*4kB 42*8kB 147*16kB 0*32kB 1*64kB 1*128kB 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB = 2880kB
DMA32: empty
Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB 1*512kB
0*1024kB 1*2048kB 0*4096kB = 21892kB
HighMem: empty
Swap cache: add 5930, delete 5875, find 21346/21816, race 0+0
Free swap  = 975336kB
Total swap = 987832kB
Free swap:       975336kB
65264 pages of RAM
0 pages of HIGHMEM
1324 reserved pages
9298 pages shared
55 pages swap cached
3591 pages dirty
4513 pages writeback
66 pages mapped
32454 pages slab
169 pages pagetables
oom-killer: gfp_mask=0x200d2, order=0
 <c012977a> out_of_memory+0x28/0x7a  <c012a603> __alloc_pages+0x1e5/0x26a
 <c0135cc7> read_swap_cache_async+0x2e/0x73  <c0130c1a>
do_swap_page+0x62/0x1ec
 <c01311c1> __handle_mm_fault+0xf2/0x15a  <c010d87f>
do_page_fault+0x239/0x561
 <c010d646> do_page_fault+0x0/0x561  <c0102e87> error_code+0x4f/0x54
Mem-info:
DMA per-cpu:
cpu 0 hot: high 0, batch 1 used:0
cpu 0 cold: high 0, batch 1 used:0
DMA32 per-cpu: empty
Normal per-cpu:
cpu 0 hot: high 90, batch 15 used:18
cpu 0 cold: high 30, batch 7 used:24
HighMem per-cpu: empty
Free pages:       24772kB (0kB HighMem)
Active:1061 inactive:17650 dirty:3591 writeback:4513 unstable:0 free:6193
slab:32454 mapped:66 pagetables:169
DMA free:2880kB min:1928kB low:2408kB high:2892kB active:68kB
inactive:4640kB present:16384kB pages_scanned:4538 all_unreclaimable? yes
lowmem_reserve[]: 0 0 238 238
DMA32 free:0kB min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB
pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 238 238
Normal free:21892kB min:28788kB low:35984kB high:43180kB active:4176kB
inactive:65960kB present:244672kB pages_scanned:73489 all_unreclaimable? yes
lowmem_reserve[]: 0 0 0 0
HighMem free:0kB min:128kB low:128kB high:128kB active:0kB inactive:0kB
present:0kB pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 0 0
DMA: 0*4kB 42*8kB 147*16kB 0*32kB 1*64kB 1*128kB 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB = 2880kB
DMA32: empty
Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB 1*512kB
0*1024kB 1*2048kB 0*4096kB = 21892kB
HighMem: empty
Swap cache: add 5930, delete 5875, find 21346/21816, race 0+0
Free swap  = 975336kB
Total swap = 987832kB
Free swap:       975336kB
65264 pages of RAM
0 pages of HIGHMEM
1324 reserved pages
9298 pages shared
55 pages swap cached
3591 pages dirty
4513 pages writeback
66 pages mapped
32454 pages slab
169 pages pagetables
oom-killer: gfp_mask=0x201d2, order=0
 <c012977a> out_of_memory+0x28/0x7a  <c012a603> __alloc_pages+0x1e5/0x26a
 <c012778b> page_cache_read+0x3d/0x91  <c0127972> filemap_nopage+0x193/0x2a8
 <c0130f17> do_no_page+0x6a/0x1c1  <c013118b> __handle_mm_fault+0xbc/0x15a
 <c010d87f> do_page_fault+0x239/0x561  <c010d646> do_page_fault+0x0/0x561
 <c0102e87> error_code+0x4f/0x54
Mem-info:
DMA per-cpu:
cpu 0 hot: high 0, batch 1 used:0
cpu 0 cold: high 0, batch 1 used:0
DMA32 per-cpu: empty
Normal per-cpu:
cpu 0 hot: high 90, batch 15 used:18
cpu 0 cold: high 30, batch 7 used:24
HighMem per-cpu: empty
Free pages:       24772kB (0kB HighMem)
Active:1029 inactive:17682 dirty:3591 writeback:4513 unstable:0 free:6193
slab:32454 mapped:66 pagetables:169
DMA free:2880kB min:1928kB low:2408kB high:2892kB active:68kB
inactive:4640kB present:16384kB pages_scanned:4538 all_unreclaimable? yes
lowmem_reserve[]: 0 0 238 238
DMA32 free:0kB min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB
pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 238 238
Normal free:21892kB min:28788kB low:35984kB high:43180kB active:4048kB
inactive:66088kB present:244672kB pages_scanned:73521 all_unreclaimable? yes
lowmem_reserve[]: 0 0 0 0
HighMem free:0kB min:128kB low:128kB high:128kB active:0kB inactive:0kB
present:0kB pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 0 0
DMA: 0*4kB 42*8kB 147*16kB 0*32kB 1*64kB 1*128kB 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB = 2880kB
DMA32: empty
Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB 1*512kB
0*1024kB 1*2048kB 0*4096kB = 21892kB
HighMem: empty
Swap cache: add 5930, delete 5875, find 21346/21816, race 0+0
Free swap  = 975336kB
Total swap = 987832kB
Free swap:       975336kB
65264 pages of RAM
0 pages of HIGHMEM
1324 reserved pages
9298 pages shared
55 pages swap cached
3591 pages dirty
4513 pages writeback
66 pages mapped
32454 pages slab
169 pages pagetables

 
 
 
 
Thanks for all advice ,
 
Regards,
 
Kevin Cheng
 

------=_NextPart_000_0341_01C6D7E9.A23FF490
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2802" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT size=3D2>Dear all:</FONT></DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp; We create the 8 snapshots in one volumn =
,and copy=20
a 4G file to the volumn ,</FONT></DIV>
<DIV><FONT size=3D2>and system happen "out of memory" and oom-killer =
kill my=20
processes. </FONT></DIV>
<DIV><FONT size=3D2>Someone have happen this problem ,have any way to =
solve it ?=20
Thanks!!</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>My PC info:</FONT></DIV>
<DIV><FONT size=3D2>celoron M 1,5GHz</FONT></DIV>
<DIV><FONT size=3D2>memory :256MB</FONT></DIV>
<DIV><FONT size=3D2>My volumn be created on RAID0</FONT></DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; size=3D2>kernel is =
2.6.17</FONT></DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; size=3D2>Filesyetm is =
ext3</FONT></DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; size=3D2>swap memory =
have 1GB</FONT></DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; size=3D2>Out of =
memory Info :</FONT></DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636;=20
size=3D2>-killer: gfp_mask=3D0x201d2, =
order=3D0<BR>&nbsp;&lt;c012977a&gt;=20
out_of_memory+0x28/0x7a&nbsp; &lt;c012a603&gt;=20
__alloc_pages+0x1e5/0x26a<BR>&nbsp;&lt;c012778b&gt;=20
page_cache_read+0x3d/0x91&nbsp; &lt;c0127972&gt;=20
filemap_nopage+0x193/0x2a8<BR>&nbsp;&lt;c0130f17&gt; =
do_no_page+0x6a/0x1c1&nbsp;=20
&lt;c013118b&gt; __handle_mm_fault+0xbc/0x15a<BR>&nbsp;&lt;c010d87f&gt;=20
do_page_fault+0x239/0x561&nbsp; &lt;c010d646&gt;=20
do_page_fault+0x0/0x561<BR>&nbsp;&lt;c0102e87&gt;=20
error_code+0x4f/0x54<BR>Mem-info:<BR>DMA per-cpu:<BR>cpu 0 hot: high 0, =
batch 1=20
used:0<BR>cpu 0 cold: high 0, batch 1 used:0<BR>DMA32 per-cpu: =
empty<BR>Normal=20
per-cpu:<BR>cpu 0 hot: high 90, batch 15 used:18<BR>cpu 0 cold: high 30, =
batch 7=20
used:24<BR>HighMem per-cpu: empty<BR>Free=20
pages:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24772kB (0kB =
HighMem)<BR>Active:1061=20
inactive:17650 dirty:3602 writeback:4502 unstable:0 free:6193 slab:32454 =

mapped:66 pagetables:169<BR>DMA free:2880kB min:1928kB low:2408kB =
high:2892kB=20
active:68kB inactive:4640kB present:16384kB pages_scanned:4506=20
all_unreclaimable? yes<BR>lowmem_reserve[]: 0 0 238 238<BR>DMA32 =
free:0kB=20
min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB =
pages_scanned:0=20
all_unreclaimable? no<BR>lowmem_reserve[]: 0 0 238 238<BR>Normal =
free:21892kB=20
min:28788kB low:35984kB high:43180kB active:4176kB inactive:65960kB=20
present:244672kB pages_scanned:73425 all_unreclaimable? =
yes<BR>lowmem_reserve[]:=20
0 0 0 0<BR>HighMem free:0kB min:128kB low:128kB high:128kB active:0kB=20
inactive:0kB present:0kB pages_scanned:0 all_unreclaimable?=20
no<BR>lowmem_reserve[]: 0 0 0 0<BR>DMA: 0*4kB 42*8kB 147*16kB 0*32kB =
1*64kB=20
1*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 2880kB<BR>DMA32:=20
empty<BR>Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB =
1*512kB=20
0*1024kB 1*2048kB 0*4096kB =3D 21892kB<BR>HighMem: empty<BR>Swap cache: =
add 5930,=20
delete 5875, find 21346/21816, race 0+0<BR>Free swap&nbsp; =3D =
975336kB<BR>Total=20
swap =3D 987832kB<BR>Free swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
975336kB<BR>65264 pages of RAM<BR>0 pages of HIGHMEM<BR>1324 reserved=20
pages<BR>9298 pages shared<BR>55 pages swap cached<BR>3602 pages =
dirty<BR>4502=20
pages writeback<BR>66 pages mapped<BR>32454 pages slab<BR>169 pages=20
pagetables<BR>oom-killer: gfp_mask=3D0x200d2, =
order=3D0<BR>&nbsp;&lt;c012977a&gt;=20
out_of_memory+0x28/0x7a&nbsp; &lt;c012a603&gt;=20
__alloc_pages+0x1e5/0x26a<BR>&nbsp;&lt;c0135cc7&gt;=20
read_swap_cache_async+0x2e/0x73&nbsp; &lt;c0130c1a&gt;=20
do_swap_page+0x62/0x1ec<BR>&nbsp;&lt;c01311c1&gt;=20
__handle_mm_fault+0xf2/0x15a&nbsp; &lt;c010d87f&gt;=20
do_page_fault+0x239/0x561<BR>&nbsp;&lt;c010d646&gt;=20
do_page_fault+0x0/0x561&nbsp; &lt;c0102e87&gt;=20
error_code+0x4f/0x54<BR>Mem-info:<BR>DMA per-cpu:<BR>cpu 0 hot: high 0, =
batch 1=20
used:0<BR>cpu 0 cold: high 0, batch 1 used:0<BR>DMA32 per-cpu: =
empty<BR>Normal=20
per-cpu:<BR>cpu 0 hot: high 90, batch 15 used:18<BR>cpu 0 cold: high 30, =
batch 7=20
used:24<BR>HighMem per-cpu: empty<BR>Free=20
pages:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24772kB (0kB =
HighMem)<BR>Active:1061=20
inactive:17650 dirty:3591 writeback:4513 unstable:0 free:6193 slab:32454 =

mapped:66 pagetables:169<BR>DMA free:2880kB min:1928kB low:2408kB =
high:2892kB=20
active:68kB inactive:4640kB present:16384kB pages_scanned:4538=20
all_unreclaimable? yes<BR>lowmem_reserve[]: 0 0 238 238<BR>DMA32 =
free:0kB=20
min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB =
pages_scanned:0=20
all_unreclaimable? no<BR>lowmem_reserve[]: 0 0 238 238<BR>Normal =
free:21892kB=20
min:28788kB low:35984kB high:43180kB active:4176kB inactive:65960kB=20
present:244672kB pages_scanned:73489 all_unreclaimable? =
yes<BR>lowmem_reserve[]:=20
0 0 0 0<BR>HighMem free:0kB min:128kB low:128kB high:128kB active:0kB=20
inactive:0kB present:0kB pages_scanned:0 all_unreclaimable?=20
no<BR>lowmem_reserve[]: 0 0 0 0<BR>DMA: 0*4kB 42*8kB 147*16kB 0*32kB =
1*64kB=20
1*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 2880kB<BR>DMA32:=20
empty<BR>Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB =
1*512kB=20
0*1024kB 1*2048kB 0*4096kB =3D 21892kB<BR>HighMem: empty<BR>Swap cache: =
add 5930,=20
delete 5875, find 21346/21816, race 0+0<BR>Free swap&nbsp; =3D =
975336kB<BR>Total=20
swap =3D 987832kB<BR>Free swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
975336kB<BR>65264 pages of RAM<BR>0 pages of HIGHMEM<BR>1324 reserved=20
pages<BR>9298 pages shared<BR>55 pages swap cached<BR>3591 pages =
dirty<BR>4513=20
pages writeback<BR>66 pages mapped<BR>32454 pages slab<BR>169 pages=20
pagetables<BR>oom-killer: gfp_mask=3D0x200d2, =
order=3D0<BR>&nbsp;&lt;c012977a&gt;=20
out_of_memory+0x28/0x7a&nbsp; &lt;c012a603&gt;=20
__alloc_pages+0x1e5/0x26a<BR>&nbsp;&lt;c0135cc7&gt;=20
read_swap_cache_async+0x2e/0x73&nbsp; &lt;c0130c1a&gt;=20
do_swap_page+0x62/0x1ec<BR>&nbsp;&lt;c01311c1&gt;=20
__handle_mm_fault+0xf2/0x15a&nbsp; &lt;c010d87f&gt;=20
do_page_fault+0x239/0x561<BR>&nbsp;&lt;c010d646&gt;=20
do_page_fault+0x0/0x561&nbsp; &lt;c0102e87&gt;=20
error_code+0x4f/0x54<BR>Mem-info:<BR>DMA per-cpu:<BR>cpu 0 hot: high 0, =
batch 1=20
used:0<BR>cpu 0 cold: high 0, batch 1 used:0<BR>DMA32 per-cpu: =
empty<BR>Normal=20
per-cpu:<BR>cpu 0 hot: high 90, batch 15 used:18<BR>cpu 0 cold: high 30, =
batch 7=20
used:24<BR>HighMem per-cpu: empty<BR>Free=20
pages:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24772kB (0kB =
HighMem)<BR>Active:1061=20
inactive:17650 dirty:3591 writeback:4513 unstable:0 free:6193 slab:32454 =

mapped:66 pagetables:169<BR>DMA free:2880kB min:1928kB low:2408kB =
high:2892kB=20
active:68kB inactive:4640kB present:16384kB pages_scanned:4538=20
all_unreclaimable? yes<BR>lowmem_reserve[]: 0 0 238 238<BR>DMA32 =
free:0kB=20
min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB =
pages_scanned:0=20
all_unreclaimable? no<BR>lowmem_reserve[]: 0 0 238 238<BR>Normal =
free:21892kB=20
min:28788kB low:35984kB high:43180kB active:4176kB inactive:65960kB=20
present:244672kB pages_scanned:73489 all_unreclaimable? =
yes<BR>lowmem_reserve[]:=20
0 0 0 0<BR>HighMem free:0kB min:128kB low:128kB high:128kB active:0kB=20
inactive:0kB present:0kB pages_scanned:0 all_unreclaimable?=20
no<BR>lowmem_reserve[]: 0 0 0 0<BR>DMA: 0*4kB 42*8kB 147*16kB 0*32kB =
1*64kB=20
1*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 2880kB<BR>DMA32:=20
empty<BR>Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB =
1*512kB=20
0*1024kB 1*2048kB 0*4096kB =3D 21892kB<BR>HighMem: empty<BR>Swap cache: =
add 5930,=20
delete 5875, find 21346/21816, race 0+0<BR>Free swap&nbsp; =3D =
975336kB<BR>Total=20
swap =3D 987832kB<BR>Free swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
975336kB<BR>65264 pages of RAM<BR>0 pages of HIGHMEM<BR>1324 reserved=20
pages<BR>9298 pages shared<BR>55 pages swap cached<BR>3591 pages =
dirty<BR>4513=20
pages writeback<BR>66 pages mapped<BR>32454 pages slab<BR>169 pages=20
pagetables<BR>oom-killer: gfp_mask=3D0x201d2, =
order=3D0<BR>&nbsp;&lt;c012977a&gt;=20
out_of_memory+0x28/0x7a&nbsp; &lt;c012a603&gt;=20
__alloc_pages+0x1e5/0x26a<BR>&nbsp;&lt;c012778b&gt;=20
page_cache_read+0x3d/0x91&nbsp; &lt;c0127972&gt;=20
filemap_nopage+0x193/0x2a8<BR>&nbsp;&lt;c0130f17&gt; =
do_no_page+0x6a/0x1c1&nbsp;=20
&lt;c013118b&gt; __handle_mm_fault+0xbc/0x15a<BR>&nbsp;&lt;c010d87f&gt;=20
do_page_fault+0x239/0x561&nbsp; &lt;c010d646&gt;=20
do_page_fault+0x0/0x561<BR>&nbsp;&lt;c0102e87&gt;=20
error_code+0x4f/0x54<BR>Mem-info:<BR>DMA per-cpu:<BR>cpu 0 hot: high 0, =
batch 1=20
used:0<BR>cpu 0 cold: high 0, batch 1 used:0<BR>DMA32 per-cpu: =
empty<BR>Normal=20
per-cpu:<BR>cpu 0 hot: high 90, batch 15 used:18<BR>cpu 0 cold: high 30, =
batch 7=20
used:24<BR>HighMem per-cpu: empty<BR>Free=20
pages:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24772kB (0kB =
HighMem)<BR>Active:1029=20
inactive:17682 dirty:3591 writeback:4513 unstable:0 free:6193 slab:32454 =

mapped:66 pagetables:169<BR>DMA free:2880kB min:1928kB low:2408kB =
high:2892kB=20
active:68kB inactive:4640kB present:16384kB pages_scanned:4538=20
all_unreclaimable? yes<BR>lowmem_reserve[]: 0 0 238 238<BR>DMA32 =
free:0kB=20
min:0kB low:0kB high:0kB active:0kB inactive:0kB present:0kB =
pages_scanned:0=20
all_unreclaimable? no<BR>lowmem_reserve[]: 0 0 238 238<BR>Normal =
free:21892kB=20
min:28788kB low:35984kB high:43180kB active:4048kB inactive:66088kB=20
present:244672kB pages_scanned:73521 all_unreclaimable? =
yes<BR>lowmem_reserve[]:=20
0 0 0 0<BR>HighMem free:0kB min:128kB low:128kB high:128kB active:0kB=20
inactive:0kB present:0kB pages_scanned:0 all_unreclaimable?=20
no<BR>lowmem_reserve[]: 0 0 0 0<BR>DMA: 0*4kB 42*8kB 147*16kB 0*32kB =
1*64kB=20
1*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 2880kB<BR>DMA32:=20
empty<BR>Normal: 1779*4kB 839*8kB 342*16kB 1*32kB 0*64kB 0*128kB 0*256kB =
1*512kB=20
0*1024kB 1*2048kB 0*4096kB =3D 21892kB<BR>HighMem: empty<BR>Swap cache: =
add 5930,=20
delete 5875, find 21346/21816, race 0+0<BR>Free swap&nbsp; =3D =
975336kB<BR>Total=20
swap =3D 987832kB<BR>Free swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
975336kB<BR>65264 pages of RAM<BR>0 pages of HIGHMEM<BR>1324 reserved=20
pages<BR>9298 pages shared<BR>55 pages swap cached<BR>3591 pages =
dirty<BR>4513=20
pages writeback<BR>66 pages mapped<BR>32454 pages slab<BR>169 pages=20
pagetables<BR></FONT>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; size=3D2>Thanks for =
all advice ,</FONT></DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2>Regards,</FONT></DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D&#26032;&#32048;&#26126;&#39636; size=3D2>Kevin =
Cheng</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0341_01C6D7E9.A23FF490--
