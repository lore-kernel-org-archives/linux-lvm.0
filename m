Received: from mx2.redhat.com (ext-mx01.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.1])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r78EtMxN027342
	for <linux-lvm@redhat.com>; Thu, 8 Aug 2013 10:55:22 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx2.redhat.com (8.14.4/8.14.4) with ESMTP id r78EtJQG000805
	for <linux-lvm@redhat.com>; Thu, 8 Aug 2013 10:55:20 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1V7RNj-0007VT-J5
	for linux-lvm@redhat.com; Thu, 08 Aug 2013 16:40:03 +0200
Received: from 202.3.120.9 ([202.3.120.9])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 08 Aug 2013 16:40:03 +0200
Received: from rsarraf by 202.3.120.9 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 08 Aug 2013 16:40:03 +0200
From: Ritesh Raj Sarraf <rsarraf@netapp.com>
Date: Thu, 08 Aug 2013 19:03:09 +0530
Message-ID: <52039E15.10908@netapp.com>
References: <20130806173719.GB15184@mail.waldi.eu.org>
	<52020FD1.2000004@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <52020FD1.2000004@redhat.com>
Subject: Re: [linux-lvm] Missing error handling in lv_snapshot_remove
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: "Sarraf, Ritesh" <Ritesh.Sarraf@netapp.com>

Hello Zdenek,

On Wednesday 07 August 2013 02:43 PM, Zdenek Kabelac wrote:
> 
> You are breaking the lvm2 logic thus pushing the code to go
> through unexpected error code path - user is never supposed to open
> so called 'private' /dev/mapper/ devices.

Just checking if this applies to other device types of DM, or just LVM?

We recommend our users to rely on /dev/mapper/* Multipath Devices, as
_persistent_ ones.

We also recommend to pvcreate on top of /dev/mapper/* Multipath Devices.
