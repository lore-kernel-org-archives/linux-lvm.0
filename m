Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4QHQnO03102
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 13:26:49 -0400
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4QHQhns023347
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 13:26:43 -0400
Message-ID: <429606D1.7040106@hp.com>
Date: Thu, 26 May 2005 13:26:41 -0400
From: Howard Rifkin <howard.rifkin@hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Daemon or Thread with 5 minute interval
References: <4295B7F7.9060802@hp.com> <d74ged$ueo$1@sea.gmane.org>
In-Reply-To: <d74ged$ueo$1@sea.gmane.org>
Content-Transfer-Encoding: 7bit
Reply-To: howard.rifkin@hp.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, bill.mair@web.de


We do have the right kernel support for our didsks. But, you do not need 
a lot of CPU activity to generate noise. Just enough to disrupt the 
cashe. Does kupdated run every 5 minutes? If so it could still be the 
culprit.

Thanks

Howard


Bill Mair wrote:
> Howard Rifkin wrote:
> 
>>  So, my question is does anyone know of a
>> kernel thread or daemon in the 2.4 kernel that wakes up every 5 minutes?
> 
> 
> [kupdated] can cause massive CPU load if your kernel does not have the 
> IDE chipset support for your system. I think it flushed any data in the HD
> buffers to disk and if the chipset support isn't there, then the main 
> CPU has
> to do this using PIO.
> 
> -- 
> Bill
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
