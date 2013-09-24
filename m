Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8OFq5v0001236
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 11:52:06 -0400
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8OFq3FY018244
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 11:52:03 -0400
Received: by mail-yh0-f46.google.com with SMTP id c41so2018983yho.5
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 08:52:03 -0700 (PDT)
Message-ID: <5241B520.6080408@gmail.com>
Date: Tue, 24 Sep 2013 11:52:00 -0400
From: =?ISO-8859-2?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
References: <5238A190.2050000@gmail.com>
	<alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
	<alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
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
To: linux-lvm@redhat.com

I followed your example and trims seems to work (based on the lvs
output) but as you can see, there seems to be something wrong with the
"fstrim -v" output (it shows as if nothing is being trimmed).


# lvs vgthin1
  lvol1      vgthin1 Vwi-aotz- 100.78g lvthinpool   3.20

  lvthinpool vgthin1 twi-a-tz- 100.68g              3.20

# mount /var/lib/libvirt/images
# fstrim -v /var/lib/libvirt/images
/var/lib/libvirt/images: 97.6 GiB (104814780416 bytes) trimmed

# dd if=/dev/zero of=/var/lib/libvirt/images/file bs=1M count=1024
# dd if=/dev/zero of=/var/lib/libvirt/images/file1 bs=1M count=1024
# dd if=/dev/zero of=/var/lib/libvirt/images/file2 bs=1M count=1024

# sync
# lvs vgthin1
  lvol1      vgthin1 Vwi-aotz- 100.78g lvthinpool   6.18

  lvthinpool vgthin1 twi-a-tz- 100.68g              6.18

# rm -f /var/lib/libvirt/images/file
# sync
# fstrim -v /var/lib/libvirt/images
/var/lib/libvirt/images: 0 B (0 bytes) trimmed

# lvs vgthin1
  lvol1      vgthin1 Vwi-aotz- 100.78g lvthinpool   5.19

  lvthinpool vgthin1 twi-a-tz- 100.68g              5.19

# rm -f /var/lib/libvirt/images/file*
# sync
# fstrim -v /var/lib/libvirt/images
/var/lib/libvirt/images: 0 B (0 bytes) trimmed

# lvs vgthin1

  lvol1      vgthin1 Vwi-aotz- 100.78g lvthinpool   3.20

  lvthinpool vgthin1 twi-a-tz- 100.68g              3.20

# lvm version
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.02.77 (2012-10-15)
  Driver version:  4.24.0

# dd if=/dev/zero of=/var/lib/libvirt/images/tempfile bs=1M count=40000
# lvs vgthin1
  lvol1      vgthin1 Vwi-aotz- 100.78g lvthinpool   41.84

  lvthinpool vgthin1 twi-a-tz- 100.68g              41.89

# rm -f /var/lib/libvirt/images/tempfile
# sync
# fstrim -v /var/lib/libvirt/images
/var/lib/libvirt/images: 0 B (0 bytes) trimmed

# lvs vgthin1

  lvol1      vgthin1 Vwi-aotz- 100.78g lvthinpool   3.08

  lvthinpool vgthin1 twi-a-tz- 100.68g              3.09


As you may see, this is the behaviour I'm getting now (fstrim reports
nothing being trimmed although it is being trimmed).  I can't recreate
the original problem when I opened the bug (fstrim reporting always 124
MiB).  I'm not sure if any update had to do anything with it.
