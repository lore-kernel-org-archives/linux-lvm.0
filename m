Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 650736A036
	for <linux-lvm@redhat.com>; Fri,  2 Feb 2018 02:59:41 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C323428205
	for <linux-lvm@redhat.com>; Fri,  2 Feb 2018 02:59:39 +0000 (UTC)
Received: from [192.168.1.173] (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 8E4EF5FBED
	for <linux-lvm@redhat.com>; Thu,  1 Feb 2018 21:49:59 -0500 (EST)
From: John Stoffel <john@stoffel.org>
Mime-Version: 1.0 (1.0)
Date: Thu, 1 Feb 2018 21:49:58 -0500
Message-Id: <A65313D2-8BFF-4B78-97C5-4FDEFE29AFBF@stoffel.org>
References: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
In-Reply-To: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Saying goodbye to LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

If you think zfs will be the answer... then good luck.  So where did a new PV come from that had the same UUID as the existing ones?  Basically the more details you give... then we can try to help.

But in any case, good luck.

Sent from my iPhone

> On Feb 1, 2018, at 11:45 AM, Xen <list@xenhideout.nl> wrote:
> 
> You are probably happy about this, but...
> 
> I managed to get LVM to corrupt my data on Ubuntu Xenial 3 times now.
> 
> All of that is related to:
> 
> - LVM not checking or behaving correctly when a duplicate PV appears
> - LVM not checking or behaving correctly when a cache volume is out of sync with its origin.
> 
> In addition the thin DM target of kernel 3.x was so buggy I couldn't compile anything big without the system hanging.
> 
> I will probably become a ZFS user.
> 
> Goodbye, and thanks for all the fish.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
