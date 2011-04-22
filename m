Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3MHMhAR005075
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 13:22:43 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3MHMfkS012092
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 13:22:42 -0400
Message-ID: <4DB1B960.8040807@abpni.co.uk>
Date: Fri, 22 Apr 2011 18:22:40 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4DB1ACBB.4040508@abpni.co.uk>	<alpine.LRH.2.00.1104221236420.8342@bmsred.bmsi.com>
	<4DB1AFF1.7000800@abpni.co.uk>
In-Reply-To: <4DB1AFF1.7000800@abpni.co.uk>
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
To: linux-lvm@redhat.com


On 22/04/2011 17:42, Jonathan Tripathy wrote:
>
> On 22/04/2011 17:38, Stuart D. Gathman wrote:
>> On Fri, 22 Apr 2011, Jonathan Tripathy wrote:
>>
>>> What is the best way to deploy LVM in such a way that multiple 
>>> servers could access the LVs? Really what I'm looking for is a 
>>> "common VG" for all of our servers. Note though that only one server 
>>> will actually access each LV, however it would be cool if another 
>>> server could make a snapshot to perform an rsync backup.
>>
>> This is what cluster LVM is for.  It provides a locking mechanism to
>> avoid conflicting changes to LVM metadata.
>>
> I'm a little confused on where CLVM fits into the "big picture". Let's 
> say I have one SAN server, and 10 Xen Servers. Where do I install CLVM?
>
>
Am I correct in saying that I only need to install CLVM on my Xen nodes? 
Assuming that my SAN server is just a standard iSCSI server exporting a 
few targets. I would probably only have 1 LUN per vg (hense 1 PV per vg).

Is that correct?
