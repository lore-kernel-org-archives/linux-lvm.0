Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6SEbMa19689
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 10:37:22 -0400
Received: from smtp105.mail.sc5.yahoo.com (smtp105.mail.sc5.yahoo.com
	[66.163.169.225])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i6SEbKe1011630
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 10:37:20 -0400
Sender: frank@redhat.com
Message-ID: <4107BA18.85D5C3FB@yahoo.de>
Date: Wed, 28 Jul 2004 16:37:12 +0200
From: Frank Mohr <f_mohr@yahoo.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan fails
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAAQZxya94dvkqtUf+cYXluYwEAAAAA@EchoHome.org>
Content-Transfer-Encoding: 7bit
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
To: Erik@echohome.org, LVM general discussion and development <linux-lvm@redhat.com>

"Erik Ch. Ohrnberger" wrote:
> 
> Frank,
>         Sounds like you and me are in similar situations.  I lost my
> partition tables on a reboot - no idea why, and I'd also like to recover my
> data (I've not written to the disks, other than to restore the partician
> tables).  Below is a summary of my experiences.  I ended up using a borrowed
> R-Studio and only recovered 38 GB of 170 GB or so.  I'd like to be able to
> recover more if possible.
> 
>         Erik.

my problem seem to be some strange currupted LVM configuration on the
disks.
Partition table is OK, 
Most output of LVM tools seems OK

only 

pvscan crashes
vgimport complains that all 3 PV's are in different VG's (PVdata shows
the same VG UUID and VG name)

Frank
