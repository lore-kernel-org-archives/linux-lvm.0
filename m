Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4ABAfrZ026403
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 07:10:41 -0400
Received: from batmobile.robinbowes.com
	(84-51-160-76.pambow882.adsl.metronet.co.uk [84.51.160.76])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k4ABAbT4019359
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 07:10:38 -0400
Message-ID: <4461CA20.2050305@robinbowes.com>
Date: Wed, 10 May 2006 12:10:24 +0100
From: Robin Bowes <robin-lists@robinbowes.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot segfaults lvremove + bug kernel
References: <01b701c66dcb$5176d9d0$0101000a@jack>
	<20060509094146.GA2708@redhat.com>
	<4460DC3D.3090008@robinbowes.com>
	<20060510104844.GR31579@redhat.com>
In-Reply-To: <20060510104844.GR31579@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Heinz Mauelshagen wrote:
> On Tue, May 09, 2006 at 07:15:25PM +0100, Robin Bowes wrote:
>> Do you have any idea when we might see a fix for this? Is the bug
>> present in later versions?
> 
> A fix has been provided ~2 weeks ago to lkml and was tested ok.
> It is in the recent stable kernels.

Can you define "recent" so I know which to install.

>> For example, I've got a box running FC4 that has this problem. If I
>> upgrade to FC5 am I likely to still see the problem?
> 
> Yes.

So, the FC5 kernels don't have the fix? Even in the Testing repos?

>> Also, what's the best way to get rid of the snapshot volumes? I'm
>> currently planning to boot from a recovery disk that supports lvm and
>> run lvremove from there.
> 
> That or using a n actual stable kernel *should* work,
> because tearing down kcopyd jobs dies with the bug under load.

OK, thanks.

R.
