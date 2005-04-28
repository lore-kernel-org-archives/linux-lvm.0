Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3SE28O01351
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 10:02:08 -0400
Received: from nexredback-216-168-119-94.nexicom.net
	(nexredback-216-168-119-94.nexicom.net [216.168.119.94])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j3SE22IL021951
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 10:02:02 -0400
Message-ID: <4270ED4E.8090500@mikebabcock.ca>
Date: Thu, 28 Apr 2005 10:03:58 -0400
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] swap on LVM
References: <4270E3C4.1090408@nextra.ro>
In-Reply-To: <4270E3C4.1090408@nextra.ro>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, gimre@nextra.ro

Gergely Imre wrote:

>what about swap partitions on LVM? are there any known problems? can one
> put swap on a LV safely?
>  
>

I've had crashes directly attributable to Swap on LVM both LVM1 and LVM2.

I've stopped setting up machines like that as a result.
-- 
Michael T. Babcock
