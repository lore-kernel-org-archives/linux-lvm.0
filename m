Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0H7BrKI030585
	for <linux-lvm@redhat.com>; Sun, 17 Jan 2010 02:11:53 -0500
Received: from k.datenfreihafen.de (k.datenfreihafen.de [80.237.196.21])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0H7BbX9003831
	for <linux-lvm@redhat.com>; Sun, 17 Jan 2010 02:11:38 -0500
Date: Sun, 17 Jan 2010 07:11:35 +0000
From: Sascha Krissler <sascha@k.datenfreihafen.de>
Message-ID: <20100117071135.GA61570@k.datenfreihafen.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] random seek performance
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

howdy!

is it possible to achieve a higher average seek performance on a LVM2 LV
with 4 PVs on 4 different disks compared to the seek performance of a single
physical disk? If the random reads are equally distributed between the PVs
then the LV seek performance should be 4 times as high. The number of bytes
read is smaller than the stripe size. On both a striped and a linear configuration,
the seek performance on the LV device is the same as the seek performance of
the physical disks (all of identical model). It looks as if not more than one read can
be in progress at the same time. is this true?
seeks not on the LV device file but a file in the filesystem on the LV's are 20% faster and
also a little bit faster than the physical device access time. In both cases, the device/file
is opened with O_DIRECT.
