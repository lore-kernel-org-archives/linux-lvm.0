Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kADHiVoi032275
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 12:44:31 -0500
Received: from web51001.mail.yahoo.com (web51001.mail.yahoo.com
	[206.190.38.132])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kADHiTfI013288
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 12:44:29 -0500
Message-ID: <20061113174423.29268.qmail@web51001.mail.yahoo.com>
Date: Mon, 13 Nov 2006 09:44:22 -0800 (PST)
From: Richard Mollel <unixtipz@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] my PV's disappearing
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

For some unknown reasons...my LVM PV's which have
worked for several years are dropping!
Here is one example....the node is still up, the
partition usable...but pvscan/pvdisplay don't display
anything. 
I know if i reboot, i wont be able to access this
partition anymore! It has happened to one filesystem
already. Any ideas what is going on here?

/dev/sdb1: unknown volume type
/dev/sdc1: unknown volume type
/dev/sdd1: unknown volume type
  No physical volume label read from /dev/sdb1
  Failed to read physical volume "/dev/sdb1"
  No physical volume label read from /dev/sdc1
  Failed to read physical volume "/dev/sdc1"
  No physical volume label read from /dev/sdd1
  Failed to read physical volume "/dev/sdd1"

Well, before i finished typing this message...the node
locked up (un-related issue) and upon reboot...it does
not find any PV's, thus VG's and LV's.

I followed a recovery procedure from
http://codeworks.gnomedia.com/archives/2005/general/lvm_recovery/
on a 5TB reiserfs filesystem...and the FS is still
hosed, with --rebuild-tree failing. I will post a
separate email for that. Now i am wondering how to
recover this one successfully...and also, why is it
happening? i have another node, that is still up, with
same symptoms..i know as soon as i reboot, it wont
work.

_Thanks

Rick...


 
____________________________________________________________________________________
Want to start your own business?
Learn how on Yahoo! Small Business.
http://smallbusiness.yahoo.com/r-index
