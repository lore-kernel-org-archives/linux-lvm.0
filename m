Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KEmVBa011051
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 10:48:31 -0400
Received: from zeus.itg.uiuc.edu (zeus.itg.uiuc.edu [130.126.126.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8KEmMeH022217
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 10:48:22 -0400
Received: from zeus.itg.uiuc.edu (localhost.localdomain [127.0.0.1])
	by zeus.itg.uiuc.edu (8.13.1/8.13.1) with ESMTP id k8KEmLuT025596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 09:48:21 -0500
Received: from localhost (alazarev@localhost)
	by zeus.itg.uiuc.edu (8.13.1/8.13.1/Submit) with ESMTP id
	k8KEmLGM025593
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 09:48:21 -0500
Date: Wed, 20 Sep 2006 09:48:21 -0500 (CDT)
From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
Subject: Re: [linux-lvm] LVM on RAID
In-Reply-To: <1158760524.26653.4.camel@merlin.Mines.EDU>
Message-ID: <Pine.LNX.4.63.0609200939510.20726@zeus.itg.uiuc.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
	<1158760524.26653.4.camel@merlin.Mines.EDU>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I should have been more clear. I'm not worried about LVM on one RAID. My 
questions is specifically about creating an LVM volume group ACROSS two 
RAID's.

For example, we have a 64bit linux server, with two different RAID devices 
attached to the host via Fiber. These RAID's are each 4TB volumes. The 
RAID is attached as /dev/sda and /dev/sdb. What I'm asking about is 
creating a LVM volume group, and joining /dev/sda AND /dev/sdb to that 
same volume group, creating the lv of 8TB (minus overhead of course), and 
then creating a filesystem on that lv. A 8TB filesystem, which is spanned 
(via LVM) across both RAID's.

Does anyone here do that? Reading all the reply's I realize I wasn't clear 
enough about that, and neither was anyone's responses.

Alex

On Wed, 20 Sep 2006, Matthew B. Brookover wrote:

> I have used LVM on top of software raid and ISCSI.  It works well.  It
> also helps keep track of what device is where.  ISCSI does not export
> its targets in the same order, some times sdb shows up as sdc....   LVM
> will keep track of what is what.
>
> Matt
>
> On Tue, 2006-09-19 at 16:53 -0500, Alexander Lazarevich wrote:
>
>> We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which
>> are currently single devices on our 64bit linux servers (RHEL-4, core5).
>> We are considering LVM'ing 2 or more of the RAID's into a LVM group. I
>> don't doubt the reliability and robustness of LVM2 on single drives, but I
>> worry about it on top of RAID devices.
>>
>> Does anyone have any experience with LVM on to of RAID volumes, positive
>> or negative?
>>
>> Thanks,
>>
>> Alex
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
