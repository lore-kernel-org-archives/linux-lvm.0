Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7HD6Jp0027100
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2011 09:06:19 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7HD6HOS024974
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2011 09:06:18 -0400
Received: from gtw.srd.co.uk ([82.69.77.54] helo=agnew.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Qtfp2-0004XX-EH
	for linux-lvm@redhat.com; Wed, 17 Aug 2011 14:06:16 +0100
Message-ID: <4E4BBCC2.3050607@ankh.org>
Date: Wed, 17 Aug 2011 14:06:10 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <013601cc5bd2$fd25e280$f771a780$@edu.tr>	<CADinLjQqV+CixkrGUYGfMtS5SCr+BLjgFys98MuXM2BoXcvB=g@mail.gmail.com>
	<20110817075603.79ffbe4b@bettercgi.com>
In-Reply-To: <20110817075603.79ffbe4b@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how can I setup software RAID1 on a running LVM
	system
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

Ray Morris wrote:
> "man mdadm" or:
> http://tinyurl.com/4pjnu43
>   
Alturnatively he might want to create a mirror using LVM not a block 
device. Answer when you create the LV using "lvcreate" use the -m option 
to set the number of mirror copies. Alturnatively you can use lvconvert 
to change a normal LV into a mirrored one.

The question of how to get the system back if a disk fails in a tricky 
one.... If a disk fails the system should keep on working as there is a 
copy of the information so it will continue to work, Hardware might have 
problems with the drive if it is not a clean failure though, what is 
needed is to reduce out the damaged disk and add a new undamaged one, 
the one problem is the BOOT block if the disk is the boot device, then 
you might need use grub to setup a new boot block on the new device.

James
