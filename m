Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4GD24kA029582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 May 2016 09:02:05 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D8F881109
	for <linux-lvm@redhat.com>; Mon, 16 May 2016 13:02:02 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 1CE937FC87
	for <linux-lvm@redhat.com>; Mon, 16 May 2016 15:01:59 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 16 May 2016 15:01:59 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <5739B848.3060505@redhat.com>
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com>
Message-ID: <119b520d472b019ced48357eff9fb389@dds.nl>
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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

Zdenek Kabelac schreef op 16-05-2016 14:08:

> Hi
> 
> Well yeah - ATM we rather take 'early' action and try to stop any user
> on overfill thin-pool.

May I inquire into whether this is only available in newer versions atm?

These are my versions (lvs --version):

   LVM version:     2.02.133(2) (2015-10-30)
   Library version: 1.02.110 (2015-10-30)
   Driver version:  4.34.0

I have noticed that on my current system the entire system will 
basically freeze on overfill.

I wonder if I should take measures to upgrade to something newer if I 
want to prevent this.

Regards,

X.
