Message-ID: <15AD5D7936F8D21198240000F831776E3E813B@dboexc1.dbo.cpqcorp.net>
From: "Jakma, Paul" <Paul.Jakma@compaq.com>
Subject: RE: [linux-lvm] pvcreate doesn't work with /dev/rd (Mylex RAID)
Date: Wed, 19 Jan 2000 16:00:11 -0000
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Andi Kleen' <ak@suse.de>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

> Because the major numbers are hard coded. Future versions 
> will hopefully
> use /proc/devices to fetch all available majors dynamically. 0.8i 
> has support for Mylex.
> 

where do i add the DAC960 major number? or is 0.8i already stable enough for
production use?

> undefined
> > reference to lvm_init.. :(
> 
> That is a known errata and should be covered somewhere on the 
> lvm homepage
> (probably in the FAQ)
> 

yes. i saw that heinz answered this one in a post earlier today. remove the
static qualifier from the function prototype for __init_func.

> 
> -Andi
>

thanks,

Paul. 
