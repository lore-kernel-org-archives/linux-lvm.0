Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7L0XXbK025755
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 20:33:33 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7L0XWC1016634
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 20:33:32 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l7L0XQcl010529
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 20:33:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l7L0XQjn008254
	for <linux-lvm@redhat.com>; Mon, 20 Aug 2007 20:33:26 -0400
Date: Mon, 20 Aug 2007 20:33:26 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets.
	Good idea or not?
In-Reply-To: <20070723072320.GB30790@percy.comedia.it>
Message-ID: <Pine.LNX.4.44.0708202030010.8227-100000@bmsred.bmsi.com>
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

Ok, I just tested this with Centos-5.0, kernel-2.6.18-8.1.8.el5.
I shutdown with md1 50% resynced, and when it boots, it starts over
at the beginning.  Maybe we are talking about different things, but
it is a major annoyance that it restarts the sync from the beginning
if it misses just one update (e.g. unexpected power failure or reboot).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
