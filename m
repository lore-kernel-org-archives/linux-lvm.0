Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i24Jeg809697
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2004 14:40:42 -0500
Received: from mail.riseup.net (mail.riseup.net [216.162.217.191])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i24Jefb14726
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2004 14:40:41 -0500
Received: from pond (adsl-68-73-124-153.dsl.emhril.ameritech.net [68.73.124.153])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by mail.riseup.net (Postfix) with ESMTP id A227770E9E
	for <linux-lvm@redhat.com>; Thu,  4 Mar 2004 11:40:36 -0800 (PST)
From: Micah Anderson <micah@riseup.net>
Subject: Re: [linux-lvm] ERROR: VGDA in kernel and lvmtab are NOT consistent
Message-ID: <20040304194030.GN10460@riseup.net>
References: <20040227233731.GO19709@riseup.net> <20040303061200.GU10460@riseup.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040303061200.GU10460@riseup.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar  4 14:39:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I believe that this happened because I did a vgrename on my volume
group and I am running a raid mirrored set beneath it. I broke the
mirror, zeroed out the disks one by one and resync'd the mirror, now
things are back to normal.

micah
