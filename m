Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GDratW002847
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 09:53:36 -0400
Received: from campbell-lange.net (no.rdns-yet.ukservers.com [78.110.169.69]
	(may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GDrPAl026587
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 09:53:25 -0400
Received: from veselin by campbell-lange.net with local (Exim 4.69)
	(envelope-from <veselin@campbell-lange.net>) id 1K8F95-0005uV-I9
	for linux-lvm@redhat.com; Mon, 16 Jun 2008 14:53:19 +0100
Date: Mon, 16 Jun 2008 14:53:19 +0100
From: Veselin Kantsev <veselin@campbell-lange.net>
Message-ID: <20080616135319.GA29234@campbell-lange.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
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
To: linux-lvm@redhat.com

Hello,
I'm using LVM snapshots on the following configuration:

Debian lenny (2.6.24-1-amd64)

LVM version:     2.02.33 (2008-01-31)
Library version: 1.02.24 (2007-12-20)
Driver version:  4.12.0

3ware 9000 Storage Controller device driver for Linux v2.26.02.010

I have a Logical volume running off a RAID5 for all my data.
I recently started making daily LVM snapshots of this Logical volume.

The problem I'm experiencing now is that the server freezes if I try
write a big chunk of data to the LVM volume.

Writing is OK on the second RAID (which holds the Debian OS)

Is there some known problem with writing lots of data to LVs while using
LVM snapshots?


Thank you.

-- 
Regards,
Veselin
