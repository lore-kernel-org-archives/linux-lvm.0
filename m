From: James Manning <jmm@sublogic.com>
Message-ID: <20020627140947.J2723@xanex.hippierage.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Re: [RFE] lvm-1.0.3 - progress bar similar to e2fsck for pvmove
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jun 27 13:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> James,
> 
> are you sure you didn't use the "-v" option of pvmove?
> 
> Without that option pvmove typically display 6-7 lines.
> With that option it displays some more information plus a line for
> every extent moved.

Yup - maybe verbose is triggered as an option in the warning
case of physical extents in an active vg?  here's the top few
lines from one such pvmove run.

[root@localhost root]# rpm -q lvm
lvm-1.0.3-5
[root@localhost root]# pvmove /dev/hda6
pvmove -- moving physical extents in active volume group "Volume00"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 352640, 0307 352640
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 360832, 0307 360832
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 369024, 0307 369024
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 377216, 0307 377216
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 385408, 0307 385408
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 393600, 0307 393600
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 401792, 0307 401792
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 409984, 0307 409984
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 418176, 0307 418176
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 426368, 0307 426368
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 434560, 0307 434560
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 442752, 0307 442752
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 450944, 0307 450944
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 459136, 0307 459136
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 467328, 0307 467328
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 475520, 0307 475520
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 483712, 0307 483712
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 491904, 0307 491904
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 500096, 0307 500096
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 508288, 0307 508288
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 516480, 0307 516480
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 524672, 0307 524672
/dev/Volume00/group::/dev/Volume00/LogVol00: 0306 532864, 0307 532864
[SNIP]
-- 
James Manning <http://www.sublogic.com/james/>
GPG Key fingerprint = B913 2FBD 14A9 CE18 B2B7  9C8E A0BF B026 EEBB F6E4
