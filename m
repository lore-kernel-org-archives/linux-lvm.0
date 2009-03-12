Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2CFD9rt002807
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 11:13:09 -0400
Received: from exprod5og112.obsmtp.com (exprod5og112.obsmtp.com [64.18.0.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2CFClij027683
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 11:12:47 -0400
Received: from kipc2.localdomain (unknown [3.249.4.68])
	by mail-rly-prd-01.am.health.ge.com (Postfix) with ESMTP id BDF9C387E
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 15:10:55 +0000 (GMT)
Date: Thu, 12 Mar 2009 16:12:38 +0100
From: Karl Kiniger <karl.kiniger@med.ge.com>
Message-ID: <20090312151238.GA5816@kipc2.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] changing protection of lvm2 snapshot origin
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi,

I want to do the following:

* lvcreate -m test_lv -L 4G some_vg

* fill test_lv with a qemu disk image

* lvchange -p r some_vg/test_lv  --- I want to make sure that nobody
                                     will ever modify the (future) origin
                                     unintentionally.
* lvcreate -s -m test_lv_snap -L 1G some_vg/test_lv

* Use the some_vg/test_lv_snap  playing around with qemu, virtualbox, vmware.

Later I want to apply the snapshot contents to the origin -
preferably using the highly efficient dm-merge program (from this
mailing list) taking contents from the snapshot exception table.
    
Unfortunately lvchange does not  me to change the permissions if there
is an active snapshot. 
  
* lvchange -p rw some_vg/test_lv  --- I have to remove the snapshot
            first. For now  I have to copy the exception table contents
            elsewhere, remove test_lv_snap  and then I am able to apply
            the changes. It may be possible with an additional  dmsetup 
            mapping, I would like to avoid that.

So how to avoid the copy of the exception table contents ? 

-------------
PS: being able to save and re-apply an cow exception table is really
    convenient when playing around with bad software. I have hacked
    dm-merge to save a whole exception table to a disk file which can
    be also compressed for archiving purposes. A few hours work on
    e.g Windows XP (80 GB "disk") results in about  50..70 MB compressed
    exception table contents (of course depending on what you are doing).

    I am also planning to extend dm-merge to be able to save the 
    contents of a dm snapshot origin which is related to the snapshot
    exception table to a file in order to enable me to roll back the
    origin to a previous version. I have tried xdelta3 but found it to
    be highly inefficient in some cases.

Regards,

Karl
-- 
D.I. Karl Kiniger     mailto:karl.kiniger@med.ge.com
Tel: (++43) 7682-3800-710  Voip(GE): 1662 710
Fax: (++43) 7682-3800-47 C: +43 6991 3800 710
-
GE Medical Systems Kretztechnik GmbH & Co OHG - Tiefenbach 15 – A-4871 Zipf
Landesgericht Wels FN 222387s – UID (VAT-ID): ATU54086108 - DVR: 2111103 – ARA: 12816
Persönlich haftende Gesellschafterin: GE Medical Systems Kretztechnik GmbH
Tiefenbach 15 – A-4871 Zipf  - Landesgericht Wels FN 218689b
