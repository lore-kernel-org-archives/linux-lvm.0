Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6O1ihOZ007813
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 21:44:43 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6O1igft012722
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 21:44:42 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l6O1ibHB017846
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 21:44:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l6O1iaOo007365
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 21:44:36 -0400
Date: Mon, 23 Jul 2007 21:44:36 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets.
	Good idea or not?
In-Reply-To: <20070723072320.GB30790@percy.comedia.it>
Message-ID: <Pine.LNX.4.44.0707232143500.7330-100000@bmsred.bmsi.com>
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

On Mon, 23 Jul 2007, Luca Berra wrote:

> On Sun, Jul 22, 2007 at 02:57:33PM -0400, Stuart D. Gathman wrote:
> >The main drawback to md raid1 is that it always resynchronizes
> >the *entire* partition when a disk goes offline temporarily.  I also
> False. md uses bitmaps to avoid this.

The LVM mirroring uses bitmaps.  Are you sure md raid does?  Since what
version?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
