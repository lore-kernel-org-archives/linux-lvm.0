Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBJ6jLWb015175
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2006 01:45:21 -0500
Received: from web36104.mail.mud.yahoo.com (web36104.mail.mud.yahoo.com
	[66.163.179.218])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kBJ6jJar026209
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2006 01:45:20 -0500
Date: Mon, 18 Dec 2006 21:45:13 -0800 (PST)
From: Martin Fick <mogulguy@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <461895.53709.qm@web36104.mail.mud.yahoo.com>
Subject: [linux-lvm] pvmove broke my volumes
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
To: LVM <linux-lvm@redhat.com>

I hosed my vg yesterday with a failed pvmove.  Now on
boot, I see lots error messages in the system logs to
the tune of:

  device-mapper: mirror log: unrecognised sync
                 argument to mirror log: 2
   device-mapper: ioctl: error adding target to table
   device-mapper: table: device 254:0 too small for
                 target

one for each of my logical volumes.  mke2fs on one of
these volumes reports these errors:

  mke2fs 1.39 (29-May-2006)
  mke2fs: Device size reported to be zero.  Invalid   
          partition specified, or partition table
          wasn't reread after running fdisk, due to
          a modified partition being busy and in use. 
          You may need to reboot to re-read your
          partition table.

I am using debian unstable, with the following three
kernels:
 vmlinuz-2.6.17-1-vserver-686
 vmlinuz-2.6.18-3-vserver-686
 vmlinuz-2.6.17-1-686


-lvm version 2.02.06-3
-lvm-common 1.5.20

Any clues to how I can repair my volume group?

Thanks,

-Martin


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
