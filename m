Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGJLwr26996
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 14:21:58 -0500
Received: from fry.mrunge.se (1-1-10-25a.gtd.gbg.bostream.se [82.182.172.17])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBGJLpAh029015
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 14:21:52 -0500
Received: from [192.168.1.52] (1-1-10-34a.gtd.gbg.bostream.se [82.182.172.29])
	by fry.mrunge.se (Postfix) with ESMTP id 429D73476D
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 20:21:55 +0100 (CET)
Message-ID: <41C1E058.1020300@slacker.se>
Date: Thu, 16 Dec 2004 20:22:00 +0100
From: Mattias Runge <mattias@slacker.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problems with LVM
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

I had a lvm-array with 3 disks � 120gb. One failed and then I could not 
bring the array online. I had one partition spanning the whole array. 
Finaly I tried vgreduce --removemissing, this got rid of the errors, but 
unfortunatly it now seems that the whole lvm-array of the two remaing 
disks is unallocated. My problem is that I would like to get the data of 
the two remaining disks. Is there any way of doing this or did I !@"#� 
up when i did vgreduce --removemissing?
I am using reiserfs on the disk.

Thanks
Mattias
