Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q5RKlaKo030374
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2012 16:47:36 -0400
Received: from hrndva-omtalb.mail.rr.com (hrndva-omtalb.mail.rr.com
	[71.74.56.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5RKlZPq018110
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2012 16:47:36 -0400
Mime-Version: 1.0 (Apple Message framework v1278)
From: Richard Petty <richard@nugnug.com>
In-Reply-To: <alpine.LRH.2.02.1206271611360.24360@bmsred.bmsi.com>
Date: Wed, 27 Jun 2012 15:47:32 -0500
Message-Id: <EB5B618D-17E0-4CC1-A07B-A12182E7EA00@nugnug.com>
References: <0E20371F-6E09-42C7-951D-FCBEAB657A2D@nugnug.com>
	<20120307203153.GJ3407@barkeeper1-xen.linbit>
	<071D113E-7905-4725-ADA5-C2CC64349651@nugnug.com>
	<20120320203219.GH4969@barkeeper1-xen.linbit>
	<7B657B4B-BB07-41C4-BEEC-C41BA36B1852@nugnug.com>
	<alpine.LRH.2.02.1206271611360.24360@bmsred.bmsi.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you so very much for pointing that out. That's a relief!

--Richard


On Jun 27, 2012, at 3:14 PM, Stuart D Gathman wrote:

> On Jun 27, Richard Petty transmitted in part:
> 
>>>   Device Boot      Start         End      Blocks   Id  System
>>> /dev/sdc1               1       62360   209715200   8e  Linux LVM
>>> /dev/sdc2           62360      218259   524288793   8e  Linux LVM
>>> /dev/sdc3          218260      435191   729542316   8e  Linux LVM
>> 
>> The last block of sdc1 is 62360 and the first block of sdc2 is 62360... the same block.
> 
> Those aren't blocks, those are cylinders.  That just means that sdc2
> starts in the middle of cylinder 62360.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
