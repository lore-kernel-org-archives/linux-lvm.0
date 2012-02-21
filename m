Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1LGngfh011700
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:49:42 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1LGnf5Z030829
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:49:41 -0500
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q1LGmrE3014539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:48:53 -0500
Message-ID: <4F43CB24.5060901@bmsi.com>
Date: Tue, 21 Feb 2012 11:49:40 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <4F43588B.8040202@agenda.si>
	<20120221120933.GB12645@agk-dp.fab.redhat.com>
	<20120221103503.4ba74c70@bettercgi.com>
	<20120221164321.GA14666@agk-dp.fab.redhat.com>
In-Reply-To: <20120221164321.GA14666@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Duplicate PV's - how does LVM choose which one to
 use
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 02/21/2012 11:43 AM, Alasdair G 
Kergon would write:
> On Tue, Feb 21, 2012 at 10:35:03AM -0600, Ray Morris wrote:
>> Perhaps when duplicates are found the seqno should be incremented
>> so it DOES use the same one next time, and generate a warning
>> indicating which one is out of date?
> Wouldn't be possible - it can't distinguish between them (or we'd not
> be in this situation).
>
> If they have the same UUID it assumes they are different paths to the same
> device and picks one of them to use.
>
> But there are other cases (like hardware snapshot, mirror that failed to
> start up first) where it's better to stop and force the sysadmin to fix
> things.
>
But if they are different paths, incrementing seqno won't hurt, both 
paths will see the change.  And if it is a mirror that failed to start, 
then the chosen leg is now distinguishable.  Is there a problem with 
incrementing seqno an extra time at startup when multipath is the normal 
situation?
