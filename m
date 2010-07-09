Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o697rZmG028158
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 03:53:35 -0400
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o697rN5p000658
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 03:53:23 -0400
Received: by fxm14 with SMTP id 14so918669fxm.33
	for <linux-lvm@redhat.com>; Fri, 09 Jul 2010 00:53:20 -0700 (PDT)
MIME-Version: 1.0
Sender: zoobab@gmail.com
Date: Fri, 9 Jul 2010 09:53:20 +0200
Message-ID: <AANLkTilkyzsDmuS-xBxZEIl3Zyh5cykRC6JYVUZSADhi@mail.gmail.com>
From: Benjamin Henrion <bh@udev.org>
Subject: [linux-lvm] /dev/dm-0 instead of /dev/mapper/mygroup-myvol in
	"mount" output
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

Hi,

I have managed to setup an LVM loopback file as a harddisk to mount.

Now, I need the vzdump utility to detect the fact that it is LVM
based, and it keeps saying that it cannot detect the LVM volume group:

http://openvz.org/pipermail/users/2010-July/003623.html

"unable to detect lvm volume group"

Everything works fine when mount displays that the file is mounted
with /dev/mapper/mygroup-myvol, on the opposite, it does not work when
mount outputs /dev/dm-0 in its list.

Any idea how I could force mount to use /dev/mapper/mygroup-myvol
instead of /dev/dm-0?

Best,

-- 
Benjamin Henrion <bhenrion@ffii.org>
FFII Brussels - +32-484-566109 - +32-2-4148403
"In July 2005, after several failed attempts to legalise software
patents in Europe, the patent establishment changed its strategy.
Instead of explicitly seeking to sanction the patentability of
software, they are now seeking to create a central European patent
court, which would establish and enforce patentability rules in their
favor, without any possibility of correction by competing courts or
democratically elected legislators."
