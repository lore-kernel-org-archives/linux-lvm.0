Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAEGKSvO001842
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2007 11:20:28 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAEGKRW9004567
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2007 11:20:27 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id lAEGKDPS006309
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2007 11:20:22 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id lAEGKDBJ031822
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2007 11:20:13 -0500
Date: Wed, 14 Nov 2007 11:20:13 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] beginner questions
In-Reply-To: <2a27434f0711131847h59985000n81645716d224398@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0711141102060.31565-100000@bmsred.bmsi.com>
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

On Wed, 14 Nov 2007, David Hansel wrote:

> May i know how stable LVM in AIX 5.3?

This is the linux LVM group, but I can assure you that LVM in AIX 4.3
is *very* stable.  You'll have to ask in an AIX group, but I suspect that
it is still very good.  As far as I'm concerned, AIX LVM is the one to 
beat for open source LVM.

> I wanna try to make a snapshot of LV to make a backup. Is the
> snapshot, mirroring features doing fine in AIX?

AIX 4.3 LVM didn't support snapshot, but mirroring (and striping) worked great,
(and are still working great).

Linux LVM got snapshots before mirroring/striping.  This was sensible because
mirroring/striping is available via the linux 'md' driver - albeit somewhat
kludgy compared to LE based LVM support.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
