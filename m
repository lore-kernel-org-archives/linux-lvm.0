Message-ID: <4F437B13.3060205@redhat.com>
Date: Tue, 21 Feb 2012 12:08:03 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F405E1B.5030609@shiftmail.org>
	<20120220135103.GB27388@redhat.com>
	<4F426234.1020704@shiftmail.org> <4F428012.6090302@redhat.com>
	<4F43704B.50903@shiftmail.org>
In-Reply-To: <4F43704B.50903@shiftmail.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] DM / LVM hangs if snapshot present on kernel v3.0.3
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
Content-Type: text/plain; charset="us-ascii"
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@redhat.com, Spelic <spelic@shiftmail.org>

Dne 21.2.2012 11:22, Spelic napsal(a):
> On 02/20/12 18:17, Zdenek Kabelac wrote:
>> Dne 20.2.2012 16:09, Spelic napsal(a):
>>> On 02/20/12 14:51, Mike Snitzer wrote:
>>>> I've never seen this. Which distro are you using?
>>> Ubuntu 11.04  64-bit but with vanilla 3.0.3 kernel
>>>
>>> Ubuntu's lvm:
>>> # lvm version
>>>    LVM version:     2.02.66(2) (2010-05-20)
>>>    Library version: 1.02.48 (2010-05-20)
>>>
>> So I'd guess you might be a 'victim' of Debian home-brew udev rules for lvm2,
>> which were unfortunately not consulted with upstream (nor udev, nor lvm).
> 
> Indeed I have had a few bad experiences with Ubuntu's udev rules, but never
> like this...
> I don't think a wrong udev rule can hangup the whole machine with such
> symptoms, you really think so?
> 
> - lvs and/or "lvchange --refresh ..." processes hanging forever in kernel code
> (and AFAIR it was in DM region, that's the /proc/pid/stack trace which I
> unfortunately lost)

lvs might be just waiting for unfinished  lvchange process (lock holder)

You could probably lock at 'gdb  backtrace' to see for what it it waiting
(or just use  lvs -vvvv)

There is probably an easy way to detect udev related problems - check for
udev cookies waiting to be completed.

'dmsetup udevcookies'

And you may manually force it's completion by:

'dmsetup udevcomplete_all'

to see whether it will make lvchange to continue.

> 
> - "sync" also cannot complete, so I can only do force reboot without flush
> 
> -- 
> dm-devel mailing list
> dm-devel@redhat.com

We should probably keep this on  linux-lvm  list only as it's not dm related.

Zdenek
