Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5KKEL8A007762
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 16:14:21 -0400
Received: from mail.gmx.net (mail.gmx.de [213.165.64.21])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k5KKEIW9025560
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 16:14:19 -0400
Date: Tue, 20 Jun 2006 22:14:11 +0200
From: Georg Klein <georg.klein@gmx.info>
Subject: Re: [linux-lvm] Mounting two logical volumes to the same mount point
Message-Id: <20060620221411.6ca547c8.georg.klein@gmx.info>
In-Reply-To: <200606202107.29948.Aad.Rijnberg@zonnet.nl>
References: <200606202107.29948.Aad.Rijnberg@zonnet.nl>
Mime-Version: 1.0
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
To: linux-lvm@redhat.com

Hi,

On Tue, 20 Jun 2006 21:07:29 +0200
Aad Rijnberg <Aad.Rijnberg@zonnet.nl> wrote:

> Hi,
> 
> my logical volume that contains /usr appears to be too small. I
> already removed some applications that I did not need, but it is
> still on the edge. Now that there are a lot of updates, I get the
> complaint of yum that there is not enough free space on /usr.

is it a own lv or is it just a directory on a lv?

> 
> I just bought an additional harddisk which I also needed for other
> purposes, and would like to reserve part of this new drive for extra
> LVM space. I have just created a new volume group (VolGroup01) on the
> new drive, and a logical volume (LogVol01) inside that physical
> volume group.

Extend the logical volume /usr is on. Partition your new hard disk,
make a partition a physical volume (pvcreate), extend your volume
group (vgextend) , extend your logical volume (lvextend) and resize the
file system. Done. That's what LVM is good for ;-)

> 
> Can I mount both /dev/mapper/VolGroup00-LogVol01 (which contains
> the /usr data on the "old" drive) and /dev/mapper/VolGroup01-LogVol01
> to the /usr mount point? Or can only one logical volume be mounted to
> a mount point?

just one device to a mount point. However, xou can mount the new lv to
a subdirectory of /usr - but the better (and LVM compliant) way is to
extend your existing lv.


Georg
