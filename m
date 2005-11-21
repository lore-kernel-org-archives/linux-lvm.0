Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jALMMwV17777
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 17:22:58 -0500
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jALMMv2o024326
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 17:22:57 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep16-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051121222249.JUFY4450.viefep16-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 23:22:49 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Subject: Re: [linux-lvm] can t resize my lvm
Date: Mon, 21 Nov 2005 23:22:52 +0100
References: <200511211934.13943.Matthias.Meyer@gmx.li>
In-Reply-To: <200511211934.13943.Matthias.Meyer@gmx.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511212322.52680.Matthias.Meyer@gmx.li>
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

And now I do:
vdr:~# vgchange -an LVM2
vgchange -- volume group "LVM2" successfully deactivated

vdr:~# pvcreate -vff /dev/hdc1
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/hdc1"
pvcreate -- getting physical volume size
pvcreate -- checking maximum physical volume size
pvcreate -- checking partition type
pvcreate -- checking volume group name
pvcreate -- really INITIALIZE physical volume "/dev/hdc1" of volume group 
"LVM2" [y/n]? y
pvcreate -- WARNING: forcing physical volume creation on "/dev/hdc1" of 
volume group "LVM2"
pvcreate -- removing lvmtab entry
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/hdc1 with 195318207 sectors
pvcreate -- writing physical volume data to disk "/dev/hdc1"
pvcreate -- physical volume "/dev/hdc1" successfully created
pvcreate -- unlocking logical volume manager

and hove no more access to the volume group.
But it exists:
vdr:~# dir /dev/LVM2/Media
/dev/LVM2/Media

-- 
Don't Panic
