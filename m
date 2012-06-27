Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q5RKEgQd006302
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2012 16:14:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5RKEehU009227
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2012 16:14:40 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q5RKEZxI007482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2012 16:14:39 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id q5RKEVSZ024438
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2012 16:14:31 -0400
Date: Wed, 27 Jun 2012 16:14:31 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <7B657B4B-BB07-41C4-BEEC-C41BA36B1852@nugnug.com>
Message-ID: <alpine.LRH.2.02.1206271611360.24360@bmsred.bmsi.com>
References: <0E20371F-6E09-42C7-951D-FCBEAB657A2D@nugnug.com>
	<20120307203153.GJ3407@barkeeper1-xen.linbit>
	<071D113E-7905-4725-ADA5-C2CC64349651@nugnug.com>
	<20120320203219.GH4969@barkeeper1-xen.linbit>
	<7B657B4B-BB07-41C4-BEEC-C41BA36B1852@nugnug.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Corrupt PV (wrong size)
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Jun 27, Richard Petty transmitted in part:

>>    Device Boot      Start         End      Blocks   Id  System
>> /dev/sdc1               1       62360   209715200   8e  Linux LVM
>> /dev/sdc2           62360      218259   524288793   8e  Linux LVM
>> /dev/sdc3          218260      435191   729542316   8e  Linux LVM
>
> The last block of sdc1 is 62360 and the first block of sdc2 is 62360... the same block.

Those aren't blocks, those are cylinders.  That just means that sdc2
starts in the middle of cylinder 62360.
