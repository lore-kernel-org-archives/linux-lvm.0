Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB10kDoH011804
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 19:46:13 -0500
Received: from mail-bw0-f214.google.com (mail-bw0-f214.google.com
	[209.85.218.214])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB10jv01032513
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 19:45:58 -0500
Received: by bwz6 with SMTP id 6so3186148bwz.11
	for <linux-lvm@redhat.com>; Mon, 30 Nov 2009 16:45:57 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 1 Dec 2009 02:45:56 +0200
Message-ID: <4cd59bf50911301645l51c44579k978225d3fe9e71b0@mail.gmail.com>
From: Gabriel <jarod125@gmail.com>
Subject: [linux-lvm] show free space _inside_ logical volume
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

I'm interested to know if it is possible to check the amount of free
space _inside_ a LV. I know that usually a LV is fully "occupied" by a
partition, but there is a (short) period when there is a gap between
the size of the partition and the size of the LV it resides on. That
happens _after_ doing a lvextend and _before_ doing the resize
(expand) of the filesystem.

First thing I thought of was lvdisplay. While I can see how many LEs
the LV has, I cannot see how many of them are in use by the filesystem
and how many are free (the way pvdisplay shows total/free/allocated
PEs).

It was suggested to me that I try some filesystem tools (resize2fs,
dumpe2fs, tune2fs etc.) that might show me the free space. resize2fs
does not have a 'dry-run' option that would have shown the new size
(in blocks) of the filesystem and I didn't find anything useful in
tune2fs' manual either.

dumpe2fs shows various information such as block count, free blocks
and block size, but I see no modifications when running this before
and after the lvextend command.

I also tried parted -l, but to no avail.
