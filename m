Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0AMgkr28209
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 17:42:46 -0500
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0AMgfVm009993
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 17:42:41 -0500
Received: from eric.placeverte.home
	(lns-vlq-9-lil-82-65-150-249.adsl.proxad.net [82.65.150.249])
	by postfix4-2.free.fr (Postfix) with SMTP id A35312A0072
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 23:42:40 +0100 (CET)
Date: Mon, 10 Jan 2005 23:42:40 +0100
From: messmate <messmate@free.fr>
Message-ID: <20050110234240.749ebab3@eric.placeverte.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] strange logical volume issue
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
To: linux-lvm <linux-lvm@redhat.com>

Hi list,
there is somewhat strange with a lv of mine: lv_usr-local.
Marked as /dev/mapper/vg1_hda1-lv_usr--local    and
as /dev/vg1_hda/lv_usr-local  !

See the (-) differences.

I've tryed to change this without success.
Manually, with lvremove and lvcreate.....

Is there a special way to do this changes ?
Thanks for your help in advance.
mess-mate

Forgot to say :
LVM version:     2.00.32 (2004-12-22)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.1.0
