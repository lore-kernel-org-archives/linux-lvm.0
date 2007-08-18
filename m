Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7IIO9X9004276
	for <linux-lvm@redhat.com>; Sat, 18 Aug 2007 14:24:09 -0400
Received: from smtp3.pacifier.net (smtp3.pacifier.net [64.255.237.173])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7IIO6jq001140
	for <linux-lvm@redhat.com>; Sat, 18 Aug 2007 14:24:06 -0400
Received: from bedroom.boskone (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp3.pacifier.net (Postfix) with ESMTP id 3AD856D7D8
	for <linux-lvm@redhat.com>; Sat, 18 Aug 2007 11:24:04 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Date: Sat, 18 Aug 2007 11:24:03 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708181124.03742.benscott@nwlink.com>
Subject: [linux-lvm] using lvconvert for mirroring
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

I have been playing with lvconvert but I can't quite figure out what it is 
doing.  If I start with this:

	Debian# lvs -o +devices
	  LV    VG   Attr   LSize Origin Snap%  Move Log Copy%  Devices
	  lvol0 vg1  -wima- 7.81G                               /dev/hde2(0)

Then run:

	Debian# lvconvert -m1 vg1/lvol0

I get this:

Debian# lvs -o +devices
	  LV    VG   Attr   LSize Origin Snap%  Move Log        Copy%  Devices                         
	  lvol0 vg1  mwima- 7.81G                    lvol0_mlog   2.75 lvol0_mimage_0			          
(0),lvol0_mimage_1(0)

So my first question is how do I find out where the mirror really is? I have 
also tried specifying the physical volume at the end of the command to put 
the mirror on a different pv but then I get this error message:

	Debian# lvconvert -m1 vg1/lvol0 /dev/hdg1
	  Not enough PVs with free space available for parallel allocation.
	  Consider --alloc anywhere if desperate.

Thank you for any insight.
