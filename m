Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5LAVf007430
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 06:31:41 -0400
Received: from artemis.le.ac.uk (ntp2c.le.ac.uk [143.210.16.126])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5LAVde1029548
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 06:31:40 -0400
Received: from [143.210.12.168] (helo=pc167.cc.le.ac.uk)
	by artemis.le.ac.uk with esmtp (Exim 4.30) id 1BcM5P-0004iu-Kn
	for linux-lvm@redhat.com; Mon, 21 Jun 2004 11:31:35 +0100
Received: from rao3 (helo=localhost)
	by pc167.cc.le.ac.uk with local-esmtp (Exim 4.32) id 1BcM5P-0000PQ-Hr
	for linux-lvm@redhat.com; Mon, 21 Jun 2004 11:31:35 +0100
Date: Mon, 21 Jun 2004 11:31:35 +0100 (BST)
From: Alex Owen <rao3@leicester.ac.uk>
In-Reply-To: <20040620084616.GA3519@redhat.com>
Message-ID: <Pine.LNX.4.58.0406211101400.1165@pc167.cc.le.ac.uk>
References: <20040620084616.GA3519@redhat.com>
MIME-Version: 1.0
Sender: Alex Owen <rao3@leicester.ac.uk>
Subject: [linux-lvm] Re: Snapshot related Oops? -  Was:(no subject)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@redhat.com>

On Sun, 20 Jun 2004, Heinz Mauelshagen wrote:
> Alex,
> could you run that through ksymoops to get a backtrace ?
> Regards,
> Heinz    -- The LVM Guy --

Sorry for the "school-boy-errors" of not giving my initial post a title or
running the oops through ksymoops.

Ksymoops was run as follows:
 ksymoops -k /var/log/ksymoops/20040618073816.ksyms      \
          -l /var/log/ksymoops/20040618073816.modules    \
          -o /lib/modules/2.4.26-686-smp-lvm-vfslock/    \
          -m /boot/System.map-2.4.26-686-smp-lvm-vfslock \
          -i  ~/oops
Which gave:
---8<---
ksymoops 2.4.5 on i686 2.4.26-686-smp-lvm-vfslock.  Options used
     -V (default)
     -k /var/log/ksymoops/20040618073816.ksyms (specified)
     -l /var/log/ksymoops/20040618073816.modules (specified)
     -o /lib/modules/2.4.26-686-smp-lvm-vfslock/ (specified)
     -m /boot/System.map-2.4.26-686-smp-lvm-vfslock (specified)
     -i

Warning (map_ksym_to_module): cannot match loaded module ext3 to a unique module object.  Trace may not be reliable.
Warning (map_ksym_to_module): cannot match loaded module cciss to a unique module object.  Trace may not be reliable.
Jun 18 07:39:03 falcon kernel: Unable to handle kernel NULL pointer dereference@virtual address 00000000
Jun 18 07:39:03 falcon kernel: f8855b17
Jun 18 07:39:03 falcon kernel: *pde = 1236b001
Jun 18 07:39:03 falcon kernel: Oops: 0000
Jun 18 07:39:03 falcon kernel: CPU:    3
Jun 18 07:39:03 falcon kernel: EIP:    0010:[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.26-686-smp-lvm-vfslock/ke+-2135273/96]    Tainted: P
Jun 18 07:39:03 falcon kernel: EFLAGS: 00010202
Jun 18 07:39:03 falcon kernel: eax: 00000000   ebx: f8ac3260   ecx: 00000000   edx: 00000000
Jun 18 07:39:03 falcon kernel: esi: 00402400   edi: f724aa00   ebp: 00006804   esp: c43d7dd0
Jun 18 07:39:03 falcon kernel: ds: 0018   es: 0018   ss: 0018
Jun 18 07:39:03 falcon kernel: Process kupdated (pid: 9, stackpage=c43d7000)
Jun 18 07:39:03 falcon kernel: Stack: f724aa00 f724ab70 f7c92970 00200000 00000080 00000002 00000000 00000000
Jun 18 07:39:03 falcon kernel:        f88526d1 c43d7e2e c43d7e30 00402380 f724aa00 00003a02 eda084a0 00000080
Jun 18 07:39:03 falcon kernel:        00200000 c7d80f80 000c00b0 f7c92800 f7c89000 00402380 00000000 68040000
Jun 18 07:39:03 falcon kernel: Call Trace:    [ide-cd:__insmod_ide-cd_O/lib/modules/2.4.26-686-smp-lvm-vfslock/ke+-2148655/96] [ide-cd:__insmod_ide-cd_O/lib/modules/2.4.26-686-smp-lvm-vfslock/ke+-2148425/96] [generic_make_request+288/304] [submit_bh+86/224] [write_locked_buffers+32/44]
Jun 18 07:39:03 falcon kernel: Code: 8b 01 39 d9 74 37 39 71 08 75 ef 66 39 69 0c 75 e9 83 7c 24
Using defaults from ksymoops -t elf32-i386 -a i386


>>ebx; f8ac3260 <[ide-cd].data.end+5d281/13e021>
>>esi; 00402400 Before first symbol
>>edi; f724aa00 <_end+36f068d4/384d7ed4>
>>ebp; 00006804 Before first symbol
>>esp; c43d7dd0 <_end+4093ca4/384d7ed4>

Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   8b 01                     mov    (%ecx),%eax
Code;  00000002 Before first symbol
   2:   39 d9                     cmp    %ebx,%ecx
Code;  00000004 Before first symbol
   4:   74 37                     je     3d <_EIP+0x3d> 0000003d Before first symbol
Code;  00000006 Before first symbol
   6:   39 71 08                  cmp    %esi,0x8(%ecx)
Code;  00000009 Before first symbol
   9:   75 ef                     jne    fffffffa <_EIP+0xfffffffa> fffffffa <END_OF_CODE+741a4df/????>
Code;  0000000b Before first symbol
   b:   66 39 69 0c               cmp    %bp,0xc(%ecx)
Code;  0000000f Before first symbol
   f:   75 e9                     jne    fffffffa <_EIP+0xfffffffa> fffffffa <END_OF_CODE+741a4df/????>
Code;  00000011 Before first symbol
  11:   83 7c 24 00 00            cmpl   $0x0,0x0(%esp,1)


2 warnings issued.  Results may not be reliable.
---8<---

Without the "-i" flag to ksymoops there were 6 warnings with it only 2
warnings so I have posted the "-i" version here. The output was the same
between the two runs except for the warnings.

Does the fact that there are warnings make my ksymoops worthless?
I don't understand why there are warnings... is it because some modules
are loaded from an initrd? - they should be identical to the modules under
/lib/modules/`uname -r` though!

Am I right in thinking that this ksymoops indicates a problem in the
ide-cd module? ...
If so sorry for wasting your time on the linux-lvm list.
If not any ideas what it means?

Thanks (in advance) for your help
Alex Owen

----------------------------------------------------------------
 Dr Richard Alexander Owen      Unix System Administrator

 The Computer Centre            E-mail: rao3@le.ac.uk
 University of Leicester           Tel: (0116) 2525133
 University Road                   Fax: (0116) 2525027
 Leicester LE1 7RH
----------------------------------------------------------------
