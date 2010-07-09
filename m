Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o698seqp009479
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 04:54:40 -0400
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o698sPXn015926
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 04:54:26 -0400
Received: by fxm14 with SMTP id 14so953618fxm.33
	for <linux-lvm@redhat.com>; Fri, 09 Jul 2010 01:54:24 -0700 (PDT)
MIME-Version: 1.0
Sender: zoobab@gmail.com
In-Reply-To: <AANLkTilkyzsDmuS-xBxZEIl3Zyh5cykRC6JYVUZSADhi@mail.gmail.com>
References: <AANLkTilkyzsDmuS-xBxZEIl3Zyh5cykRC6JYVUZSADhi@mail.gmail.com>
Date: Fri, 9 Jul 2010 10:54:24 +0200
Message-ID: <AANLkTindGZd_YyY2SUEmtyAPcf-1WY_sgcuBKAs_AU0o@mail.gmail.com>
From: Benjamin Henrion <bh@udev.org>
Subject: Re: [linux-lvm] /dev/dm-0 instead of /dev/mapper/mygroup-myvol in
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

On Fri, Jul 9, 2010 at 9:53 AM, Benjamin Henrion <bh@udev.org> wrote:
> Hi,
>
> I have managed to setup an LVM loopback file as a harddisk to mount.
>
> Now, I need the vzdump utility to detect the fact that it is LVM
> based, and it keeps saying that it cannot detect the LVM volume group:
>
> http://openvz.org/pipermail/users/2010-July/003623.html
>
> "unable to detect lvm volume group"
>
> Everything works fine when mount displays that the file is mounted
> with /dev/mapper/mygroup-myvol, on the opposite, it does not work when
> mount outputs /dev/dm-0 in its list.
>
> Any idea how I could force mount to use /dev/mapper/mygroup-myvol
> instead of /dev/dm-0?

On one machine it creates rightly a device on /dev/mapper:

root@buzek /dev/mapper [68]# l
total 0
crw-rw---- 1 root root  10, 59 2010-07-09 09:32 control
brw-rw---- 1 root disk 254,  0 2010-07-09 10:44 openvzgroup-openvzvol

While on the other machine where is does not work, it makes a symlink
to /dev/dm-0:

root@chainsaw /dev/mapper [25]# l
total 0
crw-rw---- 1 root root 10, 59 2010-07-09 10:28 control
lrwxrwxrwx 1 root root      7 2010-07-09 10:46 openvzgroup-openvzvol -> ../dm-0

Any idea why this difference?

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
