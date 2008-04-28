Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SI36v2020392
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:03:06 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SI2tmC019542
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:02:55 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m3SI2osd005630
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:02:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m3SI2oPt000731
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 14:02:50 -0400
Date: Mon, 28 Apr 2008 14:02:50 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
In-Reply-To: <20080428170946.GB10409@IUPUI.Edu>
Message-ID: <Pine.LNX.4.44.0804281358160.32443-100000@bmsred.bmsi.com>
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

On Mon, 28 Apr 2008, Mark H. Wood wrote:

> If the box maker provides a diagnostic partition image, it goes in
> between '/boot' and '/'.

Yes, I wish more "box makers" did that.  Too many provide hardware diagnostics
that require Windows.  I don't care what OS the diagnostics use if they
actually *provide* a stripped down version of that OS in a diagnostic
partition (which thankfully a large discount "box maker" does).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
