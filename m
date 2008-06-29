Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5T3T2Hq029841
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 23:29:02 -0400
Received: from troy.its.carleton.edu (Troy.its.Carleton.edu [137.22.94.86])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5T3SkZB000519
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 23:28:47 -0400
Received: from mail.carleton.edu (mail2.its.carleton.edu [137.22.194.92])
	by troy.its.carleton.edu (8.13.1/8.13.1) with ESMTP id m5T3Skau013655
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 22:28:46 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.carleton.edu (Postfix) with ESMTP id EF8BA57E2E32
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 22:28:45 -0500 (CDT)
Received: from mail.carleton.edu ([127.0.0.1])
	by localhost (mail.carleton.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJoYqKWoTPmB for <linux-lvm@redhat.com>;
	Sat, 28 Jun 2008 22:28:45 -0500 (CDT)
Received: from mail.carleton.edu (mail.carleton.edu [137.22.194.90])
	by mail.carleton.edu (Postfix) with ESMTP id A7CEF57E2E21
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 22:28:45 -0500 (CDT)
Date: Sat, 28 Jun 2008 22:28:45 -0500 (CDT)
From: Rich Graves <rgraves@carleton.edu>
Message-ID: <562849231.15095191214710125649.JavaMail.root@mail2.its.carleton.edu>
In-Reply-To: <95164166.15094811214709604949.JavaMail.root@mail2.its.carleton.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Mounting a Partition Image of LM partition?
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

Michael D. Setzer II wrote:
> with info. I have a compressed disk image of the 250G drive, and also have 
> a compressed partition image of the partitions with the LVM partition. I
> was able to copy this partition to my home machine taking about 11 hours,
> and was able to uncompress the lzop image. I was then able to use losetup 
> /dev/loop0 to load the image, and pvscan then shows it, but it has the
> same name  as the regular LVM volumne on the machine. 

Well, that's relatively easy to fix. Pick a unique name for your home
system's volume group; change fstab and grub.conf; mkinitrd; boot from a
rescue CD; vgrename; cross your fingers; reboot. Then you ought to be able
to finish the job you started.

...and don't accept the default VolumeGroup00 name again.
-- 
Rich Graves http://claimid.com/rcgraves
Carleton.edu Sr UNIX and Security Admin
CMC135: 507-646-7079 Cell: 952-292-6529
