Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0SMCMO02117
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 17:12:22 -0500
Received: from angelica.rajraj.net (angelica.rajraj.net [212.112.184.248])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0SMCLh8013082
	for <linux-lvm@redhat.com>; Fri, 28 Jan 2005 17:12:21 -0500
Date: Fri, 28 Jan 2005 23:12:20 +0100
From: David =?iso-8859-1?Q?R=F6hr?= <david@rohr.se>
Message-ID: <20050128221220.GA14972@angelica.rajraj.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgcfgrestore after broken disk.
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have a three disk LVM vg-group and lv-filesystem. With two 120Gb and
one 60Gb. Using about 225Gb all together. Seems like my 60Gb disk has
totaly crashed and I've tried everything to get the remaining data off
the disks but nothing seems to work. Please, send me some light and say
that their is a way to save some of the data?

jasmin:/etc/lvm/archive# vgcfgrestore --debug -f fs_00001.vg fs
  /dev/hdc: read failed after 0 of 4096 at 0: Input/output error
  /dev/hdc: read failed after 0 of 4096 at 0: Input/output error
Couldn't find device with uuid 'aizHaQ-iAXy-yMqL-d2wM-RIRM-7oWl-50cLy4'.
Couldn't find all physical volumes for volume group fs.
Restore failed.
          
Can I reduce the "missing" disk and safe the data of the two disks
remaining some how? I can live with loosing a couple of Gb of data, but
not the entire 225Gb....

    LVM version:     2.00.32 (2004-12-22)
    Library version: 1.00.07-ioctl (2003-11-21)
    Driver version:  4.1.0

/d

-- 
If you want to program in C, program in C.  It's a nice language.  I
use it occasionally...   :-)
             -- Larry Wall in <7577@jpl-devvax.JPL.NASA.GOV>
