Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5KZ7D2005225
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:35:07 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5KZ6bc028142
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:35:07 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5KZ60w030925
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:35:06 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5KZ6Uj014707
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 15:35:06 -0500
Date: Thu, 5 Nov 2009 15:35:06 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
In-Reply-To: <896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com>
Message-ID: <Pine.LNX.4.64.0911051533390.14681@bmsred.bmsi.com>
References: <1257433818.17792.30@raydesk1.bettercgi.com>
	<E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com>
	<1257436528.17792.32@raydesk1.bettercgi.com>
	<896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com>
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

On Thu, 5 Nov 2009, Adam Mooz wrote:

> That is correct.  All drives are part of 'fileshare/lv_fileshare', which only
> has 400GB of data on it at the moment; which I can see reflected in the PFREE
> columns of the PVS output.  Is there an easy way to force the LVM to rescan
> it's allocation unit or would I have to remove the drives and re-insert them
> into the LVM?

Think of LVM as a kind of local SAN.  LVs are "virtual disks".  You allocated
a 2TB virtual disk called /dev/fileshare/lv_fileshare.  Disk drives don't
know anything about filesystems that use them.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
