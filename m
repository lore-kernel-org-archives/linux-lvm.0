Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l395Nle0013530
	for <linux-lvm@redhat.com>; Mon, 9 Apr 2007 01:23:47 -0400
Received: from smtp4.pacifier.net (smtp4.pacifier.net [64.255.237.174])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l395Niml009308
	for <linux-lvm@redhat.com>; Mon, 9 Apr 2007 01:23:44 -0400
Received: from bedroom.boskone (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp4.pacifier.net (Postfix) with ESMTP id 21EAE6A442
	for <linux-lvm@redhat.com>; Sun,  8 Apr 2007 22:23:44 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Date: Sun, 8 Apr 2007 22:23:41 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200704082223.42433.benscott@nwlink.com>
Subject: [linux-lvm] bug in lvs reporting -- version  2.02.07 Debian
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
To: linux-lvm@redhat.com

I have found a couple of times in testing that lvs will sometimes report the 
same logical volume 2 or more times when output options are used. It seems to 
happen with volumes that are a large percentage of the total group size. 
Below I give an example. Notice how "lvs" with no options works fine but with 
options doesn't.


~/benscott/myprog# vgs
  VG    #PV #LV #SN Attr   VSize   VFree
  test2   4   6   0 wz--n-  14.29G 328.00M
  vg1     2   1   0 wz--n- 147.18G   1.18G

~/benscott/myprog# lvs
  LV       VG    Attr   LSize    Origin Snap%  Move Log Copy%
  bigtest1 test2 -wi-a-  900.00M
  bigtest2 test2 -wi-a-  100.00M
  bigtest3 test2 -wi-a- 1000.00M
  bigtest4 test2 -wi-a-    1.27G
  bigtest5 test2 -wi-a- 1000.00M
  bigtest6 test2 -wi-a-    9.77G
  lv1      vg1   -wi-ao  146.00G

~/benscott/myprog# lvs  -o +stripes,stripesize
  LV       VG    Attr   LSize    Origin Snap%  Move Log Copy%  #Str Stripe
  bigtest1 test2 -wi-a-  900.00M                                  1     0
  bigtest2 test2 -wi-a-  100.00M                                  1     0
  bigtest3 test2 -wi-a- 1000.00M                                  1     0
  bigtest4 test2 -wi-a-    1.27G                                  1     0
  bigtest5 test2 -wi-a- 1000.00M                                  1     0
  bigtest6 test2 -wi-a-    9.77G                                  1     0
  bigtest6 test2 -wi-a-    9.77G                                  1     0
  bigtest6 test2 -wi-a-    9.77G                                  1     0
  bigtest6 test2 -wi-a-    9.77G                                  1     0
  lv1      vg1   -wi-ao  146.00G                                  2 32.00K

# lvs  --version
  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.7.0

These are the physical volumes involved:
  /dev/hdh1  test2 lvm2 a-   952.00M 328.00M
  /dev/hdh2  test2 lvm2 a-     1.39G      0
  /dev/hdh5  test2 lvm2 a-     7.18G      0
  /dev/hdh6  test2 lvm2 a-     4.79G      0
