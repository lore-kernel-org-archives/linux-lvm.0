Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2HDXAY07257
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2005 08:33:10 -0500
Received: from mta.sara.nl (mta.sara.nl [145.100.16.144])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2HDX3CF031666
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2005 08:33:04 -0500
Message-ID: <42398707.4070708@sara.nl>
Date: Thu, 17 Mar 2005 14:32:55 +0100
From: Walter de Jong <walter@sara.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060506020005070202070108"
Subject: [linux-lvm] lvcreate snap with device mapper
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------060506020005070202070108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

There is a funny problem with lvcreate. When you create a snap, it
assumes the second element in the supplied path is a volume group. This
is untrue when the device mapper is used, and it is untrue (obviously)
if symbolic links to the block device are used.
The text in the attachment demonstrates what I mean.

I think it's a bad thing to use path names for determining what volume
group has to be used.

This is on debian/sarge i386 with LVM2 2.01.04-2 and kernel 2.6.11 with
dm_mod.ko and dm_snapshot.ko loaded.

Greets,

     --Walter
-- 
                   *** If you build it, they will come ***

Walter de Jong
walter@sara.nl        http://www.sara.nl/
HPC Systems Programmer at SARA Computing and Network Services

People should be able to e-mail me, spambots should not.

--------------060506020005070202070108
Content-Type: text/plain;
 name="file.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="file.txt"

root# lvcreate -s -L 200g -n snap_home_lv /dev/mapper/sara_vg-home_lv
  Volume group "mapper" doesn't exist

root# lvcreate -s -L 200g -n snap_home_lv /dev/sara_vg/home_lv
  Logical volume "snap_home_lv" created

root# ls -l /dev/mapper/sara_vg-home_lv
brw-------  1 root root 254, 2 Mar  7 20:51 /dev/mapper/sara_vg-home_lv

root# ls -l /dev/sara_vg/home_lv
lrwxrwxrwx  1 root root 27 Mar 17 14:18 /dev/sara_vg/home_lv -> /dev/mapper/sara_vg-home_lv

root# ls -lL /dev/sara_vg/home_lv
brw-------  1 root root 254, 2 Mar  7 20:51 /dev/sara_vg/home_lv

root# ln -s /dev/sara_vg /dev/blah

root# lvcreate -s -L 200g -n snap_home_lv /dev/blah/home_lv
  Volume group "blah" doesn't exist


--------------060506020005070202070108--
