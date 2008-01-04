Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04GUX0l006642
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:30:33 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04GUCqF022299
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:30:12 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m04GU7KY002665
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:30:07 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m04GU7mn003246
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:30:07 -0500
Date: Fri, 4 Jan 2008 11:30:07 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How to 'copy' a volume?
In-Reply-To: <477E5B9E.1030605@soe.ucsc.edu>
Message-ID: <Pine.LNX.4.44.0801041117060.2402-100000@bmsred.bmsi.com>
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

On Fri, 4 Jan 2008, Erich Weiler wrote:

> # lvcreate -L 500G -n clone volgroup00
> # dd if=/dev/volgroup00/original of=/dev/volgroup00/clone
> 
> The machine then had a kernel panic (I think).  I'm remote so I'm not 
> sure, but I'll be going in soon to check on it.  Not a critical system 
> so no big deal.  I'll let everyone one what I see at the console.

Could be very slow.  On one of my systems, a blocksize of 300k is optimal.
The default block size is usually 512 bytes.

# dd if=/dev/volgroup00/original of=/dev/volgroup00/clone bs=300k

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
