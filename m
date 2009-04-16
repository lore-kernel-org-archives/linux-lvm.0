Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GDalYG024783
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 09:36:47 -0400
Received: from mail.comfortechassist.com (mail.comfortechassist.com
	[206.123.115.188])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3GDaUOA010250
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 09:36:33 -0400
Received: from foxtrot.brunson.com (c-76-120-85-88.hsd1.co.comcast.net
	[76.120.85.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.comfortechassist.com (Postfix) with ESMTP id 6BDF87C075
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 07:32:14 -0600 (MDT)
Message-ID: <49E7345B.1040002@brunson.com>
Date: Thu, 16 Apr 2009 07:36:27 -0600
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
References: <29070.706.qm@web94806.mail.in2.yahoo.com>	<49E71F9D.3010401@sivell.com>
	<20090416125403.GU7843@agk.fab.redhat.com>
In-Reply-To: <20090416125403.GU7843@agk.fab.redhat.com>
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

On 04/16/2009 06:54 AM, Alasdair G Kergon wrote:
> On Thu, Apr 16, 2009 at 07:07:57AM -0500, vu pham wrote:
>    
>> yogeen honnavar wrote:
>>      
>>> Dear users,
>>> dd if=/dev/zero of=/dev/vg1/lv1 count=10
>>> as per the redhat guide this should result in mirror leg failure and any
>>>        
>
> Can you provide the reference - where does it say this?
>
> Alasdair
>    

I believe this is the reference.

http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/Cluster_Logical_Volume_Manager/mirrorrecover.html

Their example may be in error.
