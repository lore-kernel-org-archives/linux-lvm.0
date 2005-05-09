Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j496HiO32143
	for <linux-lvm@redhat.com>; Mon, 9 May 2005 02:17:44 -0400
Received: from mail.cluj.astral.ro (courier.cluj.astral.ro [193.230.240.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j496HbmB027729
	for <linux-lvm@redhat.com>; Mon, 9 May 2005 02:17:38 -0400
Message-ID: <427F007B.5010609@nextra.ro>
Date: Mon, 09 May 2005 09:17:31 +0300
From: Gergely Imre <gimre@nextra.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgconvert
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


i have a LVM1 VG i want to convert to LVM2. the kernel is already 2.6,
the lvm tools are lvm2 too. is there any specific procedure to convert
the VG, or i just run vgconvert? if something goes wrong, can i restore
the old format without data loss? i didn't seem to find any problems
reported, i just want to make sure :)
thx
