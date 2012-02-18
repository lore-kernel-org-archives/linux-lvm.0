Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1IEwtKW030765
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2012 09:58:55 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1IEwsaD030018
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2012 09:58:54 -0500
Received: by eaah12 with SMTP id h12so1713239eaa.33
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2012 06:58:53 -0800 (PST)
Message-ID: <4F3FBCA6.3050909@googlemail.com>
Date: Sat, 18 Feb 2012 15:58:46 +0100
From: Oliver Mangold <o.mangold@googlemail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060409010507060408000704"
Subject: [linux-lvm] fsadm bug
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------060409010507060408000704
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I would like to report a bug in the fsadm script.

Trying to resize a filesystem which has a device name that is equal to 
the beginning of another mounted device (which of course can happen with 
the devices in /dev/mapper created for lvm) fails for me. The script 
complains that the filesystem is mounted (even if it is not), then tries 
to unmount *the other* filesystem (which can fail, of course). E.g. you 
want to resize a filesystem with the name /dev/mapper/foobar but there 
another filesystem mounted somewhere from the device /dev/mapper/foo the 
problem appears.

Reason is that the device path is simply grepped from /proc/mounts 
without checking that the matched string is the whole device path. I 
attached a quick fix which solved the problem for me, but imho it does 
not fix all potential issues here. The device path is used unmodified as 
a regexp and also it is not checked if the match is in the correct 
column of the line.

Best,

Oliver

--------------060409010507060408000704
Content-Type: text/x-patch;
 name="fsadm_fix.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fsadm_fix.diff"

203c203
< 	MOUNTED=$("$GREP" ^"$VOLUME" "$PROCMOUNTS")
---
> 	MOUNTED=$("$GREP" ^"$VOLUME[ \t]" "$PROCMOUNTS")
206c206
< 	test -z "$MOUNTED" && MOUNTED=$("$GREP" ^"$RVOLUME" "$PROCMOUNTS")
---
> 	test -z "$MOUNTED" && MOUNTED=$("$GREP" ^"$RVOLUME[ \t]" "$PROCMOUNTS")
210a211
> 
215,216c216,217
< 		MOUNTED=$(LANG=C "$MOUNT" | "$GREP" ^"$VOLUME")
< 		test -z "$MOUNTED" && MOUNTED=$(LANG=C "$MOUNT" | "$GREP" ^"$RVOLUME")
---
> 		MOUNTED=$(LANG=C "$MOUNT" | "$GREP" ^"$VOLUME[ \t]")
> 		test -z "$MOUNTED" && MOUNTED=$(LANG=C "$MOUNT" | "$GREP" ^"$RVOLUME[ \t]")

--------------060409010507060408000704--
