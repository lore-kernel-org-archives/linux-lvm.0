Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7MDWAa05419
	for <linux-lvm@redhat.com>; Sun, 22 Aug 2004 09:32:10 -0400
Received: from smtp004.mail.ukl.yahoo.com (smtp004.mail.ukl.yahoo.com
	[217.12.11.35])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i7MDW4Xn022663
	for <linux-lvm@redhat.com>; Sun, 22 Aug 2004 09:32:04 -0400
Received: from fras by localhost with local (Exim 3.36 #1 (Debian))
	id 1BysRy-0001xn-00
	for <linux-lvm@redhat.com>; Sun, 22 Aug 2004 15:31:58 +0200
Date: Sun, 22 Aug 2004 15:31:58 +0200
From: Fraser Pringle <fraserpringle@yahoo.co.uk>
Message-ID: <20040822133158.GB6714@localhost>
Mime-Version: 1.0
Content-Disposition: inline
Sender: Fraser Pringle <fraserpringle@yahoo.co.uk>
Subject: [linux-lvm] restore question
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I have a problem with using lvm and I'd be grateful for some advice.

I have a data volume group "datavg" on a mirrored raid partion that was running
fine until I experienced a system crash.  After the crash the /dev/md0
raid device was not recognised by the lvm system and neither was the
datavg.  After finding some advice on this list I ran the commands:

pvcreate /dev/md0
vgcfgrestore -n datavg /dev/md0
vgscan

to restore the datavg.  This seemed to work, however, the volume group
seems to have been restored to a point some time in the past, i.e. there
are many files missing.  I'm not too sure how this could have happend as
all the reading I've done seems to suggest that the vgcfgrestore command
should just have restored the configuration and not any data.  Have I
somehow restored a snapshot of the volume group?  Does anyone have any
suggestions as to how I might retrieve my data?

Any advice would be very welcome.

Regards,
Fraser

lvm version: 1.0.8-4
