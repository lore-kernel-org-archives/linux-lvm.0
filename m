Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0C0OlKq009973
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2009 19:24:47 -0500
Received: from exodus.loho.co.uk (exodus.loho.co.uk [193.33.187.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0C0O9K8025994
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2009 19:24:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by exodus.loho.co.uk (Postfix) with ESMTP id 547966E824A
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 00:24:08 +0000 (GMT)
Received: from exodus.loho.co.uk ([127.0.0.1])
	by localhost (exodus.loho.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ppl2EjDhHT0 for <linux-lvm@redhat.com>;
	Mon, 12 Jan 2009 00:23:54 +0000 (GMT)
Received: from [192.168.169.2] (unknown [192.168.169.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alex.brett@loho.co.uk)
	by exodus.loho.co.uk (Postfix) with ESMTP id AB17A6E801E
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 00:23:51 +0000 (GMT)
Message-ID: <496A8D96.9030209@alexbrett.net>
Date: Mon, 12 Jan 2009 00:23:50 +0000
From: Alex Brett <alex@alexbrett.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Strange PV metadata issue
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

I have a single volume group (unimaginatively named vg), made up of a
single physical volume. I noticed earlier this evening that for some
reason when I created the partition, I'd only created it at about 750G,
rather than the whole 2TB or so that is available to it (it's on a 3ware
hardware raid card if that makes any difference).

To fix this, I deleted the existing partition, and created a new one,
starting at the same place and ending at the end of the disk, all seemed
well. For some reason it couldn't update the partition table without
rebooting - at this point I may have done something stupid, and tried to
do a pvresize anyway. This came back and told me it had quite happily
resized the volume, but on checking pvdisplay, I saw that it was in fact
still the same size.

So, I then rebooted, and did a pvresize, and everything appeared to be
good - I had a 2TB PV, which mapped through to the volume group etc
correctly. I created a new 500G LV, which mkfs'd correctly and seemed
happy...

Later on, I tried running lvdisplay, which is now failing with:
myth ~ # lvdisplay
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group "vg" inconsistent
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  WARNING: Inconsistent metadata found for VG vg - updating to use version 5
  Incorrect metadata area header checksum
  Automatic metadata correction failed
  Internal error: Volume Group vg was not unlocked
  Device '/dev/sda4' has been left open.
  Device '/dev/sda4' has been left open.
  Device '/dev/sda4' has been left open.

After some experimenting with vgcfgrestore, and re-creating the PV etc,
the error remains. The existing LVs seem to be perfectly fine, I can
mount them with no problems, and data seems intact etc. I ran pvck,
which shows that I have two metadata areas, one roughly where expected,
and another at roughly the 750G mark, which I didn't expect (I hadn't
specified how many copies of the metadata I wanted, so I would only
expect one):
myth ~ # pvck /dev/sda4
  Incorrect metadata area header checksum
  Found label on /dev/sda4, sector 1, type=LVM2 001
  Found text metadata area: offset=4096, size=192512
  Found text metadata area: offset=788529872896, size=172032
  Incorrect metadata area header checksum

Examing the data on the disk directly, I do seem to have a correct
metadata copy at the 4096 point (it matches what I have in
/etc/lvm/backup/vg), but at the 788529.. point it's just full of zeros.

I assume what's happened (I'm no expert in lvm at all, so a lot of this
is guessing) is that when I (stupidly) ran pvresize on the disk before
rebooting, it somehow created this second metadata area, which the mkfs
of my new LV overwrote in some way.

Looking at the LVs that exist and their stripes, I'm fairly sure that
this metadata area is *inside* the new 500G LV that I created, since
that shows up as:

                        segment1 {
                                start_extent = 0
                                extent_count = 128000   # 500 Gigabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv0", 128000
                                ]
                        }
which obviously seems wrong to me!

Can anybody suggest a way of dealing with this - can I manually edit the
data on the partition to remove any reference to this second metadata
area some how? Ideally I'd copy all the data off, and start from
scratch, but unfortunately I don't have enough storage space to do that!

Thanks in advance,
Alex Brett
alex@alexbrett.net
