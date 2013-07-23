Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6N2krwg009020
	for <linux-lvm@redhat.com>; Mon, 22 Jul 2013 22:46:53 -0400
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6N2knjH017315
	for <linux-lvm@redhat.com>; Mon, 22 Jul 2013 22:46:50 -0400
Received: by mail-ea0-f171.google.com with SMTP id m14so4179311eaj.2
	for <linux-lvm@redhat.com>; Mon, 22 Jul 2013 19:46:49 -0700 (PDT)
Received: from [192.168.1.14] ([37.131.0.205])
	by mx.google.com with ESMTPSA id b7sm55199810eef.16.2013.07.22.19.46.20
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 19:46:48 -0700 (PDT)
Message-ID: <51EDEE5E.4010009@gmail.com>
Date: Tue, 23 Jul 2013 05:45:50 +0300
From: Martin Papik <mp6058@gmail.com>
MIME-Version: 1.0
References: <51E981EF.3020007@gmail.com> <51E99A85.8060901@redhat.com>
	<51E9BD58.4030301@gmail.com>
	<20130719232052.GB23574@agk-dp.fab.redhat.com>
In-Reply-To: <20130719232052.GB23574@agk-dp.fab.redhat.com>
Content-Type: multipart/alternative;
	boundary="------------000702020004070503000908"
Subject: Re: [linux-lvm] pvmove
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------000702020004070503000908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Thank you. Is that patch going to be added to the main source code base?

I think I found an error (segfault), see below.

==> I have a few more improvement suggestions.

* IMHO vgs/lvs should include a column called seg_size_pe, similar to 
seg_start and seg_start_pe
* IMHO vgs/lvs/pvs should have an command line parameter, or option 
modifier allowing to not display empty columns, i.e. the following 
command might skip displaying origin, snap%, move, log, copy%, convert, 
because they have no values. That would allow me to show copy_percent 
column only when copy is in progress. Would be nice.

lvs --all -o +vg_extent_size
   LV      VG     Attr   LSize   Origin Snap%  Move Log Copy%  Convert Ext
   boot    volume -wi-ao 1.00g                                       4.00m
   copy    volume -wi-ao 2.00t                                       4.00m
   emulate volume -wi-ao 50.00g                                       4.00m
   home    volume -wi-ao 150.00g                                       4.00m
   p2p     volume -wi-a- 300.00g                                       4.00m
   root    volume -wi-ao 4.00g                                       4.00m
   swap    volume -wi-ao 8.00g                                       4.00m
   tmp     volume -wi-ao 2.00g                                       4.00m
   usr     volume -wi-ao 20.00g                                       4.00m
   var     volume -wi-ao 20.00g                                       4.00m

Possible error:

root@localhost# lvs --rows --align
Does not align, should it?

*==> SEGFAULT INFO*

root@localhost# pvs --all -o +vg_fmt
Segmentation fault (core dumped)

However the following seems to work.....

root@localhost# pvs --all -o +vg_name
   PV         VG     Fmt  Attr PSize PFree VG
   /dev/dm-0              --      0     0
   --- some entries removed for brevity ----
   /dev/md127 volume lvm2 a-   5.46t 2.77t volume
   --- some entries removed for brevity ----
   /dev/sde1              --      0     0

Additional information that might help.

root@localhost# pvs --version
   LVM version:     2.02.66(2) (2010-05-20)
   Library version: 1.02.48 (2010-05-20)
   Driver version:  4.22.0
root@localhost# cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=12.04
DISTRIB_CODENAME=precise
DISTRIB_DESCRIPTION="Ubuntu 12.04.2 LTS"

root@localhost#valgrind pvs --all -o +vg_fmt
==14584== Memcheck, a memory error detector
==14584== Copyright (C) 2002-2011, and GNU GPL'd, by Julian Seward et al.
==14584== Using Valgrind-3.7.0 and LibVEX; rerun with -h for copyright info
==14584== Command: pvs --all -o +vg_fmt
==14584==
==14584== Invalid read of size 8
==14584==    at 0x548ED77: dm_report_field_string (in 
/lib/libdevmapper.so.1.02.1)
==14584==    by 0x549006F: dm_report_object (in /lib/libdevmapper.so.1.02.1)
==14584==    by 0x46B138: report_object (in /sbin/lvm)
==14584==    by 0x423618: ??? (in /sbin/lvm)
==14584==    by 0x4254B2: process_each_pv (in /sbin/lvm)
==14584==    by 0x4230D3: ??? (in /sbin/lvm)
==14584==    by 0x41AE60: lvm_run_command (in /sbin/lvm)
==14584==    by 0x41B307: lvm2_main (in /sbin/lvm)
==14584==    by 0x58CE76C: (below main) (libc-start.c:226)
==14584==  Address 0x28 is not stack'd, malloc'd or (recently) free'd
==14584==
==14584==
==14584== Process terminating with default action of signal 11 (SIGSEGV)
==14584==  Access not within mapped region at address 0x28
==14584==    at 0x548ED77: dm_report_field_string (in 
/lib/libdevmapper.so.1.02.1)
==14584==    by 0x549006F: dm_report_object (in /lib/libdevmapper.so.1.02.1)
==14584==    by 0x46B138: report_object (in /sbin/lvm)
==14584==    by 0x423618: ??? (in /sbin/lvm)
==14584==    by 0x4254B2: process_each_pv (in /sbin/lvm)
==14584==    by 0x4230D3: ??? (in /sbin/lvm)
==14584==    by 0x41AE60: lvm_run_command (in /sbin/lvm)
==14584==    by 0x41B307: lvm2_main (in /sbin/lvm)
==14584==    by 0x58CE76C: (below main) (libc-start.c:226)
==14584==  If you believe this happened as a result of a stack
==14584==  overflow in your program's main thread (unlikely but
==14584==  possible), you can try to increase the size of the
==14584==  main thread stack using the --main-stacksize= flag.
==14584==  The main thread stack size used in this run was 8388608.
==14584==

root@localhost# ltrace pvs --all -o +vg_fmt 2>&1 | tail
__ctype_toupper_loc()                            = 0x7f2f0e83f768
__ctype_toupper_loc()                            = 0x7f2f0e83f768
__ctype_toupper_loc()                            = 0x7f2f0e83f768
__sprintf_chk(0x1e86e88, 1, -1, 0x48daa5, 0x48dab8) = 2
dm_pool_strdup(0x1e88120, 0x1e86e88, 0x1e86e8a, 0, 0x48daa8) = 0x1e8e538
dm_pool_alloc(0x1e88120, 8, 2, 0x7f2f0d892030, 0x48daa8) = 0x1e8e540
dm_report_field_set_value(0x1e8e508, 0x1e8e538, 0x1e8e540, 
0x7f2f0d892030, 0x48daa8) = 0x1e8e540
dm_report_field_string(0x1e88080, 0x1e8e550, 40, 0x6b1fe0, 0x1e6cfe0 
<unfinished ...>
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++
root@localhost#

root@localhost# gdb --args pvs --all -o +vg_fmt
GNU gdb (Ubuntu/Linaro 7.4-2012.04-0ubuntu2.1) 7.4-2012.04
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later 
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law. Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://bugs.launchpad.net/gdb-linaro/>...
Reading symbols from /sbin/pvs...(no debugging symbols found)...done.
(gdb) run
Starting program: /sbin/pvs --all -o +vg_fmt
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
File descriptor 3 (socket:[46992174]) leaked on pvs invocation. Parent 
PID 14623: gdb
File descriptor 4 (socket:[46992175]) leaked on pvs invocation. Parent 
PID 14623: gdb
File descriptor 5 (pipe:[46992176]) leaked on pvs invocation. Parent PID 
14623: gdb
File descriptor 6 (pipe:[46992176]) leaked on pvs invocation. Parent PID 
14623: gdb

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff757dd77 in dm_report_field_string () from 
/lib/libdevmapper.so.1.02.1
(gdb) disassemble dm_report_field_string
Dump of assembler code for function dm_report_field_string:
    0x00007ffff757dd70 <+0>:    push   %rbx
    0x00007ffff757dd71 <+1>:    mov    %rsi,%rbx
    0x00007ffff757dd74 <+4>:    mov    (%rdi),%rdi
=> 0x00007ffff757dd77 <+7>:    mov (%rdx),%rsi
    0x00007ffff757dd7a <+10>:    callq 0x7ffff7570a30 <dm_pool_strdup@plt>
    0x00007ffff757dd7f <+15>:    test   %rax,%rax
(gdb) info registers
rax            0x6dd550    7198032
rbx            0x6dd550    7198032
rcx            0x6b1fe0    7020512
rdx            0x28    40
rsi            0x6dd550    7198032
rdi            0x6d7120    7172384
rbp            0x6d7080    0x6d7080



On 07/20/2013 02:20 AM, Alasdair G Kergon wrote:
> It uses lists of ranges separated by colons.
>
>    :x-y
>
> If x is missing, 0 is inserted; if y is missing, the last extent on the device
> is inserted.
>
> Man pages can always be improved with more examples!
>
> For +length, try the patch below.
>
> Alasdair
>
>
> --- a/tools/toollib.c
> +++ b/tools/toollib.c
> @@ -1001,7 +1001,7 @@ static int _parse_pes(struct dm_pool *mem, char *c, struct dm_list *pe_ranges,
>   		      const char *pvname, uint32_t size)
>   {
>   	char *endptr;
> -	uint32_t start, end;
> +	uint32_t start, end, len;
>   
>   	/* Default to whole PV */
>   	if (!c) {
> @@ -1041,7 +1041,16 @@ static int _parse_pes(struct dm_pool *mem, char *c, struct dm_list *pe_ranges,
>   					goto error;
>   				c = endptr;
>   			}
> +		} else if (*c == '+') {	/* Length? */
> +			c++;
> +			if (isdigit(*c)) {
> +				if (!xstrtouint32(c, &endptr, 10, &len))
> +					goto error;
> +				c = endptr;
> +				end = start + (len ? (len - 1) : 0);
> +			}
>   		}
> +
>   		if (*c && *c != ':')
>   			goto error;
>   


--------------000702020004070503000908
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix"><br>
      Thank you. Is that patch going to be added to the main source code
      base?<br>
      <br>
      I think I found an error (segfault), see below.<br>
      <br>
      ==&gt; I have a few more improvement suggestions.<br>
      <br>
      * IMHO vgs/lvs should include a column called seg_size_pe, similar
      to seg_start and seg_start_pe<br>
      * IMHO vgs/lvs/pvs should have an command line parameter, or
      option modifier allowing to not display empty columns, i.e. the
      following command might skip displaying origin, snap%, move, log,
      copy%, convert, because they have no values. That would allow me
      to show copy_percent column only when copy is in progress. Would
      be nice.<br>
      <br>
      <tt>lvs --all -o +vg_extent_size</tt><tt><br>
      </tt><tt>&nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp; LSize&nbsp;&nbsp; Origin Snap%&nbsp; Move Log
        Copy%&nbsp; Convert Ext&nbsp; </tt><tt><br>
      </tt><tt>&nbsp; boot&nbsp;&nbsp;&nbsp; volume -wi-ao&nbsp;&nbsp;
        1.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; copy&nbsp;&nbsp;&nbsp; volume -wi-ao&nbsp;&nbsp;
        2.00t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; emulate volume -wi-ao&nbsp;
        50.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; home&nbsp;&nbsp;&nbsp; volume -wi-ao
        150.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; p2p&nbsp;&nbsp;&nbsp;&nbsp; volume -wi-a-
        300.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; root&nbsp;&nbsp;&nbsp; volume -wi-ao&nbsp;&nbsp;
        4.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; swap&nbsp;&nbsp;&nbsp; volume -wi-ao&nbsp;&nbsp;
        8.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; tmp&nbsp;&nbsp;&nbsp;&nbsp; volume -wi-ao&nbsp;&nbsp;
        2.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; usr&nbsp;&nbsp;&nbsp;&nbsp; volume -wi-ao&nbsp;
        20.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><tt><br>
      </tt><tt>&nbsp; var&nbsp;&nbsp;&nbsp;&nbsp; volume -wi-ao&nbsp;
        20.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00m</tt><br>
      <br>
      Possible error:<br>
      <br>
      <tt>root@localhost# lvs --rows --align</tt><tt><br>
      </tt><tt>Does not align, should it?</tt><tt><br>
      </tt><tt><br>
      </tt><b>==&gt; SEGFAULT INFO</b><br>
      <br>
      <tt>root@localhost# pvs --all -o +vg_fmt</tt><tt><br>
      </tt><tt>Segmentation fault (core dumped)</tt><tt><br>
      </tt><tt><br>
        However the following seems to work.....<br>
        <br>
        root@localhost# pvs --all -o +vg_name</tt><tt><br>
      </tt><tt>&nbsp; PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp; Fmt&nbsp; Attr PSize PFree VG&nbsp;&nbsp;&nbsp; </tt><tt><br>
      </tt><tt>&nbsp; /dev/dm-0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </tt><tt><br>
      </tt><tt>&nbsp; --- some entries removed for brevity ----</tt><tt><br>
      </tt><tt>&nbsp; /dev/md127 volume lvm2 a-&nbsp;&nbsp; 5.46t 2.77t volume</tt><tt><br>
      </tt><tt>&nbsp; --- some entries removed for brevity ----</tt><tt><br>
      </tt><tt>
        &nbsp; /dev/sde1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </tt><tt><br>
      </tt><tt><br>
      </tt><tt>Additional information that might help.<br>
      </tt><tt></tt><tt><br>
      </tt><tt>root@localhost# </tt><tt>pvs --version</tt><tt><br>
      </tt><tt>&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.66(2) (2010-05-20)</tt><tt><br>
      </tt><tt>&nbsp; Library version: 1.02.48 (2010-05-20)</tt><tt><br>
      </tt><tt>&nbsp; Driver version:&nbsp; 4.22.0</tt><tt><br>
      </tt><tt>root@localhost# cat /etc/lsb-release </tt><tt><br>
      </tt><tt>DISTRIB_ID=Ubuntu</tt><tt><br>
      </tt><tt>DISTRIB_RELEASE=12.04</tt><tt><br>
      </tt><tt>DISTRIB_CODENAME=precise</tt><tt><br>
      </tt><tt>DISTRIB_DESCRIPTION="Ubuntu 12.04.2 LTS"</tt><tt><br>
      </tt><tt><br>
      </tt><tt>root@localhost#</tt><tt> valgrind pvs --all -o +vg_fmt</tt><tt><br>
      </tt><tt>==14584== Memcheck, a memory error detector</tt><tt><br>
      </tt><tt>==14584== Copyright (C) 2002-2011, and GNU GPL'd, by
        Julian Seward et al.</tt><tt><br>
      </tt><tt>==14584== Using Valgrind-3.7.0 and LibVEX; rerun with -h
        for copyright info</tt><tt><br>
      </tt><tt>==14584== Command: pvs --all -o +vg_fmt</tt><tt><br>
      </tt><tt>==14584== </tt><tt><br>
      </tt><tt>==14584== Invalid read of size 8</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; at 0x548ED77: dm_report_field_string (in
        /lib/libdevmapper.so.1.02.1)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x549006F: dm_report_object (in
        /lib/libdevmapper.so.1.02.1)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x46B138: report_object (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x423618: ??? (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x4254B2: process_each_pv (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x4230D3: ??? (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x41AE60: lvm_run_command (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x41B307: lvm2_main (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x58CE76C: (below main)
        (libc-start.c:226)</tt><tt><br>
      </tt><tt>==14584==&nbsp; Address 0x28 is not stack'd, malloc'd or
        (recently) free'd</tt><tt><br>
      </tt><tt>==14584== </tt><tt><br>
      </tt><tt>==14584== </tt><tt><br>
      </tt><tt>==14584== Process terminating with default action of
        signal 11 (SIGSEGV)</tt><tt><br>
      </tt><tt>==14584==&nbsp; Access not within mapped region at address
        0x28</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; at 0x548ED77: dm_report_field_string (in
        /lib/libdevmapper.so.1.02.1)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x549006F: dm_report_object (in
        /lib/libdevmapper.so.1.02.1)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x46B138: report_object (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x423618: ??? (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x4254B2: process_each_pv (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x4230D3: ??? (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x41AE60: lvm_run_command (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x41B307: lvm2_main (in /sbin/lvm)</tt><tt><br>
      </tt><tt>==14584==&nbsp;&nbsp;&nbsp; by 0x58CE76C: (below main)
        (libc-start.c:226)</tt><tt><br>
      </tt><tt>==14584==&nbsp; If you believe this happened as a result of a
        stack</tt><tt><br>
      </tt><tt>==14584==&nbsp; overflow in your program's main thread
        (unlikely but</tt><tt><br>
      </tt><tt>==14584==&nbsp; possible), you can try to increase the size of
        the</tt><tt><br>
      </tt><tt>==14584==&nbsp; main thread stack using the --main-stacksize=
        flag.</tt><tt><br>
      </tt><tt>==14584==&nbsp; The main thread stack size used in this run
        was 8388608.</tt><tt><br>
      </tt><tt>==14584== </tt><tt><br>
      </tt><tt><br>
      </tt><tt>root@localhost# </tt><tt>ltrace pvs --all -o +vg_fmt
        2&gt;&amp;1 | tail</tt><tt><br>
      </tt><tt>__ctype_toupper_loc()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
        0x7f2f0e83f768</tt><tt><br>
      </tt><tt>__ctype_toupper_loc()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
        0x7f2f0e83f768</tt><tt><br>
      </tt><tt>__ctype_toupper_loc()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
        0x7f2f0e83f768</tt><tt><br>
      </tt><tt>__sprintf_chk(0x1e86e88, 1, -1, 0x48daa5, 0x48dab8) = 2</tt><tt><br>
      </tt><tt>dm_pool_strdup(0x1e88120, 0x1e86e88, 0x1e86e8a, 0,
        0x48daa8) = 0x1e8e538</tt><tt><br>
      </tt><tt>dm_pool_alloc(0x1e88120, 8, 2, 0x7f2f0d892030, 0x48daa8)
        = 0x1e8e540</tt><tt><br>
      </tt><tt>dm_report_field_set_value(0x1e8e508, 0x1e8e538,
        0x1e8e540, 0x7f2f0d892030, 0x48daa8) = 0x1e8e540</tt><tt><br>
      </tt><tt>dm_report_field_string(0x1e88080, 0x1e8e550, 40,
        0x6b1fe0, 0x1e6cfe0 &lt;unfinished ...&gt;</tt><tt><br>
      </tt><tt>--- SIGSEGV (Segmentation fault) ---</tt><tt><br>
      </tt><tt>+++ killed by SIGSEGV +++</tt><br>
      <tt>root@localhost#<br>
        <br>
      </tt><tt><tt>root@localhost#</tt> gdb --args pvs --all -o +vg_fmt</tt><tt><br>
      </tt><tt>GNU gdb (Ubuntu/Linaro 7.4-2012.04-0ubuntu2.1)
        7.4-2012.04</tt><tt><br>
      </tt><tt>Copyright (C) 2012 Free Software Foundation, Inc.</tt><tt><br>
      </tt><tt>License GPLv3+: GNU GPL version 3 or later
        <a class="moz-txt-link-rfc2396E" href="http://gnu.org/licenses/gpl.html">&lt;http://gnu.org/licenses/gpl.html&gt;</a></tt><tt><br>
      </tt><tt>This is free software: you are free to change and
        redistribute it.</tt><tt><br>
      </tt><tt>There is NO WARRANTY, to the extent permitted by law.&nbsp;
        Type "show copying"</tt><tt><br>
      </tt><tt>and "show warranty" for details.</tt><tt><br>
      </tt><tt>This GDB was configured as "x86_64-linux-gnu".</tt><tt><br>
      </tt><tt>For bug reporting instructions, please see:</tt><tt><br>
      </tt><tt><a class="moz-txt-link-rfc2396E" href="http://bugs.launchpad.net/gdb-linaro/">&lt;http://bugs.launchpad.net/gdb-linaro/&gt;</a>...</tt><tt><br>
      </tt><tt>Reading symbols from /sbin/pvs...(no debugging symbols
        found)...done.</tt><tt><br>
      </tt><tt>(gdb) run</tt><tt><br>
      </tt><tt>Starting program: /sbin/pvs --all -o +vg_fmt</tt><tt><br>
      </tt><tt>[Thread debugging using libthread_db enabled]</tt><tt><br>
      </tt><tt>Using host libthread_db library
        "/lib/x86_64-linux-gnu/libthread_db.so.1".</tt><tt><br>
      </tt><tt>File descriptor 3 (socket:[46992174]) leaked on pvs
        invocation. Parent PID 14623: gdb</tt><tt><br>
      </tt><tt>File descriptor 4 (socket:[46992175]) leaked on pvs
        invocation. Parent PID 14623: gdb</tt><tt><br>
      </tt><tt>File descriptor 5 (pipe:[46992176]) leaked on pvs
        invocation. Parent PID 14623: gdb</tt><tt><br>
      </tt><tt>File descriptor 6 (pipe:[46992176]) leaked on pvs
        invocation. Parent PID 14623: gdb</tt><tt><br>
      </tt><tt><br>
      </tt><tt>Program received signal SIGSEGV, Segmentation fault.</tt><tt><br>
      </tt><tt>0x00007ffff757dd77 in dm_report_field_string () from
        /lib/libdevmapper.so.1.02.1</tt><tt><br>
      </tt><tt>(gdb) disassemble dm_report_field_string</tt><tt><br>
      </tt><tt>Dump of assembler code for function
        dm_report_field_string:</tt><tt><br>
      </tt><tt>&nbsp;&nbsp; 0x00007ffff757dd70 &lt;+0&gt;:&nbsp;&nbsp;&nbsp; push&nbsp;&nbsp; %rbx</tt><tt><br>
      </tt><tt>&nbsp;&nbsp; 0x00007ffff757dd71 &lt;+1&gt;:&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp; %rsi,%rbx</tt><tt><br>
      </tt><tt>&nbsp;&nbsp; 0x00007ffff757dd74 &lt;+4&gt;:&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp; (%rdi),%rdi</tt><tt><br>
      </tt><tt>=&gt; 0x00007ffff757dd77 &lt;+7&gt;:&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;
        (%rdx),%rsi</tt><tt><br>
      </tt><tt>&nbsp;&nbsp; 0x00007ffff757dd7a &lt;+10&gt;:&nbsp;&nbsp;&nbsp; callq&nbsp;
        0x7ffff7570a30 &lt;dm_pool_strdup@plt&gt;</tt><tt><br>
      </tt><tt>&nbsp;&nbsp; 0x00007ffff757dd7f &lt;+15&gt;:&nbsp;&nbsp;&nbsp; test&nbsp;&nbsp; %rax,%rax</tt><tt><br>
      </tt><tt>(gdb) info registers </tt><tt><br>
      </tt><tt>rax&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6dd550&nbsp;&nbsp;&nbsp; 7198032</tt><tt><br>
      </tt><tt>rbx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6dd550&nbsp;&nbsp;&nbsp; 7198032</tt><tt><br>
      </tt><tt>rcx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6b1fe0&nbsp;&nbsp;&nbsp; 7020512</tt><tt><br>
      </tt><tt>rdx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x28&nbsp;&nbsp;&nbsp; 40</tt><tt><br>
      </tt><tt>rsi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6dd550&nbsp;&nbsp;&nbsp; 7198032</tt><tt><br>
      </tt><tt>rdi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6d7120&nbsp;&nbsp;&nbsp; 7172384</tt><tt><br>
      </tt><tt>rbp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6d7080&nbsp;&nbsp;&nbsp; 0x6d7080</tt><tt><br>
      </tt><br>
      <br>
      <br>
      On 07/20/2013 02:20 AM, Alasdair G Kergon wrote:<br>
    </div>
    <blockquote cite="mid:20130719232052.GB23574@agk-dp.fab.redhat.com"
      type="cite">
      <pre wrap="">It uses lists of ranges separated by colons.

  :x-y

If x is missing, 0 is inserted; if y is missing, the last extent on the device
is inserted.

Man pages can always be improved with more examples!

For +length, try the patch below.

Alasdair


--- a/tools/toollib.c
+++ b/tools/toollib.c
@@ -1001,7 +1001,7 @@ static int _parse_pes(struct dm_pool *mem, char *c, struct dm_list *pe_ranges,
 		      const char *pvname, uint32_t size)
 {
 	char *endptr;
-	uint32_t start, end;
+	uint32_t start, end, len;
 
 	/* Default to whole PV */
 	if (!c) {
@@ -1041,7 +1041,16 @@ static int _parse_pes(struct dm_pool *mem, char *c, struct dm_list *pe_ranges,
 					goto error;
 				c = endptr;
 			}
+		} else if (*c == '+') {	/* Length? */
+			c++;
+			if (isdigit(*c)) {
+				if (!xstrtouint32(c, &amp;endptr, 10, &amp;len))
+					goto error;
+				c = endptr;
+				end = start + (len ? (len - 1) : 0);
+			}
 		}
+
 		if (*c &amp;&amp; *c != ':')
 			goto error;
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000702020004070503000908--
