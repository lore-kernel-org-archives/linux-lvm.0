Message-ID: <3BBB6328.8020504@st-peter.stw.uni-erlangen.de>
Date: Wed, 03 Oct 2001 21:12:40 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
References: <Pine.LNX.4.33.0110031956510.16480-100000@dunlop.dub.ie.alphyra.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

some my thoughts:

you can not expect that lvm tools will work in case the kernel code is 
different version
every time you change the tools you should also patch the kernel

in the case with 0.9.1beta7,
i didn't know that it is possible to use any lvm code prior lvm-1.0.1rc1
( the min -max changes in linus's 2.4.9 -- the reason for lvm-1.0.1rc1)
and thats making me to think that you didn't patch the kernel,
the plain kernel comes with lvm-0.9.1beta2
so see again the begining 


Paul Jakma wrote:

>and some more info:
>
>lvm 1.0.1rc3 compiled with RH gcc 2.96-97 running on the kernel
>described below (ie 0.9.1b7 kernel) also segfaults in the exact same
>way.
>
>regards,
>
>--paulj
>
>On Wed, 3 Oct 2001, Paul Jakma wrote:
>
>>doh...
>>
>>this is 0.9.1beta7, on stock kernel 2.4.9 + LVM 0.9.1beta7 + ext3 + NFS fixups
>>
>>On Wed, 3 Oct 2001, Paul Jakma wrote:
>>
>>>hi,
>>>
>>>running lvcreate consistently segfaults on me, eg:
>>>
>>> /lib/lvm-iop10/lvcreate -L 600M -n var_cache_lv Main_VG
>>>
>>>
>>>#0  0x4004500b in vg_setup_pointers_for_snapshots (vg=0x8058038)
>>>    at vg_setup_pointers_for_snapshots.c:37
>>>37	      if ( lv_chain_ptr->lv_access & LV_SNAPSHOT_ORG) {
>>>(gdb) bt
>>>#0  0x4004500b in vg_setup_pointers_for_snapshots (vg=0x8058038)
>>>    at vg_setup_pointers_for_snapshots.c:37
>>>#1  0x40045d0d in vg_status_with_pv_and_lv (vg_name=0xbffffbe3 "Main_VG", 
>>>    vg=0xbffff254) at vg_status_with_pv_and_lv.c:63
>>>#2  0x0804abbd in strcpy ()
>>>#3  0x400767c7 in __libc_start_main (main=0x8049370 <strcpy+272>, argc=6, 
>>>    ubp_av=0xbffffaa4, init=0x8048ea8 <_init>, fini=0x804beb0 <_fini>, 
>>>    rtld_fini=0x4000db74 <_dl_fini>, stack_end=0xbffffa9c)
>>>    at ../sysdeps/generic/libc-start.c:129
>>>(gdb) print *vg          
>>>$3 = {vg_name = "Main_VG", '\000' <repeats 120 times>, vg_number = 0, 
>>>  vg_access = 3, vg_status = 5, lv_max = 256, lv_cur = 6, lv_open = 5, 
>>>  pv_max = 256, pv_cur = 2, pv_act = 2, dummy = 0, vgda = 0, pe_size = 8192, 
>>>  pe_total = 3690, pe_allocated = 849, pvg_total = 0, proc = 0x0, pv = {
>>>    0xc7c83800, 0xc7c83a00, 0x0 <repeats 255 times>}, lv = {0xc7c83c00, 
>>>    0xc7c83e00, 0xc65e3000, 0xc65e3200, 0xc65e3400, 0xc65e3600, 
>>>    0x0 <repeats 251 times>}, vg_uuid = "Main_VG", '\000' <repeats 25 times>, 
>>>  dummy1 = "\000\000\000`���`���`���", '\000' <repeats 184 times>}
>>>(gdb) print *lv_chain_ptr
>>>Cannot access memory at address 0xc7c83c00
>>>
>>>and boom...
>>>
>>>any fixes for this? i've tried compiling with both RH's compat-egcs 
>>>and gcc-2.96-97 compilers, same result each time.
>>>
>>>ta,
>>>
>>>--paulj
>>>
>>--paulj
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
