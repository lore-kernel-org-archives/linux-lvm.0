Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4AHSRO27304
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 13:28:27 -0400
Received: from snefru.openlib.org (netec.wustl.edu [128.252.177.195])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4AHSLCf009307
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 13:28:21 -0400
Received: from krichel by snefru.openlib.org with local (Exim 4.50)
	id 1DVYbB-0006mj-6w
	for linux-lvm@redhat.com; Tue, 10 May 2005 12:32:49 -0500
Date: Tue, 10 May 2005 12:32:49 -0500
From: Thomas Krichel <krichel@openlib.org>
Message-ID: <20050510173249.GJ2445@openlib.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] ide / debian
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
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@redhat.com>



  I want to combine hdb hdc and hdd to one logical volume.
  Each is 80G. All had a single partition. I have a 2.6.8 kernel. 
  I  run the latest Debian testing version of lvm2.

  The first attempt only got me only 149G for the vg. 
  So I followed the route suggested in the howto
  to delete the partition tables on every disk 
  and use the devices. This give me a 220G vg. But
  there were some error messages about not opening
  /dev/hdb1 etc, which I ignored. I create an lv
  to fill the volume group and make an ext2 file
  system on it.

  After the first reboot, the lv was not found. Inconsistent
  metaadata was reported, which I fixed with the suggested
  syntax, then tried to create the vg again, but got a 
  much smaller size.

  I want to start from scratch for the third time.

fafner:~# vgremove /dev/vg1
  Volume group "vg1" not found or inconsistent.
  Consider vgreduce --removemissing if metadata is inconsistent.
fafner:~# vgreduce --removemissing vg1
  Volume group "vg1" not found
fafner:~# vgscan 
  Reading all physical volumes.  This may take a while...
fafner:~# vgcreate vg1 /dev/hdb /dev/hdc /dev/hdd
  /dev/vg1: already exists in filesystem

  My general impression is that maybe with ide or Debian,
  this technology is not quite mature. If anyone wants
  to check out this problem, I will be happy to allow
  access to the machine. 


  Cheers,

  Thomas Krichel                      mailto:krichel@openlib.org
                                 http://openlib.org/home/krichel
                             RePEc:per:1965-06-05:thomas_krichel
