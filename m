Subject: Re: [linux-lvm] pvcreate & vgcfgrestore won't work
From: Ralf Sparr <lvm@soulsweeper.org>
In-Reply-To: <496391C6.7010502@redhat.com>
References: <1231217144.7947.19.camel@fraws70-gentoo>
	<496349D8.8000800@redhat.com> <1231260819.7947.29.camel@fraws70-gentoo>
	<496391C6.7010502@redhat.com>
Date: Tue, 06 Jan 2009 18:38:22 +0100
Message-Id: <1231263502.7947.43.camel@fraws70-gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2009-01-06 at 17:15 +0000, Bryn M. Reeves wrote:
> SoulSweeper wrote:
> > On Tue, 2009-01-06 at 12:08 +0000, Bryn M. Reeves wrote:
> >> Ralf Sparr wrote:
> >>> Hi list,
> >>>
> >>> as mentioned in my earlier post, LVM complains about
> >>> "Incorrect metadata area header checksum". As this occurs
> >>> often (many questions, rarely answers in the list) I tried to create
> >>> some 'new' via
> >> Running pvcreate followed by vgcfgrestore is the correct way to fix a 
> >> broken MDA checksum - I've used this many times to recover from these 
> >> situations.
> > 
> > Hmmm, doesn\t sound very promising. Why does this happen? The error
> > directly occured after shutting the lvm down. I wanted to reboot the
> > server to check a new network-configuration (no LVM changes at all).
> > loop-aes & md were still up.
> 
> It's hard to say - when I've encountered this in the past, I've usually 
> been doing things that I'd expect might introduce a bit of "excitement" 
> to the system, e.g. reproducing bugs that involve crashing the kernel 
> with a lot of I/O happening.
> 
> I am not aware of any deterministic steps that would trigger this under 
> normal circumstances (and I'd consider it a bug if I was :) - when I've 
> needed to demonstrate how to recover from this in the past I've had to 
> resort to writing code to deliberately trash the checksums.
> 
> You mention that you're using loop-aes and md, I wonder if maybe 
> something's being cached or not flushed to disk correctly when you 
> reboot that could be causing corruption?

Very unlikely. The system itself is located on a mirror. loop-aes is on
my 'data-raid', then lvm is accessing the loop-device. LVM hosts my
xen-domu's and data-partitions.
I run shutdown on every domU and did a 'vgchange -a y'. Then the error
became visible. LVM doesn't shutdown, access to the LVs were still
posible. Then the server was rebooted, but this time without any
accessible LV.
After all, I don't really care about the 'why'. My data is back online!

Again, many thanks to you.

rgds
Ralf


> 
> Regards,
> Bryn.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
