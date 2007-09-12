Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8CEm3S8007043
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 10:48:03 -0400
Received: from portal.bppiac.hu (portal.bppiac.hu [213.253.216.130])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8CEm18x027079
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 10:48:02 -0400
Message-ID: <46E7FC20.8090003@bppiac.hu>
Date: Wed, 12 Sep 2007 16:48:00 +0200
From: Farkas Levente <lfarkas@bppiac.hu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] is it possible to move lvm2 logvols?
References: <46E719BE.5000202@bppiac.hu>
	<slrnfeesv8.dn9.robert.sander@raman.epigenomics.epi>
In-Reply-To: <slrnfeesv8.dn9.robert.sander@raman.epigenomics.epi>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Robert Sander wrote:
> On Wed, 12 Sep 2007 00:42:06 +0200,
>  Farkas Levente <lfarkas@bppiac.hu> wrote:
>> hi,
>> hi we've got a server with a lvm2 pv with a dozen of logvol in it. under
>> the lvm we'd like to create a raid1 array on 2 disk. unfortunately we
>> create raid0 under it. but the logvols contains a lots of important
>> data. we'd like to
>> - put 2 new disks into the system,
>> - create the raid1 array on it,
>> - put a new volgroup over the raid1,
> 
> Hi!
> 
> Do not create a new vg.
> Add the raid1 as a second pv to the existing vg.
> Use pvmove to move the logical volumes from one pv to the other.
> This is an online operatipn.

ok everything seems to working. after i move the logvols i remove the
old pv and try to boot the system. now the problem during the boot linux
can't find the volume group so can't find it's / since the / is on the
first logvol of the vg. this on centos-5.
the strange thing if i boot from centos rescue dvd it see the vg and
logvols too and i can chroot /mnt/sysimage into the new real system.
what can be the reason that if i boot the new system it can't find the
vg and it's logvols?

-- 
  Levente                               "Si vis pacem para bellum!"
