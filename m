Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9482WKX014307
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 04:02:32 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9482FM8030923
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 04:02:16 -0400
Received: by iwn5 with SMTP id 5so8583420iwn.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 01:02:15 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 4 Oct 2010 13:32:15 +0530
Message-ID: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Subject: [linux-lvm] mounting a filesystem on LVM2
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

I just created an LVM and using cfdisk I created a / type ext4
and swap filesystem in that.
Both are completely blank.
Is it possible to mount the above / filesystem in LVM at some place so
that I can write in it.
I am using LVM2.
I want to fill the data of a snapshot backup into this LVM.
