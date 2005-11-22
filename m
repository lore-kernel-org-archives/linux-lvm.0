Received: from o.ww.redhat.com (vpn50-21.rdu.redhat.com [172.16.50.21])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	jAM9wLYx005821
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 10:58:22 +0100
Date: Tue, 22 Nov 2005 10:58:20 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] can t resize my lvm
Message-ID: <20051122095820.GE30556@redhat.com>
References: <200511211934.13943.Matthias.Meyer@gmx.li>
	<200511212322.52680.Matthias.Meyer@gmx.li>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200511212322.52680.Matthias.Meyer@gmx.li>
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


Matthias,

you don't need to deactivate your VG in order to grow it.

That's the whole point behind LVM: be able to adjust your changing
storage requirements online.

Do "vgchange -ay", "vgextend LVM2 /dev/hdc1" and you'll have your
VG online with extended capacity to grow your LV and FS in another step.

Regards,
Heinz    -- The LVM Guy --


On Mon, Nov 21, 2005 at 11:22:52PM +0100, Matthias Meyer wrote:
> And now I do:
> vdr:~# vgchange -an LVM2
> vgchange -- volume group "LVM2" successfully deactivated
> 
> vdr:~# pvcreate -vff /dev/hdc1
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/hdc1"
> pvcreate -- getting physical volume size
> pvcreate -- checking maximum physical volume size
> pvcreate -- checking partition type
> pvcreate -- checking volume group name
> pvcreate -- really INITIALIZE physical volume "/dev/hdc1" of volume group 
> "LVM2" [y/n]? y
> pvcreate -- WARNING: forcing physical volume creation on "/dev/hdc1" of 
> volume group "LVM2"
> pvcreate -- removing lvmtab entry
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/hdc1 with 195318207 sectors
> pvcreate -- writing physical volume data to disk "/dev/hdc1"
> pvcreate -- physical volume "/dev/hdc1" successfully created
> pvcreate -- unlocking logical volume manager
> 
> and hove no more access to the volume group.
> But it exists:
> vdr:~# dir /dev/LVM2/Media
> /dev/LVM2/Media
> 
> -- 
> Don't Panic
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
