Received: from [10.34.130.160] (dhcp130-160.brq.redhat.com [10.34.130.160])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAQHE9wq010813
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 12:14:10 -0500
References: <565734C4.5020402@windriver.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56573DE0.4070407@redhat.com>
Date: Thu, 26 Nov 2015 18:14:08 +0100
MIME-Version: 1.0
In-Reply-To: <565734C4.5020402@windriver.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin_check called with wrong path during "vgchange
	-ay"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 26.11.2015 v 17:35 Chris Friesen napsal(a):
> Hi,
>
> I'm hoping this is a known issue.  I'm trying to use thin provisioning with
> openstack cinder.
>
> If I run "vgchange -ay cinder-volumes" manually, it complains:
>
> controller-0:/home/wrsroot# vgchange -ay cinder-volumes
>    Check of thin pool cinder-volumes/cinder-volumes-pool failed (status:1).
> Manual repair required (thin_dump --repair
> /dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta)!
>
> If I run thin_check on /dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta it
> complains that the file doesn't exist:
>
>
> controller-0:/home/wrsroot# thin_check
> /dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta
> Couldn't stat dev path
>
>
> The actual file name is
> /dev/mapper/cinder--volumes-cinder--volumes--pool_tmeta (note the
> double-hyphens) and if I run thin_check on that then it seems happy:
>
> controller-0:/home/wrsroot# thin_check
> /dev/mapper/cinder--volumes-cinder--volumes--pool_tmeta
> examining superblock
> examining devices tree
> examining mapping tree
> checking space map counts
>
>
> Does anyone know why thin_check is being called with the wrong filename?
>
> For what it's worth, here's my lvm version:
> controller-0:/home/wrsroot# lvm version
>    LVM version:     2.02.95(2) (2012-03-06)

This was early version with thin_check call support - and had a bug
in path building fixed in 2.02.96.

Anyway please switch to some version from this year - ideally upstream...

Zdenek
