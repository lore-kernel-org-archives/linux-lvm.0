From: Keith Owens <kaos@sgi.com>
In-Reply-To: Your message of
    "Tue, 08 Jan 2002 02:50:27 +1000."
    <200201071648.IAA08511@sgi.com>
MIME-Version: 1.0
Message-Id: <687.1010435796@ocs3.intra.ocs.com.au>
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
Date: Mon Jan  7 14:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Tue, 8 Jan 2002 02:50:27 +1000, 
Adrian Head <ahead@bigpond.net.au> wrote:
>On Tue, 8 Jan 2002 00:41, Keith Owens wrote:
>> On Tue, 8 Jan 2002 00:08:11 +1000,
>> Adrian Head <ahead@bigpond.net.au> wrote:
>> >
>> >Entering kdb (current=0xd600e000, pid 940) Oops: Oops
>> >due to oops @ 0xb800
>> >eax = 0xffffffff ebx = 0xd600e000 ecx = 0x0000b800 edx = 0xc018fd25
>> >esi = 0x00000008 edi = 0xd600e000 esp = 0xd600ff0c eip = 0x0000b800
>> >ebp = 0xd600ff30 xss = 0x00000018 xcs = 0x00000010 eflags = 0x00010086
>> >xds = 0x00000018 xes = 0x00000018 origeax = 0xffffffff &regs = 0xd600fed8
>> >kdb> bt
>> >    EBP       EIP         Function(args)
>> >0xd600ff30 0x0000b800 <unknown>+0xb800 (0x1)
>> >                               kernel <unknown> 0x0 0x0 0x0
>> >           0xc011ce83 dequeue_signal+0x43 (0xd600e560, 0xd600ff30,
>> >0xd600e560, 0xd600ffc4, 0xc01392ff)
>> >                               kernel .text 0xc0100000 0xc011ce40
>> > 0xc011cef0 0xc01069b9 do_signal+0x59 (0x11, 0xbfffec40, 0xbfffebb0, 0x8,
>> > 0x11) kernel .text 0xc0100000 0xc0106960 0xc0106c00 0xc0106d54
>> > signal_return+0x14
>> >                               kernel .text 0xc0100000 0xc0106d40
>> > 0xc0106d58
>>
>> kdb is correctly reporting the current eip, but the kernel has taken a
>> swan dive into nowhere.  It looks like the chunk of code below.  To
>> confirm, run
>>
>>   objdump --start-addr=0xc011ce40 --stop-address=0xc011ce90 vmlinux
>
>How did you get 0xc011ce40 and 0xc011ce90?  Do they come from above?  How are 
>they derived? Just interested.

The backtrace shows a branch out of the kernel, the last good address
is the starting point to find out why we branched to an invalid
address.  Back trace is listed as 0xc011ce83 dequeue_signal+0x43,
subtract 0x43 so dequeue_signal starts at 0xc011ce40.  Stop address is
the backtrace entry plus a bit to bracket the probable call
instruction.

>vmlinux - where does that come from?  I assume it is not the compressed 
>kernel found in /boot.

The kernel build creates vmlinux under /usr/src/linux or wherever you
build your kernel.  All architectures build vmlinux then modify it as
required for booting.  Binutils tools like objdump do not understand
bzImage, they need the original ELF kernel, i.e. vmlinux.
