Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04GhkvD016143
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:43:46 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04GhPWQ030378
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:43:25 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m04GhKt4003252
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:43:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m04GhK9K003361
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:43:20 -0500
Date: Fri, 4 Jan 2008 11:43:20 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] duplicating a snapshot volume
In-Reply-To: <C52F339D-8ECB-48F3-94A6-4345E7CE3764@omniti.com>
Message-ID: <Pine.LNX.4.44.0801041131460.2402-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 4 Jan 2008, Troy Hanson wrote:

> As an alternative, is there any way to duplicate (not snapshot) a  
> snapshot volume, i.e. so the new snapshot shares the same source and  
> accumulated differences as the original snapshot?

The device-mapper can certainly do it.  It is "just" a matter of
safely recording and setting up the mapping in userland.  You 
can probably do what you want with a script invoking /sbin/dmsetup.
But I'm not the guru to provide an example...

You can play around with 'ls', 'info', and 'table' subcommands to
see how device-mapper is programmed.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
