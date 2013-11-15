Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rAFBDYYw031279
	for <linux-lvm@redhat.com>; Fri, 15 Nov 2013 06:13:34 -0500
Received: from gribule.nick.on.net (gribule.nick.on.net [72.14.189.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAFBDXkd029182
	for <linux-lvm@redhat.com>; Fri, 15 Nov 2013 06:13:34 -0500
Received: from nick.on.net (mail.nick.on.net [IPv6:2600:3c00::1b:e001])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: nickm)
	by gribule.nick.on.net (Postfix) with ESMTPSA id 581DA2A1F3
	for <linux-lvm@redhat.com>; Fri, 15 Nov 2013 12:13:33 +0100 (CET)
Date: Fri, 15 Nov 2013 12:13:23 +0100
From: Nick Morrison <nick@nick.on.net>
Message-ID: <20131115111323.GA24094@nick.on.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 snapshot weirdness
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


Hello list,

I subscribed a few minutes ago, and I've got a question already :-)  I've done
some searching and research on my problem, but haven't had any success yet. So
I thought I'd pose it to this list, in the hope of finding some tips for
solving it.

I have an HP server running RHEL 5.7. It contains four hard disks, in two
hardware RAID-1 groups. The first RAID-1 contains the operating system and
utilities; the second is slated for compressed snapshot dumps of the first.
There's nothing particularly freaky about the configuration of the machine, as
far as I can tell.

I wrote a script which does the following:

# lvcreate -pr -L 2G -s -n LogVol00-snapshot /dev/VolGroup00/LogVol00
# dd bs=8k if=/dev/VolGroup00/LogVol00-snapshot | gzip -3 -c > /backup/LogVol00.img.gz

After this completes, I verify the dump by comparing the output of:

# md5sum /dev/VolGroup00/LogVol00-snapshot

with

# gunzip -c /backup/LogVol00.img.gz | md5sum

This method seems to have been repeatedly successful on four other servers of
similar hardware configuration. I am running the same script on all of them.
The other machines have a larger logical volume (500Gb vs this machine, 260G)
but the PVs are all the same (whole disk except the /boot partition).  However,
on this machine, I got an md5sum mismatch.

Seeking the source of the weirdness, I ran a second dd from the same snapshot:

# dd bs=8k if=/dev/VolGroup00/LogVol00-snapshot | gzip -3 -c > /backup/LogVol00-again.img.gz

.. and md5sum gave me a third, different, result.

It seems as if the data read from the snapshot is changing.

Do I have a conceptual misunderstanding of what I'm doing? Can anyone suggest
things for me to look at, verify, or test? Am I missing something blindingly
obvious here? :-)

Any and all suggestions and comments welcomed!

Cheers and beers,
Nick
