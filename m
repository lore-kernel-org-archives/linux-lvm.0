Received: from o.ww.redhat.com (vpn-4-3.stuttgart.redhat.com [10.32.4.3])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5L8OaP9012486
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 04:24:37 -0400
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.6/8.13.6) with ESMTP id k5L8OYpB000483
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 10:24:35 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.6/8.13.6/Submit) id k5L8OYxt000482
	for linux-lvm@redhat.com; Wed, 21 Jun 2006 10:24:34 +0200
Date: Wed, 21 Jun 2006 10:24:34 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Mounting two logical volumes to the same mount point
Message-ID: <20060621082434.GA4570@redhat.com>
References: <200606202107.29948.Aad.Rijnberg@zonnet.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200606202107.29948.Aad.Rijnberg@zonnet.nl>
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

On Tue, Jun 20, 2006 at 09:07:29PM +0200, Aad Rijnberg wrote:
> Hi,
> 
> my logical volume that contains /usr appears to be too small. I already 
> removed some applications that I did not need, but it is still on the edge. 
> Now that there are a lot of updates, I get the complaint of yum that there is 
> not enough free space on /usr.
> 
> I just bought an additional harddisk which I also needed for other purposes, 
> and would like to reserve part of this new drive for extra LVM space. I have 
> just created a new volume group (VolGroup01) on the new drive, and a logical 
> volume (LogVol01) inside that physical volume group. 
> 
> Can I mount both /dev/mapper/VolGroup00-LogVol01 (which contains the /usr data 
> on the "old" drive) and /dev/mapper/VolGroup01-LogVol01 to the /usr mount 
> point? Or can only one logical volume be mounted to a mount point?

Aad,

you can only mount one device with a filesystem on the same mountpoint.

What needs doing in order to grow your logical volume containing the usr
filesystem, is to *add* the second drive to the existing volume group on the
first one and grow usr afterwards (LV and FS).

Carry out the follwoing steps (or use system-config-lvm):

lvremove VolGroup01/LogVol01
vgremove VolGroup01
vgextend VolGroup00 /dev/sdb # or whatever the drive is

# replace 5G with the capacity you want to add
lvextend -L+5G VolGroup00/LogVol01

How to grow the FS depends on the type; for ext2/3 you'ld run:

ext2online /dev/VolGroup00/LogVol00


> 
> Aad
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
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
