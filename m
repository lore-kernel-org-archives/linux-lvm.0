From: Heinz J . Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] pvscan fails
Message-ID: <20020826120352.A18054@sistina.com>
References: <20020826052131.GA5267@caffeine.rapidpacket.com>
Mime-Version: 1.0
In-Reply-To: <20020826052131.GA5267@caffeine.rapidpacket.com>; from ttroxell@debian.org on Mon, Aug 26, 2002 at 01:21:31AM -0400
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
Date: Mon Aug 26 05:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: ttroxell@debian.org

On Mon, Aug 26, 2002 at 01:21:31AM -0400, Todd Troxell wrote:
> Hello,
> 
> I'm having trouble setting up physical volumes.
> 
> caffeine:~# pvcreate /dev/hdd1
> pvcreate -- physical volume "/dev/hdd1" successfully created
> 
> caffeine:~# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ERROR "pv_read(): read" reading physical volumes
> 
> After looking at debug messages, I think it is related to my 
> ide cdrom (/dev/hdc).

Todd,
have you temporarily removed /dev/hdc and retried to prove this right?

> 
> Does this seem to be the case?  Is there a way to ignore /dev/hdc?

Not with LVM version < 1.1 :(

You should give LVM2 a try (please follow download instructions at
www.sistina.com in that case) which has fully configurable devices
based on regular expressions.

Regards,
Heinz    -- The LVM Guy --


> 
> (attached is output from pvscan -d) (2.2.18, lvm 1.0.4)
> 
> -Todd
> 
> p.s. please cc: 

> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
<SNIP>
> <1> lvm_error -- LEAVING with: "pv_read(): read"
> pvscan -- ERROR "pv_read(): read" reading physical volumes
> 
> pvscan -- reading all physical volumes (this may take a while...)

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
