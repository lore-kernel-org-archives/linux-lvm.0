Received: from o.ww.redhat.com (vpn50-23.rdu.redhat.com [172.16.50.23])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i3UAv0Nv028819
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 12:57:01 +0200
Date: Fri, 30 Apr 2004 12:53:23 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Help with my LVM
Message-ID: <20040430105323.GB15691@redhat.com>
References: <20040428162429.9978.qmail@qmail-local.click21.com.br>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040428162429.9978.qmail@qmail-local.click21.com.br>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 28, 2004 at 01:24:29PM -0300, Rodolfo Sikora de Melo 2 wrote:
> Guys, I'm desperate needing help.
> After a reboot one of lvm pv stopped do work.

What *exactly* happened to your LVM PVs before the reboot ?

> 
> The scenario:
> 10 disks: 
> 5 disks in channel A Raid 5
> 5 disks in channel B Raid 5
> 
> the sda has sda1 sda2 sda3, where only sda3 is a physical volume and is working great.
> 
> the sda has sdb1 sdb2 sdb3, where only sdb3 is a physical volume and after a reboot stopped to work.
> 
> licor:~/uuid_fixer# pvdisplay /dev/sdb3
> pvdisplay -- no physical volume identifier on "/dev/sdb3"

Presumably your RAID is fully operational, some{one|thing} has written
over the LVM metadata. At least partionally.

> 
> What I can do to fix this? I have 100Gb of important data inside this PV. 

If just the LVM metatada and no data on /dev/sdb3 is gone *and* you've
got /etc/lvmconf/ metadata backups, you want to run:

# pvcreate -ff /dev/sdb3
# vgcfgrestore -n VGName /dev/sdb3

Before you do that or any other changes to your disks, let's make clear 
what really happend first!

> 
> I can provide any information u need to help me!
> Thank you very much.
> 
> 
> 
> 
> ___________________________________________________________________________________
> Acesse nosso portal www.click21.com.br
> 
> Porque internet gr?tis, nem a Embratel pode fazer mais barato. Mas pode fazer melhor.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
