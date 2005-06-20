Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KE8ru18463
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 10:08:53 -0400
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
	[80.67.18.15])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KE8m8b019584
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 10:08:53 -0400
Received: from unknown (HELO [192.168.0.9]) (982928@[217.2.5.8])
	(envelope-sender <lists@anderedomain.de>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 20 Jun 2005 14:08:38 -0000
Mime-Version: 1.0 (Apple Message framework v622)
In-Reply-To: <1119275366.25392.48.camel@volt>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<1119275366.25392.48.camel@volt>
Message-Id: <d45c7b521930741fc78fef25d061f74b@anderedomain.de>
Content-Transfer-Encoding: 7bit
From: Philipp Riegger <lists@anderedomain.de>
Subject: Re: [linux-lvm] Is LVM safe?
Date: Mon, 20 Jun 2005 16:09:10 +0200
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

On 20. Jun 2005, at 15:49 Uhr, John Rowe wrote:

> If I have a Physical Volume which is the only Physical Volume in a
> Volume Group, can I always recover the recover the Volume Group if I
> have absolutely nothing else just like I can with an ext3 partition?

Yes, it's easy. You just need a kernel with DM-Support and the 
LVM2-Tools.

A simple

vgscan
vgchangs -ay

And you have your "Partitions" back.
