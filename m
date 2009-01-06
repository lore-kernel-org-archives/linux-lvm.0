Message-ID: <496391C6.7010502@redhat.com>
Date: Tue, 06 Jan 2009 17:15:50 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate & vgcfgrestore won't work
References: <1231217144.7947.19.camel@fraws70-gentoo>	
	<496349D8.8000800@redhat.com>
	<1231260819.7947.29.camel@fraws70-gentoo>
In-Reply-To: <1231260819.7947.29.camel@fraws70-gentoo>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: SoulSweeper <soulsweeper@soulsweeper.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

SoulSweeper wrote:
> On Tue, 2009-01-06 at 12:08 +0000, Bryn M. Reeves wrote:
>> Ralf Sparr wrote:
>>> Hi list,
>>>
>>> as mentioned in my earlier post, LVM complains about
>>> "Incorrect metadata area header checksum". As this occurs
>>> often (many questions, rarely answers in the list) I tried to create
>>> some 'new' via
>> Running pvcreate followed by vgcfgrestore is the correct way to fix a 
>> broken MDA checksum - I've used this many times to recover from these 
>> situations.
> 
> Hmmm, doesn\t sound very promising. Why does this happen? The error
> directly occured after shutting the lvm down. I wanted to reboot the
> server to check a new network-configuration (no LVM changes at all).
> loop-aes & md were still up.

It's hard to say - when I've encountered this in the past, I've usually 
been doing things that I'd expect might introduce a bit of "excitement" 
to the system, e.g. reproducing bugs that involve crashing the kernel 
with a lot of I/O happening.

I am not aware of any deterministic steps that would trigger this under 
normal circumstances (and I'd consider it a bug if I was :) - when I've 
needed to demonstrate how to recover from this in the past I've had to 
resort to writing code to deliberately trash the checksums.

You mention that you're using loop-aes and md, I wonder if maybe 
something's being cached or not flushed to disk correctly when you 
reboot that could be causing corruption?

Regards,
Bryn.
