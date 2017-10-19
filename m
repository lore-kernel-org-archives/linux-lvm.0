Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECB0460BE3
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 21:14:30 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 584B5C059B69
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 21:14:28 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23017.5555.200654.218469@quad.stoffel.home>
Date: Thu, 19 Oct 2017 17:14:27 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <90cb544ffa100a862f503528ba5bf73f@xenhideout.nl>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<90cb544ffa100a862f503528ba5bf73f@xenhideout.nl>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: Xen <list@xenhideout.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Xen" == Xen  <list@xenhideout.nl> writes:

Xen> John Stoffel schreef op 19-10-2017 21:09:
>> How did you setup your LVM config and your cache config?  Did you
>> mirror the two SSDs using MD

Xen> He said he used hardware RAID to mirror the devices.

Ok, missed that.  But still we need the LVM config info and details on
the system config to address these issues.  I suspect he's not running
with any swap configured as well, and something is pushing the system
over the line.  But it's hard to know.

Any output from 'dmesg' you can share?  The more detailed the better.


>> I ask because I'm running lvcache at home on my main file/kvm server
>> and I've never seen this problem.  But!  I suspect you're running a
>> much older kernel, lvm config, etc.

Xen> lvm2-2.02.171-8.el7.x86_64

Xen> CentOS 7.4 was released a month ago.

And RHEL7.4/CentOS 7 is all based on kernel 3.14 (I think) with lots
of RedHat specific backports.  So knowing the full details will only
help us provide help to him.
