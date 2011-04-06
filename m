Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p36LqH0R027201
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 17:52:17 -0400
Received: from eastrmfepo102.cox.net (eastrmfepo102.cox.net [68.230.241.214])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p36LqCpO031498
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 17:52:13 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmfepo102.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110406215212.LAKX32426.eastrmfepo102.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 17:52:12 -0400
Message-ID: <4D9CE08C.2010202@cox.net>
Date: Wed, 06 Apr 2011 16:52:12 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <4D9A9E2A.7070106@diala.gl3> <1302079983.27047.454.camel@localhost>
	<4D9CDC03.9020507@omiha.com>
In-Reply-To: <4D9CDC03.9020507@omiha.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM corruption/diagnosis
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

On 04/06/2011 04:32 PM, Jan Bakuwel wrote:
[snip]
>
> I wouldn't know though what else could be using the LV and I am not
> aware of any methods to find out... any suggestions?
>

lsof is tool #1.

Then "fdisk /dev/d/d-xm.wxp".

The poke around to see if a networked fs like samba or nfs is serving 
the device.

As a last resort, you could always reboot the box.

-- 
"Neither the wisest constitution nor the wisest laws will secure
the liberty and happiness of a people whose manners are universally
corrupt."
Samuel Adams, essay in The Public Advertiser, 1749
