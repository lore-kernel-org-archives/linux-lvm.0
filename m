Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j223RGK19119
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 22:27:16 -0500
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j223RA1X022058
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 22:27:10 -0500
Received: from echo (echo.echohome.org [192.168.2.254])
	by server.echohome.org (8.12.8/8.12.8) with ESMTP id j223Qweh009621
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 22:26:59 -0500
From: "Erik Ohrnberger" <erik@echohome.org>
Subject: RE: [linux-lvm] Building up a RAID5 LVM home server (long)
Date: Tue, 1 Mar 2005 22:27:29 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAADVBIY9BxK0+ae0nwI98IewEAAAAA@echohome.org>
MIME-Version: 1.0
In-Reply-To: <4224DCE5.1010202@theserrs.net>
Content-Transfer-Encoding: 8bit
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>


... SNIP ...
> >What if the I broke everything into 10 GB pieces, and 
> created multiple 
> >raid5 sets?  Then I could LVM2 them together and have a large 
> >filesystem that way.
> >
> >a=20GB, b=30GB, c=40GB
> >
> >a-1 + b-1 + c-1 = md0 (approx 30 GB storage)
> >a-2 + b-2 + c-2 = md1 (approx 30 GB storage)
> >      b-3 + c-3 = md2 (waiting for one more drive)
> >            c-4 = md3 (waiting for two more drives)
> >  
> >
> This is sorta what I do.  But in my opinion the gain of having RAID5 
> (over RAID1) is when you get over 3 disks...  at 3 disks you 
> are burning 
> 33% for redudnacy... 25% or 20% or  17% sounds better to me.  
> I guess if 
> you go too far it costs in calculating the parity.

Overhead: Yea, OK. Nothing is without a price.
I fooled around with various ideas, and came up with this for my
particulars:
(Note, rounded to nearest GB)

80 GB	/dev/hda	60 GB /dev/hdb	40 GB	/dev/hdc	45 GB
/dev/hdd

GB		/dev/md0 (RAID0)
40		/dev/hdc
15		/dev/hda1
55		
		
		/dev/md1 (RAID0)
45		/dev/hdd
10		/dev/hda2
55		
		
		/dev/md2 (RAID5)
55		/dev/md0
55		/dev/md1
55		/dev/hda3
55		/dev/hdb
220

Yea, OK, so like the 220 is a bit optimistic, but should get pretty close to
that.

What do you think?
