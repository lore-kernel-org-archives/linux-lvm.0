Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3DFHUj02114
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2004 11:17:30 -0400
Received: from mx2.nwlehighsd.org (ns1.nwlehighsd.org [209.50.139.56])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3DFHTu6029337
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2004 11:17:30 -0400
Received: from amavis by mx2.nwlehighsd.org with scanned-ok (Exim 3.35 #1
	(Debian)) id 1BDPf9-0005wD-00
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2004 11:17:23 -0400
Received: from mx2.nwlehighsd.org ([127.0.0.1])
	by localhost (oddprocess [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21837-08 for <linux-lvm@redhat.com>;
	Tue, 13 Apr 2004 11:17:23 -0400 (EDT)
Received: from matt by mx2.nwlehighsd.org with local (Exim 3.35 #1 (Debian))
	id 1BDPf9-0005w6-00
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2004 11:17:23 -0400
Date: Tue, 13 Apr 2004 11:17:23 -0400
From: Matthew Daubenspeck <matt@oddprocess.org>
Message-ID: <20040413151723.GB19598@oddprocess.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] quota command does not work
Reply-To: matt@oddprocess.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I am using lvm2 with the following logical volume:

  --- Logical volume ---
  LV Name                /dev/nwlsd_vg/nwlsd_lv
  VG Name                nwlsd_vg
  LV UUID                jKXS7Q-2Bda-JpVG-Ba4I-Ocfr-6UyO-182Mek
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                55.91 GB
  Current LE             14312
  Segments               2
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:0

I am trying to get quota's working on the system. The quotas themselves
are working, however, standard users cannot issue the quota command to
inspect their own specific information:

$ quota
quota: Can't stat() mounted device /dev/nwlsd_vg/nwlsd_lv: Permission
denied
Disk quotas for user mellofone (uid 1000): none

However, it does work for root:

$ quota mellofone
Disk quotas for user mellofone (uid 1000): 
     Filesystem  blocks   quota   limit   grace   files   quota   limit   grace
/dev/nwlsd_vg/nwlsd_lv
                19364268*      0  100000            2019       0       0    0

This setup works on other volumes that do not use lvm. Any ideas what I
screwed up? Just as an FYI:

$ lvm version
  LVM version:     2.00.09 (2004-03-31)
  Library version: 1.00.08-ioctl (2004-02-27)
  Driver version:  4.1.0

Thanks.
-- 
  Matthew Daubenspeck
  http://www.oddprocess.org

11:09:30 up 23 days, 1:21, 1 user, load average: 0.02, 0.03, 0.00
