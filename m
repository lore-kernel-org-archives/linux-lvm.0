Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j310OOO16580
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 19:24:24 -0500
Received: from seeker3.pacific.net.ph (seeker3.pacific.net.ph [210.23.235.106])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j310OIGZ012708
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2005 19:24:18 -0500
Received: from congo2.pacific.net.ph (congo2.pacific.net.ph [210.23.235.89])
	by seeker3.pacific.net.ph with ESMTP
	id j310OGgB011170 for <linux-lvm@redhat.com>;
	Fri, 1 Apr 2005 08:24:16 +0800
Received: from [210.1.105.173] (ppp173.dyn1.105.pacific.net.ph [210.1.105.173]
	(may be forged)) by congo2.pacific.net.ph with ESMTP
	id j310OELh008602 for <linux-lvm@redhat.com>;
	Fri, 1 Apr 2005 08:24:15 +0800 (PHT)
Message-ID: <424CA0D1.5060905@nospam.com>
Date: Fri, 01 Apr 2005 09:16:01 +0800
From: Andy Sy <andy@nospam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Reply-To: andy@neotitans.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Luca Berra wrote:

> no, [lvm partition detection and activation] is a user space
> task, there is no reason to burden the kernel with this.

I find that a spurious argument.  The kernel autodetects physical
partitions, so how is that different from detecting logical ones?
From the user's point of view he would want it to happen the
same way.  In fact, given the flexibility and [purported] negligible
overhead of logical volumes, he should not even be bothering
with physical partitions anymore.


-- 
reply-to: a n d y @ n e o t i t a n s . c o m
