Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6JBjiV23232
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 07:45:44 -0400
Received: from server193.fourx.de (server193-fourx.de [81.169.177.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6JBjbDQ012781
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 07:45:38 -0400
Received: from [192.168.1.100] (e178086047.adsl.alicedsl.de [85.178.86.47])
	by server193.fourx.de (Postfix) with ESMTP id 070285EC003
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 13:45:25 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v733)
In-Reply-To: <42DCB9A9.4050404@francetelecom.com>
References: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
	<42DCB9A9.4050404@francetelecom.com>
Message-Id: <D909C659-94DB-4445-ADDF-9F1EA983F8D5@kitchhiking.org>
Content-Transfer-Encoding: 7bit
From: Constantin Mercier <admin@kitchhiking.org>
Subject: Re: [linux-lvm] solved: lvm lost after reboot !?
Date: Tue, 19 Jul 2005 13:46:49 +0200
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

Hi Alan, hi Nicolas

first of all thanks for your time & effort.

I finally 'solved' the problem by upgrading to LVM2, which I did not
dare before since I could not oversee possible consequences
for my filesystem.

The upgrade went flawlessly, all PVs/VGs/LVs returned without
any further action on my side.

And sorry to all of you for the disconcertment I caused the last
two days.

But I still feel that lots of valuable knowledge concerning LVM is
pretty much distributed over the net. I think I'll set up something
like an LVM Wiki shortly.

Anyway,
thanks again!

Regards,
Constantin
