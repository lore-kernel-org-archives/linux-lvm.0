From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Please help!
Message-ID: <20020918140218.A27535@sistina.com>
References: <20020917161706.A22952@sistina.com> <20020918090159.97518.qmail@web20511.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20020918090159.97518.qmail@web20511.mail.yahoo.com>; from kelvintanpk@yahoo.com on Wed, Sep 18, 2002 at 02:01:59AM -0700
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
Date: Wed Sep 18 07:04:19 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Kelvin,

did lvmcreate_initrd display an error?
Is the initrd size for the kernel too small to hold the initrd size
(see the ramdisk_size kernel parameter)?

Regards,
Heinz    -- The LVM Guy --


On Wed, Sep 18, 2002 at 02:01:59AM -0700, Kelvin Tan wrote:
> 
> Hi,
> 
> I am running redhat 7.3 with LVM release 1.1-rc4.
> 
> System uses only one 6GB ide harddisk.
> 
> I have the following error when booting the new compiled kernel and initrd ram file.
> 
> attempt to access beyond end of device 01:00 rw=0 want:4683, limit=4096
> 
> kmod: failed to exec /sbin/modprobe -s -k block-major-58,errno=2
> 
> and the system stalled.
> 
> Please advise.
> 
> Kelvin Tan
> 
> (Singapore)
> 
>  
> 
>  
> 
>  
> 
>  
> 
> 
> 
> ---------------------------------
> Do you Yahoo!?
> Yahoo! News - Today's headlines

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
