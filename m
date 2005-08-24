Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7OMJjV04071
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 18:19:45 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7OMJbKG031779
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 18:19:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by nic-nac-project.de (Postfix) with ESMTP id 8620B1124002
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2005 00:19:33 +0200 (CEST)
Received: from nic-nac-project.de ([127.0.0.1])
	by localhost (nic-nac-project.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12318-08 for <linux-lvm@redhat.com>;
	Thu, 25 Aug 2005 00:18:18 +0200 (CEST)
Date: Thu, 25 Aug 2005 00:18:12 +0200
From: Thomas Schwinge <schwinge-lists-redhat.com-linux-lvm@nic-nac-project.de>
Subject: Re: [linux-lvm] using LVM PV as single disk ?
Message-ID: <20050824221811.GA4004@nic-nac-project.de>
References: <7AAD212492598A4A92463C3F5D34C54F0218C0@ccd3.CC.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7AAD212492598A4A92463C3F5D34C54F0218C0@ccd3.CC.de>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Aug 23, 2005 at 02:45:58PM +0200, Heinzmann, Robert wrote:
> we are using LVM2. We have one PV configured with one VG and one LV on top. We now want to migrate back to "non LVM" configuration. Is it possible to convert a LVM PV back to a regular disk that can be used like a normal disk ? 

Save the data, partition the disk, create filesystems, restore the data?

Converting directly is not possible AFAIK.


Regards,
 Thomas
