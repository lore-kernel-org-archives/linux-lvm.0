Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j28F8on15158
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2005 10:08:50 -0500
Received: from nexredback-216-168-119-94.nexicom.net (vpn.triplepc.com
	[216.168.105.38] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j28F8iS6030293
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2005 10:08:44 -0500
Message-ID: <422DBFF2.6030400@mikebabcock.ca>
Date: Tue, 08 Mar 2005 10:08:34 -0500
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] hardware raid5 and lvm "recipe"
References: <FBBA14180DBE83499AC81277324251B0113181@jaxmsx01.nemours.org>
	<422CBA04.3000002@vilain.net>
In-Reply-To: <422CBA04.3000002@vilain.net>
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

Sam Vilain wrote:

> Seems like a good enough policy.  An alternative is to have a larger
> root, so that you can do LVM diagnostics without using a boot CD.  But
> using a standard vendor configuration means that you're going to surprise
> fewer admins that come along.


We use a 4GB root partition, 2GB swap partition and then the rest is a 
PV for LVM2.
-- 
Michael T. Babcock
