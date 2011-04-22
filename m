Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3MGggV6021204
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 12:42:42 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3MGgQ5x002022
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 12:42:27 -0400
Message-ID: <4DB1AFF1.7000800@abpni.co.uk>
Date: Fri, 22 Apr 2011 17:42:25 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4DB1ACBB.4040508@abpni.co.uk>
	<alpine.LRH.2.00.1104221236420.8342@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1104221236420.8342@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] SAN
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On 22/04/2011 17:38, Stuart D. Gathman wrote:
> On Fri, 22 Apr 2011, Jonathan Tripathy wrote:
>
>> What is the best way to deploy LVM in such a way that multiple 
>> servers could access the LVs? Really what I'm looking for is a 
>> "common VG" for all of our servers. Note though that only one server 
>> will actually access each LV, however it would be cool if another 
>> server could make a snapshot to perform an rsync backup.
>
> This is what cluster LVM is for.  It provides a locking mechanism to
> avoid conflicting changes to LVM metadata.
>
I'm a little confused on where CLVM fits into the "big picture". Let's 
say I have one SAN server, and 10 Xen Servers. Where do I install CLVM?
