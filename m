Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4NBAxdC002712
	for <linux-lvm@redhat.com>; Mon, 23 May 2011 07:10:59 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4NBAvDx031627
	for <linux-lvm@redhat.com>; Mon, 23 May 2011 07:10:58 -0400
Received: from gtw.srd.co.uk ([82.69.77.54] helo=flexo.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1QOT2G-0002Jx-DN
	for linux-lvm@redhat.com; Mon, 23 May 2011 12:10:56 +0100
Message-ID: <4DDA40BA.1070107@ankh.org>
Date: Mon, 23 May 2011 12:10:50 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <1306017503.3487.1454529429@webmail.messagingengine.com>
	<alpine.LRH.2.00.1105222203440.22749@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1105222203440.22749@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM - Combining different hard drives with
 different specs ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Stuart D. Gathman wrote:
>
> Even for RAID, they don't have to match.  For RAID1, write speed will 
> follow the slowest drive.
Though combining lower and higher speed drives can increase the wear 
rate on the larger drive (that is atleast what we found when a 10k and 
15k had to be used in a mirror (due to spare drive availablity).

James
