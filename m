Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4TKVere020957
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 16:31:40 -0400
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4TKVbJx020280
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 16:31:38 -0400
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id 1C4C5330342
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 22:31:32 +0200 (CEST)
Received: from [213.97.212.36] (36.Red-213-97-212.staticIP.rima-tde.net
	[213.97.212.36])
	by carlit.cesca.es (Postfix) with ESMTP id A71353302E1
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 22:31:31 +0200 (CEST)
Message-ID: <465C8FCE.2050800@cesca.es>
Date: Tue, 29 May 2007 22:40:46 +0200
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on a fake disk
References: <465BD163.4010904@cesca.es> <465BD7FE.7080501@gmail.com>
In-Reply-To: <465BD7FE.7080501@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you! I did it this way and it worked perfectly!

Jordi

David Robinson wrote:
> Jordi Prats wrote:
>> Hi all,
>> How can I define voluem groups and logical volumes using a disk image
>> on a file that will be the root filesystem of another machine (not the
>> one that is defining them)?
> 
> The link below provides some details which may help. You can use losetup
> to associate a loop device with a regular file, then treat it as you
> would to a normal block device.
> 
> http://fedoraproject.org/wiki/Docs/Fedora7VirtQuickStart#head-498c8bbe74fd334cf63a4f1f918be74c726238dd
> 
> 
> ie:
> 
> # create a sparse file to use as the block device in the guest
> dd if=/dev/zero of=disk1.img seek=8096 bs=1M count=0
> 
> # setup a loopback device
> losetup /dev/loop0 disk1.img
> 
> /dev/loop0 can now be used like a normal block device. If you partition
> the device thou it's slightly different - you need to use kpartx to make
> the partitions usable.
> 
> ie:
> 
> # create a partition table on the device (/boot cannot be on an LVM volume)
> fdisk /dev/loop0
> 
> # make the partitions visible (they will appear as /dev/mapper/loop0pX,
> where X is a partition number)
> kpartx -a /dev/loop0
> 
> # then you can use LVM on the devices
> pvcreate /dev/mapper/loop0p1
> 
> The LVM's point of view there is nothing special that needs to be done
> other than scanning for the volume groups (vgscan) and
> activating/deactivating them (vgchange -ay <vg>/ vgchange -an <vg>).
> 
> Dave
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 

-- 
......................................................................
        __
       / /          Jordi Prats Catal�
 C E / S / C A      Departament de Sistemes
     /_/            Centre de Supercomputaci� de Catalunya

 Gran Capit�, 2-4 (Edifici Nexus) � 08034 Barcelona
 T. 93 205 6464 � F.  93 205 6979 � jprats@cesca.es
......................................................................
pgp:0x5D0D1321
......................................................................
