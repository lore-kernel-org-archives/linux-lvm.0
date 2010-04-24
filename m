Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3O1dfPP015954
	for <linux-lvm@redhat.com>; Fri, 23 Apr 2010 21:39:41 -0400
Received: from eastrmmtao102.cox.net (eastrmmtao102.cox.net [68.230.240.8])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3O1dTwf004765
	for <linux-lvm@redhat.com>; Fri, 23 Apr 2010 21:39:30 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao102.cox.net
	(InterMail vM.8.00.01.00 201-2244-105-20090324) with ESMTP
	id <20100424013930.SSAU7060.eastrmmtao102.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Fri, 23 Apr 2010 21:39:30 -0400
Message-ID: <4BD24BD0.3080501@cox.net>
Date: Fri, 23 Apr 2010 20:39:28 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <4BC58DF3.608@redhat.com> <4BC5D58F.2030809@cfl.rr.com>
In-Reply-To: <4BC5D58F.2030809@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems resizing physical volume
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

On 04/14/2010 09:47 AM, Phillip Susi wrote:
[snip]
>
> This doesn't directly address your issue, but I'd point out that if
> /boot were itself an lv instead of a normal partition, resizing it would
> be easy ;)
>
> Personally I just leave /boot on the root lv.
>

OTOH, you can never go wrong following the K.I.S.S. principle, 
especially when disks are so large that 30GB is less than 5% of 
capacity.  We use LVs for data directories only.

-- 
Dissent is patriotic, remember?
