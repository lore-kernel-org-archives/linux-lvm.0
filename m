Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CKtLi09974
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:55:21 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1CKtKb06501
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:55:20 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by percy.comedia.it (Postfix) with ESMTP id B350A34125
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 21:55:19 +0100 (CET)
Received: from percy.comedia.it ([127.0.0.1])
 by localhost (percy.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id 19797-04-2 for <linux-lvm@redhat.com>;
 Thu, 12 Feb 2004 21:55:18 +0100 (CET)
Received: from comedia.it (unknown [81.208.36.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by percy.comedia.it (Postfix) with ESMTP id C439A34115
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 21:55:18 +0100 (CET)
Message-ID: <402BE835.3020600@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: LVM2 on top of RAID1? (x86_64)
References: <20040212100955.3b79511c.kilpatds@oppositelock.org> <402BBAEF.8000508@comedia.it> <402BC89E.6020606@backtobasicsmgmt.com> <402BDCAB.5060202@comedia.it> <20040212201646.GC1898@reti>
In-Reply-To: <20040212201646.GC1898@reti>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 15:54:29 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Joe Thornber wrote:

> On Thu, Feb 12, 2004 at 09:06:03PM +0100, Luca Berra wrote:
> 
>>this won't help if the device is not yet opened by md
>>i posted a patch to this list that checks for an md superblock.
>>i am pushing for consideration of this approach.
> 
> 
> One of the problems with LVM1 was that there was far too much hard
> coded behaviour such as this.

This is a good point, but:
The current LVM2 behaviour is confusing for users that upgrade from 
2.4/lvm1 to 2.6/lvm2 so i would like to address it.
LVM2 already code already contains exceptions for MD devices.
since we have a configuration file we could add a configuration switch 
for ignoring devices with md superblocks (possibly defaulting to ignore, 
which is what users expect)


WDYT?

L.
