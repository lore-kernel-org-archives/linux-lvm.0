Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6QJeiqx019537
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2010 15:40:44 -0400
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6QJeWK9003982
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2010 15:40:33 -0400
Received: by fxm14 with SMTP id 14so305183fxm.33
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2010 12:40:32 -0700 (PDT)
MIME-Version: 1.0
Sender: zoobab@gmail.com
Date: Mon, 26 Jul 2010 21:40:31 +0200
Message-ID: <AANLkTimSLv00evi01uV90PTBsSO0z=+CT7CagsZxWe2M@mail.gmail.com>
From: Benjamin Henrion <bh@udev.org>
Subject: [linux-lvm] lvmdiskscan and mouting a LVM2 loopback file
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

I have setup an LVM device on loopback, but I cannot remember how to
mount it back.

I did an lvmdiskscan:

===============================================
# lvmdiskscan
  /dev/loop0 [      39.06 GiB] LVM physical volume
  /dev/root  [     222.79 GiB]
  /dev/sda5  [       9.45 GiB]
  1 disk
  1 partition
  0 LVM physical volume whole disks
  1 LVM physical volume
===============================================

But I don't know how to detect the logical volumes inside /dev/loop0.

lvdisplay and vgdisplay says:

=================================================
# lvdisplay
  No volume groups found
# vgdisplay
  No volume groups found
=================================================

Any idea how to get the volume and group back?

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
