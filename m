Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4VJLoX6023939
	for <linux-lvm@redhat.com>; Mon, 31 May 2010 15:21:50 -0400
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4VJLbFK021058
	for <linux-lvm@redhat.com>; Mon, 31 May 2010 15:21:38 -0400
Received: by vws9 with SMTP id 9so1221537vws.33
	for <linux-lvm@redhat.com>; Mon, 31 May 2010 12:21:37 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 1 Jun 2010 04:21:36 +0900
Message-ID: <AANLkTikmw8_d91zrpW9HFKz8d5XCkg-b8h_NdD3leR9u@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Subject: [linux-lvm] Is it possible to bypass LVM and mount contained
	partition directly?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I apologize if this has been asked before but I was unable to find any
references to it in the mailing list archives and googling around
isn't helping much.

Is there a way to directly mount, bypassing LVM, a ext3 partition that
resides in a LVM LV and VG? It resides on one PV.

The problem is that I have read-only copies of VM's that are backed up
via a SAN based snapshot/backup tool. I'm trying to create a method to
allow the VM admins to restore their files from the snapshot backed up
VM's. I'm at the point where I can access the partitions and can mount
the ext3 partitions fine but I'm having trouble with the LVM volumes
because I can't import the pv/vg because they have the same name/uuid
as the existing VG (it's really the same system) and I can't change
them with something like vgimportclone because the backed up vm image
files are read-only.

Thanks for any help.

--
Romeo Theriault
