Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3M04kec011792
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 20:04:46 -0400
Received: from black.open2space.com ([68.144.188.211])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3M04jGi010824
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 20:04:45 -0400
Received: from localhost (localhost [127.0.0.1])
	by black.open2space.com (Postfix) with ESMTP id E0C31328D9
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 23:11:46 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by black.open2space.com (Postfix) with ESMTP id A9F0A328BE
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 23:11:46 -0600 (MDT)
Received: from black.open2space.com ([127.0.0.1])
	by localhost (black [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 23700-09 for <linux-lvm@redhat.com>;
	Fri, 21 Apr 2006 23:11:46 -0600 (MDT)
Received: from [192.168.0.20] (unknown [192.168.0.20])
	by black.open2space.com (Postfix) with ESMTP id 2BFFE30778
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 23:11:45 -0600 (MDT)
From: Shawn <sgrover@open2space.com>
Subject: Re: [linux-lvm] LVM. Do i loose everything?
Date: Fri, 21 Apr 2006 17:12:42 -0600
References: <4442C7D0.40206@ee.duth.gr>
In-Reply-To: <4442C7D0.40206@ee.duth.gr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604211712.42503.sgrover@open2space.com>
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

On Sunday 16 April 2006 16:40, kyr wrote:
> Hello,
>
>      I wound be thankful if you can answer one simple question that I
> haven't found the answer in all the LVM manuals, FAQ, howtos.
>
> I have a continuous (not stiped) VG consisting of 3 PV (Hard Disks) with
> one LV on EXT3.
>
> If one hard disk fails (hardware) will i loose everything on all disks?

I'm far from an expert with LVM, but I think the answer is a safe No.  And 
even further, you could possibly recover the data on the damaged drive (see 
http://grover.open2space.com/node/17).

The data stored on that particular drive might become in accessible (without 
any recovery efforts), but the data sitting on the other drives should still 
be there.  

I'm taking a guess based on what I saw during a data recovery process, but...  
It looks like the drive/partition is tagged as being part of a volume, and 
then the appropriate file system is applied.  If this is the case, then 
loosing a drive should not corrupt your filesystem on the remaining drives.  

I am not comfortable enough with my knowledge to say this is anywhere near 
authoritative.  But I do hope I helped...

Shawn
