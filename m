Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9FG0uV12872
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 12:00:56 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9FG0tnn026440
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 12:00:56 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1EQoSG-0001iy-Ez
	for linux-lvm@redhat.com; Sat, 15 Oct 2005 18:00:16 +0200
Received: from dsl093-191-107.nyc2.dsl.speakeasy.net ([66.93.191.107])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 18:00:16 +0200
Received: from esj by dsl093-191-107.nyc2.dsl.speakeasy.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 18:00:16 +0200
From: "Eric S. Johansson" <esj@harvee.org>
Date: Sat, 15 Oct 2005 11:46:11 -0400
Message-ID: <dir882$ouf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] everything most of works one problem, one question
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

system: Ubuntu 5.10

first mistake was trying to use Ubuntus installer to set up LVM and raid.
second mistake was trying to use EVMS to set up LVM and raid.

resorting to what works (mdadm and LVM2 commands)I found myself getting 
this error message with every LVM command

   Incorrect metadata area header checksum

I deleted the first five or 10 MB of each disk in the raid set but it 
persists.  Everything seems to operate, storage has been allocated, 
filesystems have been built, everything is detected on reboo and I have 
even resized one of the logical volumes and expanded the disk.

however, what I have read says that this warning message about incorrect 
metadata is something to be concerned about.  My question is, how do I fix?

second, this is probably a "RTFWP" question but how do you determine the 
free space on a physical volume.  For example, if I have two logical 
volumes created and I want to know how much space is left on the 
physical?  (apologies if I got the vocabulary wrong)

--- eric
