Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n470ADvB005597
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 20:10:13 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4708pU4021912
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 20:08:52 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1M1rAR-0003I8-Bh
	for linux-lvm@redhat.com; Thu, 07 May 2009 02:08:51 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1M1rAM-0004fD-KS
	for linux-lvm@redhat.com; Thu, 07 May 2009 02:08:46 +0200
Message-ID: <4A02268F.8010105@whgl.uni-frankfurt.de>
Date: Thu, 07 May 2009 02:08:47 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and Truecrypt
References: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>
In-Reply-To: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Gordon,

Is there any particular Reason, why a mainboard failure should result in 
massive data loss?
But you can be assured, that a disk failure in such a volume will most 
certainly result in massive dataloss, since the filesystem spans across 
all disks.
Is there any partuclar reason for using truecrypt?

Regards

-Sven

Gordon Fogus schrieb:
> Hello all,
> 
> I am trying to create a 10TB network share (like a NAS share, but with 
> permission levels) on a dedicated GNU+Linux server to be used on a 
> Linux/Windows network.
> 
> I must use truecrypt for full drive encryption. 
> I need the disks to be independently mountable (no striping, parity bits 
> or files spanning across physical drives) (this is because I am afraid 
> of massive data loss from a mainboard failure.  If you can show me that 
> this fear is unfounded and that I would definitely be able to recover my 
> data after a mainboard failure, then I would not hesitate to use files 
> spanning across drives). 
> Most importantly, the combined space of the disks (10TB) must appear as 
> 10TB on the network, not 10 @ 1TB drives (if I were using 1TB drives, 
> for example). 
> Resonable continuous write speed is also a factor for me.
> It is essential that this drive space can be "mounted" (i.e., "mount 
> network drive") on a Windows machine.
> Different folders must be able to have different permissionn levels for 
> different users, similar to the permission levels available in Microsoft 
> shares (write new files/edit files/delete files/make new folders/delete 
> folders/etc.).  After someone connects to the file server, he must not 
> be able to access every file, only those specificly shared to him.
> 
> Can someone point me to info on using truecrypt with LVM? 
> 
> (I am new to GNU+Linux.  File serving on a Windows Active Directory 
> server is... unpredictable.)
> 
> Gordon
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
