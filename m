Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4IMiSbg008455
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 18:44:28 -0400
Received: from batmobile.robinbowes.com
	(84-51-160-76.pambow882.adsl.metronet.co.uk [84.51.160.76])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k4IMiQpI025032
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 18:44:27 -0400
Message-ID: <446CF8C2.9000406@robinbowes.com>
Date: Thu, 18 May 2006 23:44:18 +0100
From: Robin Bowes <robin-lists@robinbowes.com>
MIME-Version: 1.0
References: <01b701c66dcb$5176d9d0$0101000a@jack>	<20060509094146.GA2708@redhat.com>	<4460DC3D.3090008@robinbowes.com>
	<20060510104844.GR31579@redhat.com>
In-Reply-To: <20060510104844.GR31579@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Snapshot segfaults lvremove + bug kernel
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Heinz Mauelshagen wrote:
> On Tue, May 09, 2006 at 07:15:25PM +0100, Robin Bowes wrote:
>> Heinz Mauelshagen wrote:
>>> this is a known issue with tearing down kcopyd jobs we're working on.
>>>
>> Heinz,
>>
>> Do you have any idea when we might see a fix for this? Is the bug
>> present in later versions?
> 
> A fix has been provided ~2 weeks ago to lkml and was tested ok.
> It is in the recent stable kernels.

Heinz,


Can you point me at the bugzilla for this problem so I can track which
kernels have the fix?

Thanks,

R.
