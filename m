Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CK67i23378
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:06:07 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1CK66b19147
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:06:06 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by percy.comedia.it (Postfix) with ESMTP id C597834125
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 21:06:05 +0100 (CET)
Received: from percy.comedia.it ([127.0.0.1])
 by localhost (percy.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id 19476-03-5 for <linux-lvm@redhat.com>;
 Thu, 12 Feb 2004 21:06:05 +0100 (CET)
Received: from comedia.it (unknown [81.208.36.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by percy.comedia.it (Postfix) with ESMTP id E419234115
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 21:06:04 +0100 (CET)
Message-ID: <402BDCAB.5060202@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: LVM2 on top of RAID1? (x86_64)
References: <20040212100955.3b79511c.kilpatds@oppositelock.org> <402BBAEF.8000508@comedia.it> <402BC89E.6020606@backtobasicsmgmt.com>
In-Reply-To: <402BC89E.6020606@backtobasicsmgmt.com>
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
Date: Thu Feb 12 15:05:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Kevin P. Fleming wrote:

> Luca Berra wrote:
> 
>> i still believe it would be better if lvm ignored md component devices 
>> completely.
> 
> 
> In kernel 2.6 land this is easy to do as well (for everything, not just 
> MD). When vgscan tries to open the device to read metadata, open it with 
> O_EXCL. If any other kernel subsystem is currently using the device, 
> then the open() will fail and vgscan can ignore the device.

this won't help if the device is not yet opened by md
i posted a patch to this list that checks for an md superblock.
i am pushing for consideration of this approach.

L.
