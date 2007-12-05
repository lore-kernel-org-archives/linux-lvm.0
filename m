Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB5Empxu017130
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 09:48:51 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB5EmVqt027164
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 09:48:31 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id lB5EmQ1B018100
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 09:48:26 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id lB5EmPUJ022104
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 09:48:25 -0500
Date: Wed, 5 Dec 2007 09:48:25 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] moving a logical volume between servers
In-Reply-To: <200712050311.WAA26761@out-of-band.media.mit.edu>
Message-ID: <Pine.LNX.4.44.0712050946001.22070-100000@bmsred.bmsi.com>
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

On Tue, 4 Dec 2007 f-lvm@media.mit.edu wrote:

> Not being able to write-lock disks means I've had to be very, very
> careful in a number of situations when I wished I didn't have to worry
> so much about shooting myself in the foot.

For IDE drives, hdparm -r will set the readonly flag for the entire
drive.  I'm not sure if SATA has a similar feature.  But as you say,
in a number of situations, a hardware jumper is better.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
