Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAENgW63029810
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 18:42:32 -0500
Received: from web51015.mail.yahoo.com (web51015.mail.yahoo.com
	[206.190.39.80])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kAENgUPX009577
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 18:42:30 -0500
Date: Tue, 14 Nov 2006 15:42:24 -0800 (PST)
From: Richard Mollel <unixtipz@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <34984.18505.qm@web51015.mail.yahoo.com>
Subject: [linux-lvm] No label detected
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

Hi,

Mandriva 2006.0
Kernel 2.6.12-24
lvm2-2.01.09-1mdk

LVM installed on whole devices, /dev/sdb, sdc and sdd.
It has worked for over 2 years. Not sure if something
in Mandriva regular update changed anything
related....but now, upon reboot, the whole devices are
seen as PV's. I have to run losetup (set them up as
loop devices basically) then vgscan,pvscan,lvmdiskscan
can see them, and i can mount my VG. What actually
controls pvscan/vgscan commands?

/dev/sdb1: No label detected
/dev/sdc1: No label detected
/dev/sdd1: No label detected
      Locking /var/lock/lvm/V_ASSIM_VG RB
Finding volume group "ASSIM_VG"
  /dev/loop0: lvm2 label detected
  /dev/loop1: lvm2 label detected
  /dev/loop2: lvm2 label detected

_Thanks

Richard


 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
