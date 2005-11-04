Received: from o.ww.redhat.com (vpn50-27.rdu.redhat.com [172.16.50.27])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	jA4JOWTu002238
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 20:24:32 +0100
Date: Fri, 4 Nov 2005 20:24:31 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] pvcreate on a dmraid device
Message-ID: <20051104192431.GD3517@redhat.com>
References: <200511042005.17392.Dan.Johansson@dmj.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200511042005.17392.Dan.Johansson@dmj.nu>
Reply-To: mauelshagen@redhat.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


Dan,

change your lvm2 "devices" configuration in /etc/lvm/lvm.conf to include:

types = [ "device-mapper", 254 ]

Regards,
Heinz    -- The LVM Guy --



On Fri, Nov 04, 2005 at 08:05:08PM +0100, Dan Johansson wrote:
> Hi,
> 
> I'm new to this list, but not to Linux and LVM.
> I'm trying to setup a new Linux-server with an on board RAID-controller 
> (Promise PDC20265 FastTrak100 Lite/Ultra100). Now everything goes well until 
> I try to do a pvcreate on one of the raid-partitions, this is the output I 
> get:
> # pvcreate /dev/mapper/pdc_edcfibbf4
>   Device /dev/mapper/pdc_edcfibbf4 not found.
> 
> But the device-file is there (along with the other partitions).
> 
> # ll /dev/mapper/pdc_edcfibbf*
> brw-------  1 root root 253,  7 Nov  4 18:22 /dev/mapper/pdc_edcfibbf
> brw-------  1 root root 253,  8 Nov  4 18:22 /dev/mapper/pdc_edcfibbf1
> brw-------  1 root root 253,  9 Nov  4 18:22 /dev/mapper/pdc_edcfibbf2
> brw-------  1 root root 253, 10 Nov  4 18:22 /dev/mapper/pdc_edcfibbf3
> brw-------  1 root root 253, 11 Nov  4 18:22 /dev/mapper/pdc_edcfibbf4
> 
> and dmraid shows the raidgroup OK:
> # dmraid -s
> *** Active Set
> name   : pdc_edcfibbf
> size   : 160086465
> stride : 128
> type   : mirror
> status : ok
> subsets: 0
> devs   : 2
> spares : 0
> 
> Any suggestions on how I can solve this issue and move on with my 
> installation.
> 
> Regards,
> -- 
> Dan Johansson, <http://www.dmj.nu>
> ***************************************************
> This message is printed on 100% recycled electrons!
> ***************************************************



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
