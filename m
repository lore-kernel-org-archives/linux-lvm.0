Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41K3tnJ029383
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:03:55 -0400
Received: from smtp04.atlngahp.sys.nuvox.net (smtp-out4.atlngahp.sys.nuvox.net
	[70.43.63.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41K3hN6012831
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:03:44 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp04.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m41K3fCO028139
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:03:41 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id A4F43306391
	for <linux-lvm@redhat.com>; Thu,  1 May 2008 16:03:41 -0400 (EDT)
Message-ID: <481A221D.80209@Media-Brokers.com>
Date: Thu, 01 May 2008 16:03:41 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
References: <4817C2FD.1010909@verizon.net>	<4817D97D.8060805@verizon.net>	<4817ECAF.4020806@verizon.net>	<48187B91.4060901@verizon.net>	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>	<4818AB1C.9030809@verizon.net>	<4818BA5D.6070501@Media-Brokers.com>	<4818D59A.8020906@verizon.net>	<4818E262.4070105@redhat.com>	<4818F2FC.5050907@verizon.net>	<20080501154800.GA5941@us.ibm.com>	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>	<481A08A7.5010305@verizon.net>	<481A0E28.5030108@Media-Brokers.com>	<481A1C09.7070508@verizon.net>
	<481A1D32.6020705@Media-Brokers.com> <481A1FAF.5050303@verizon.net>
In-Reply-To: <481A1FAF.5050303@verizon.net>
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

>>> It's like yesterday's newspaper.  Why do you need to keep it?

>> A wild guess... because the changes haven't been synced back with the 
>> original yet (which happens when the snapshot is released)?

> My understanding is that the snapshot is a copy-on-write (COW) to the 
> original volume.  If that is not the case, then I guess things must have 
> changed and I have some old information.

You could be right... like I said, I'm not totally understanding how it 
all works yet...

It would be nice if someone who knows could clear this up...

-- 

Best regards,

Charles
