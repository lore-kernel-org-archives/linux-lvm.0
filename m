From: Keith Owens <kaos@sgi.com>
In-Reply-To: Your message of
    "Tue, 08 Jan 2002 00:08:11 +1000."
    <200201071508.g07F8Pg14938@oss.sgi.com>
MIME-Version: 1.0
Message-Id: <30503.1010414515@ocs3.intra.ocs.com.au>
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Mon Jan  7 08:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Tue, 8 Jan 2002 00:08:11 +1000, 
Adrian Head <ahead@bigpond.net.au> wrote:
>This is the kdb output from trying to create a snapshot of an XFS volume when 
>I have removed ext3 from my kernel. (For clarifcation - in all my previous 
>tests ext3 was compiled into my kernel - in this test I did not select ext3 
>at all in menuconfig)
>
>The only other thing I have noticed is that when the original XFS logical 
>volume is unmounted snapshot creation is fine.  I'm not sure if this works on 
>the other tests I have tried so I will go back and redo them.
>
>id %eip is weird.  What does this really mean?  looks like the instructions 
>point nowhere.  Am I correct?
>
>Entering kdb (current=0xd600e000, pid 940) Oops: Oops
>due to oops @ 0xb800
>eax = 0xffffffff ebx = 0xd600e000 ecx = 0x0000b800 edx = 0xc018fd25
>esi = 0x00000008 edi = 0xd600e000 esp = 0xd600ff0c eip = 0x0000b800
>ebp = 0xd600ff30 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010086
>xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd600fed8
>kdb> bt
>    EBP       EIP         Function(args)
>0xd600ff30 0x0000b800 <unknown>+0xb800 (0x1)
>                               kernel <unknown> 0x0 0x0 0x0
>           0xc011ce83 dequeue_signal+0x43 (0xd600e560, 0xd600ff30, 
>0xd600e560, 0xd600ffc4, 0xc01392ff)
>                               kernel .text 0xc0100000 0xc011ce40 0xc011cef0
>           0xc01069b9 do_signal+0x59 (0x11, 0xbfffec40, 0xbfffebb0, 0x8, 0x11)
>                               kernel .text 0xc0100000 0xc0106960 0xc0106c00
>           0xc0106d54 signal_return+0x14
>                               kernel .text 0xc0100000 0xc0106d40 0xc0106d58

kdb is correctly reporting the current eip, but the kernel has taken a
swan dive into nowhere.  It looks like the chunk of code below.  To
confirm, run

  objdump --start-addr=0xc011ce40 --stop-address=0xc011ce90 vmlinux

I expect to see a call instruction just before 0xc011ce83, probably an
indirect call via ecx.

dequeue_signal(sigset_t *mask, siginfo_t *info)
{
        int sig = 0;

#if DEBUG_SIG
printk("SIG dequeue (%s:%d): %d ", current->comm, current->pid,
        signal_pending(current));
#endif

        sig = next_signal(current, mask);
        if (sig) {
                if (current->notifier) {
                        if (sigismember(current->notifier_mask, sig)) {
                                if (!(current->notifier)(current->notifier_data)) {  <=== probably failing here
                                        current->sigpending = 0;
                                        return 0;
                                }

Without seeing the objdump output, I am assuming that it is failing on
the call to current->notifier which means that notifier is corrupt.
The only place that notifier is set is in block_all_signals() so we
need to find who is calling that routine with bad data.  With any luck,
this (untested) debug patch will catch the offender.  Then we start
finding out why it is passing a bad pointer.

--- kernel/signal.c.orig	Wed Dec  5 13:15:50 2001
+++ kernel/signal.c	Tue Jan  8 01:28:12 2002
@@ -155,6 +155,8 @@ block_all_signals(int (*notifier)(void *
 {
 	unsigned long flags;
 
+	if (notifier && (unsigned long)notifier < 0xc0000000)
+		BUG();
 	spin_lock_irqsave(&current->sigmask_lock, flags);
 	current->notifier_mask = mask;
 	current->notifier_data = priv;

A quick scan through the kernel found only DRM code using
block_all_signals.  If the bug is a bad notifier then the oops will be
timing dependent, the notifier routine is only called if a signal trips
between block_all_signals() and unblock_all_signals() and that does not
always occur.
