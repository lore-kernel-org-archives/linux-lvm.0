Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0AMfZr27968
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 17:41:35 -0500
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0AMfSuY006527
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 17:41:28 -0500
Received: from eric.placeverte.home
	(lns-vlq-9-lil-82-65-150-249.adsl.proxad.net [82.65.150.249])
	by postfix3-1.free.fr (Postfix) with SMTP id 0501E1734B5
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 23:41:27 +0100 (CET)
Date: Mon, 10 Jan 2005 23:41:27 +0100
From: messmate <messmate@free.fr>
Message-ID: <20050110234127.291fb93d@eric.placeverte.home>
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
