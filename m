Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2IAXtj19930
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 05:33:55 -0500
Message-ID: <OF8332408E.0F643C1C-ONC1256E5B.00364305-C1256E5B.003A0263@provinzial.de>
From: m.klaeschen@provinzial.de
Date: Thu, 18 Mar 2004 11:33:36 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] quiescing physical volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com





Hallo

we would like to back up LVM managed volumes without using snapshot
features. Background is that we have quite a couple of disk which we do not
want to double to have a snapshot device.

We run Linux for zSeries next to some z/OS systems on IBM 2064 machines in
LPAR mode. Linux data is stored on 3390-9 DASD in CDL Format (i.e. ECKD).
We use LVM to build logical volumes from DASD devices. In that logical
volumes ReiserFS is established as filesystem.

The DASD volumes for Linux are also accessable from other LPARs, so we are
(at least in a technical way) able to back up Linux data onto tape
catridges using z/OS ADRDSSU. Main problem is that ADRDSSU does not take
care about delayed writes to physical volumes. So filesystem are to be
mounted read only to back it up properly.

A way z/OS Unix filesystem zFS deals with this issue is called quiescing
r/w mounted filesystems. Before an ADRDSSU full volume dump is processed,
all activity on the zFS VSAM linar data sets (which might be compared to as
a physical volume) is going to be drained and new requests will be
suspended. Next step after ADRDSSU dump is to unquiesce the zFS filesystem,
i.e. I/O operation to VSAM will continue.

Main benefit is that all filesystem operations from applications can
continue since quiescing is invisible for users - apart from some delay of
response time.

Is there a way to use such a proceeding with Linux LVM managed DASD?

Kind regards
Michael Kl�schen
-----------------------------------------------------------------------
Provinzial Versicherungen
Michael Kl�schen
Sophienblatt 33
24114 Kiel

Telefon (0431) 603-1968
Telefax (0431) 603-101968
http://www.provinzial.de
-----------------------------------------------------------------------
Diese E-Mail ist allein f�r den / die bezeichneten Adressaten bestimmt. Sie
kann rechtlich vertrauliche Informationen enthalten. Wenn Sie diese E-Mail
irrt�mlich erhalten haben, informieren Sie bitte unverz�glich den  Absender
und l�schen Sie diese Nachricht von Ihrem Computer. Vielen Dank.

This email is for the exclusive use of the addressee. It may contain
legally privileged information. If you have received this message in error,
please notify the sender immediately and delete the message from your
computer. Thank you.
