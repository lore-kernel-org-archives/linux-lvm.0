Date: Tue, 26 Sep 2000 00:46:35 -0700
From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: [linux-lvm] hangs when mounting snapshot
Message-ID: <20000926004635.B23678@ultraviolet.org>
References: <20000925142431.A8244@ultraviolet.org> <200009260147.e8Q1lGs19192@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200009260147.e8Q1lGs19192@webber.adilger.net>; from adilger@turbolinux.com on Mon, Sep 25, 2000 at 07:46:50PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Mon, Sep 25, 2000 at 07:46:50PM -0600, Andreas Dilger wrote:
> The segmentation fault is happening inside the kernel itself, so the problem
> is not with the mount command, but with LVM.  It will have recorded an "OOPS"
> record in /var/log/messages, and depending if you have syslogd set up
> correctly, it would tell us where this is happening.  From what another
> poster said, it is happening inside lvm_snapshot_remap_block(), but since
> I've never really played with snapshots, I can't really comment...

Right, I should have noticed it earlier but it did indeed leave an oops in the
messages file. I have run it through ksymoops:

No modules in ksyms, skipping objects
Warning (read_lsmod): no symbols in lsmod, is /proc/modules a valid lsmod file?
Sep 25 13:58:57 reiser kernel: CPU:    1 
Sep 25 13:58:57 reiser kernel: EIP:    0010:[lvm_snapshot_remap_block+17/244] 
Sep 25 13:58:57 reiser kernel: EFLAGS: 00010246 
Sep 25 13:58:57 reiser kernel: eax: 000007e0   ebx: dfacc770   ecx: dfacc600
edx: 00000000 
Sep 25 13:58:57 reiser kernel: esi: 00000000   edi: 00000000   ebp: 00000000
esp: df0d5c34 
Sep 25 13:58:57 reiser kernel: ds: 0018   es: 0018   ss: 0018 
Sep 25 13:58:57 reiser kernel: Process mount (pid: 555, stackpage=df0d5000) 
Sep 25 13:58:57 reiser kernel: Stack: dfacc770 00000000 00000000 00000000
00000000 0805734c 0000134c 00000000  
Sep 25 13:58:57 reiser kernel:        c0120018 c01aabb3 df0d5cce df0d5cd0
000007e0 dfacc600 df1ffe40 00000002  
Sep 25 13:58:57 reiser kernel:        000000e8 00000002 c0146a6c 0805734c
e0848000 c0147d5b 0805734c 0805734c  
Sep 25 13:58:57 reiser kernel: Call Trace: [sysctl_string+204/348]
[lvm_map+1095/1208] [padzero+28/32] [<e0848000>] [load_elf_binary+3023/3408]
[load_elf_binary+0/3408] [lvm_make_request_fn+15/24]  
Sep 25 13:58:57 reiser kernel: Code: f7 b1 64 01 00 00 8b 44 24 2c 89 d3 8b 30
89 f7 29 df 89 f8  
Using defaults from ksymoops -t elf32-i386 -a i386

Code;  00000000 Before first symbol
00000000 <_EIP>:
Code;  00000000 Before first symbol
   0:   f7 b1 64 01 00 00         divl   0x164(%ecx),%eax
Code;  00000006 Before first symbol
   6:   8b 44 24 2c               movl   0x2c(%esp,1),%eax
Code;  0000000a Before first symbol
   a:   89 d3                     movl   %edx,%ebx
Code;  0000000c Before first symbol
   c:   8b 30                     movl   (%eax),%esi
Code;  0000000e Before first symbol
   e:   89 f7                     movl   %esi,%edi
Code;  00000010 Before first symbol
  10:   29 df                     subl   %ebx,%edi
Code;  00000012 Before first symbol
  12:   89 f8                     movl   %edi,%eax


1 warning issued.  Results may not be reliable.

> Do you know if you have the latest patches for the user tools, which are
> not included in the 0.8final tools you download from the LVM site?  These
> fix several longstanding problems in the user tools which may (or may not)
> be causing your problem.  The list of existing patches was posted by me
> to this mailing list on Aug 4, as "Additions to LVM-BUGS-0.8final",
> which would be a good starting point.  As I don't work with 2.4 lately,
> I'm not sure if the in-kernel LVM files are up-to-date with all of the
> fixes...  I know the 2.2 support is far behind 2.4, so I keep my own set
> of kernel patches.

No, I do not have those patches. I am having these problems under 2.4 so my
problem may or may not be the same as the other posters problem. He was getting
the oops  in lvm_snapshot_remap_block but it looks like I am getting it in
lvm_make_request_fn.

-- 
Tracy Reed      http://www.ultraviolet.org
