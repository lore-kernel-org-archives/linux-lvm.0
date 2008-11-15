Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAFCiRCr027613
	for <linux-lvm@redhat.com>; Sat, 15 Nov 2008 07:44:27 -0500
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAFCiDmb014348
	for <linux-lvm@redhat.com>; Sat, 15 Nov 2008 07:44:13 -0500
Received: by fg-out-1718.google.com with SMTP id e21so1486146fga.7
	for <linux-lvm@redhat.com>; Sat, 15 Nov 2008 04:44:12 -0800 (PST)
Message-ID: <b072968d0811150444v2e23a535p21dc41bb25d114d4@mail.gmail.com>
Date: Sat, 15 Nov 2008 12:44:12 +0000
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] Editing LVM 2 metadata
In-Reply-To: <309738.64869.qm@web38304.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <878853.96084.qm@web38301.mail.mud.yahoo.com>
	<20081115025515.GX30569@agk.fab.redhat.com>
	<309738.64869.qm@web38304.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

2008/11/15 Michael Jensen <beachhangar@yahoo.com>:
> The why is because I am attempting to use storage managed snapshots.  The
> storage can present the master volume and the snapshot as separate LUN's but
> they present identical contents in the header area (first 256 sectors...).
> So the effort is to modify the snapshot (doable with this storage) without
> altering the contents of the master volume.  Hopefully the snapshot with
> suitable edits to the UUID's would then pass vgscan test.

Its easiest if you follow the steps listed here:

https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html

--Dave
