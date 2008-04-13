Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3D2Kj5B013537
	for <linux-lvm@redhat.com>; Sat, 12 Apr 2008 22:20:45 -0400
Received: from smtp4.pacifier.net (smtp4.pacifier.net [64.255.237.174])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3D2KXEL024702
	for <linux-lvm@redhat.com>; Sat, 12 Apr 2008 22:20:34 -0400
Received: from laptop1.local (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp4.pacifier.net (Postfix) with ESMTP id E50086A884
	for <linux-lvm@redhat.com>; Sat, 12 Apr 2008 19:20:32 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Date: Sat, 12 Apr 2008 19:20:25 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804121920.25946.benscott@nwlink.com>
Subject: [linux-lvm] removing mirror images
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

I posted this question about a week ago and received no
replies at all. Does anyone know the answer to this problem? 

The Problem:
I have a question about how to remove a mirror. On a test
set up I have the following mirrors:

  bedroom:~/kvpm# lvs --all --segments -o +devices
    LV               VG    Attr   #Str Type   SSize  Devices
    lvol0            trurg mwn-a-    3 mirror 23.68G lvol0_mimage_2  
(0),lvol0_mimage_1(0),lvol0_mimage_3(0)
    [lvol0_mimage_1] trurg iwi-ao    1 linear 23.68G /dev/hdg6(155008)
    [lvol0_mimage_2] trurg iwi-ao    1 linear 19.53G /dev/hde2(0)
    [lvol0_mimage_2] trurg iwi-ao    1 linear  4.15G /dev/hdg5(0)
    [lvol0_mimage_3] trurg iwi-ao    1 linear 23.68G /dev/hde3(0)
    [lvol0_mlog]     trurg lwn-ao    1 linear 64.00K /dev/hde1(0)


So to remove the mirror "[lvol0_mimage_1]" on /dev/hdg6
I do the following:

  bedroom:~/kvpm# lvconvert --mirrors -1 trurg/lvol0   /dev/hdg6
    Logical volume lvol0 converted.

  bedroom:~/kvpm# lvs --all --segments -o +devices
    LV               VG    Attr   #Str Type   SSize  Devices
    lvol0            trurg mwn-a-    2 mirror 23.68G lvol0_mimage_2
(0),lvol0_mimage_3(0)
    [lvol0_mimage_2] trurg iwi-ao    1 linear 19.53G /dev/hde2(0)
    [lvol0_mimage_2] trurg iwi-ao    1 linear  4.15G /dev/hdg5(0)
    [lvol0_mimage_3] trurg iwi-ao    1 linear 23.68G /dev/hde3(0)
    [lvol0_mlog]     trurg lwn-ao    1 linear 64.00K /dev/hde1(0)

And indeed it is gone. However when I do this:

  bedroom:~/kvpm# lvconvert --mirrors -1 trurg/lvol0   /dev/hde2
    No free extents on physical volume "/dev/hde2"
    No specified PVs have space available

Or this:

  bedroom:~/kvpm# lvconvert --mirrors -1 trurg/lvol0   /dev/hde2 /dev/hdg5
    No free extents on physical volume "/dev/hde2"
    No mirror images found using specified PVs.

So how do I delete a mirror that spans multiple segments? Wouldn't it make
sense to have a command such as:

  bedroom:~/kvpm# lvconvert --mirrors -1 trurg/lvol0  [lvol0_mimage_2]

Thank you for any help.
