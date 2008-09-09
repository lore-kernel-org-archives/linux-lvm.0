Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m89LqeCA005676
	for <linux-lvm@redhat.com>; Tue, 9 Sep 2008 17:52:41 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m89LqUHc029233
	for <linux-lvm@redhat.com>; Tue, 9 Sep 2008 17:52:30 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m89LqUlM015414
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 9 Sep 2008 17:52:30 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.13.8/8.13.8) with ESMTP id m89LqT2A009260
	for <linux-lvm@redhat.com>; Tue, 9 Sep 2008 17:52:29 -0400
Date: Tue, 9 Sep 2008 17:52:29 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.64.0809091745520.9164@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Deactivating missing VG
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
To: linux-lvm@redhat.com

I have a volume group on removable media: backvg3 Normally, I run 
"vgchange -an backvg3" before removing the media.  However, today the 
customer removed the media to an offsite location for safekeeping before I 
could do the vgchange.  This shouldn't be a big problem, because the 
filesystem was mounted read-only (a precaution against exactly this 
occurence).

However, I can't get rid of the VG.

# vgchange -an backvg3
  /dev/backvg3/backup: read failed after 0 of 4096 at 0: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 214748299264: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 214748356608: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 0: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 4096: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 0: Input/output error
  Volume group "backvg3" not found
# vgreduce  -v --removemissing backvg3 
    Finding volume group "backvg3"
  /dev/backvg3/backup: read failed after 0 of 4096 at 0: Input/output error
    Wiping cache of LVM-capable devices
  /dev/backvg3/backup: read failed after 0 of 4096 at 214748299264: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 214748356608: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 0: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 4096: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 0: Input/output error
  /dev/backvg3/backup: read failed after 0 of 4096 at 0: Input/output error
  Volume group "backvg3" not found

The physical device, /dev/sdc, is gone.  What should I do?  If I leave it
until the media is brought back, is it safe to reattach?  What if it does
not reattach at the same SCSI disk (say /dev/sde instead)?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
