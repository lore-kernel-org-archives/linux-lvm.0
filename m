Date: Wed, 19 Jan 2000 16:57:21 +0100
From: Andi Kleen <ak@suse.de>
Subject: Re: [linux-lvm] pvcreate doesn't work with /dev/rd (Mylex RAID)
Message-ID: <20000119165721.A22966@gruyere.muc.suse.de>
References: <15AD5D7936F8D21198240000F831776E3E8135@dboexc1.dbo.cpqcorp.net>
Mime-Version: 1.0
In-Reply-To: <15AD5D7936F8D21198240000F831776E3E8135@dboexc1.dbo.cpqcorp.net>; from Jakma, Paul on Wed, Jan 19, 2000 at 01:13:26PM -0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jakma, Paul" <Paul.Jakma@compaq.com>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

On Wed, Jan 19, 2000 at 01:13:26PM -0000, Jakma, Paul wrote:
> Hi,
> 
> I can't get pvcreate to initialise partitions on a Mylex DAC960 device. I
> don't have the error message to hand, but the debug output said that
> pv_get_size was unsuccesful.
> 
> I tried with /dev/rd/part3, /dev/rd/part5 (ie both primary and logical
> partitions)
> i tried with partition id set to fe and to 83. no change.
> 
> That was with version 0.7. Why can't it grok /dev/rd/ devices?

Because the major numbers are hard coded. Future versions will hopefully
use /proc/devices to fetch all available majors dynamically. 0.8i 
has support for Mylex.

> 
> I would try 0.8i, however when i tried compiling it with 2.2.14+devfs it
> croaked at the very end when trying to link vmlinux with an undefined
> reference to lvm_init.. :(

That is a known errata and should be covered somewhere on the lvm homepage
(probably in the FAQ)


-Andi
