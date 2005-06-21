Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5LGgfu26257
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 12:42:41 -0400
Received: from mrp.swissptt.ch (outmail2.swisscom.com [138.190.3.29])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5LGgEW2029963
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 12:42:25 -0400
Received: from mwdsp001.swissptt.ch (mwdsp001.swissptt.ch [10.221.40.203])
	by mrp.swissptt.ch with ESMTP id j5LGg8jM008318
	(using TLSv1/SSLv3 with cipher EDH-RSA-DES-CBC3-SHA (168 bits) verified
	NO)
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 18:42:08 +0200 (MEST)
Received: from mwdsp001 (localhost [127.0.0.1])
	by mwdsp001.swissptt.ch (8.12.11/8.12.11) with SMTP id j5LGg6kj016788
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 18:42:06 +0200
Date: Tue, 21 Jun 2005 18:42:06 +0200
From: Chris Osicki <osk@admin.swisscom-mobile.ch>
Subject: Re: [linux-lvm] sistina LVM  (RH 3 u5) & powerpath
Message-ID: <20050621184206.2c65a27b@mwdsp001>
In-Reply-To: <49F6903070D20C46AF90492D596749DB869B67@EXDKBA023.corp.novocorp.net>
References: <49F6903070D20C46AF90492D596749DB869B67@EXDKBA023.corp.novocorp.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 21 Jun 2005 11:46:27 +0200
"MOBU (Mohamed Ismail Bulale)" <mobu@nnit.com> wrote:

> Hi,
> 
> I am running Redhat Linux AS 3.0 update 5 med LVM1. I have connected the
> server to EMC SAN and it works fine. To make failover I need to install
> Powerpath, BUT it fails and the system corrupt.  

I have Redhat Linux AS 3.0 update 4 systems with PowerPath Version 4.3.1
installed and they work fine. 
How did it corrupt your system?

> Is there any
> workaround, where Sistina LVM1 and Powerpath ca co-exist the same
> filesystem. I have created vg00 for all filesystems except /boot.
> Therefore I can't remove LVM easly

You don't have to. PowerPath will not modify any I/O paths.

> 
> I appreciate your help.
> 
> Best regards,
> ___________________________
> 
> M. I. Bulale
> 
> 

Regards,
Chris
