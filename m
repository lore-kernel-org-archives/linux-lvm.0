Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8FGshGo004123
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 12:54:43 -0400
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mx1.redhat.com (Postfix) with ESMTPS id 299A83B3C7
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 16:54:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8FGsgU3002603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 09:54:42 -0700 (PDT)
Message-ID: <55F84D51.7070400@windriver.com>
Date: Tue, 15 Sep 2015 10:54:41 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <55F70C58.5010205@windriver.com>
	<55F71650.7070907@redhat.com>	<55F71D24.9010903@windriver.com>
	<55F7D9A8.5020005@redhat.com>
In-Reply-To: <55F7D9A8.5020005@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Any way to speed up activation of volumes with
	snapshots?
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

On 09/15/2015 02:41 AM, Zdenek Kabelac wrote:

> If you don't mind dropping existing snapshot and creating new 'old-snapshot' -
> using larger block size (i.e.  32K  (or even more) instead of 4K) may improve
> speed of disk reading noticeable (at the price of copying larger chunks when
> modifying disk blocks - depends on use-case)....

Okay, good info to have.

> And if you don't mind replacing your ancient kernel and trying some newer one -
> there have been some 'read' order improvement for this old-snapshot target made
> as well - so you may at least try if there will be any noticeable change
> (actually would be interesting just to get report how much faster it boots when
> you only exchange kernel for a boot - you don't have to use it - just measure
> boot speed)

This is essentially a custom distro, so changing just the kernel is a bit 
complicated.  However, I have a newer version that I want to test with which has 
a newer kernel but the same version of LVM, so that should give some good data.

Chris
