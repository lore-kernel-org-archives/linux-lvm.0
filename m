Received: from localhost (ovpn-116-53.ams2.redhat.com [10.36.116.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19E5C18EFD
	for <linux-lvm@redhat.com>; Tue, 10 Apr 2018 08:47:31 +0000 (UTC)
Date: Tue, 10 Apr 2018 09:47:30 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20180410084730.GA9920@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] "Data alignment must not exceed device size."
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


Recently in Fedora something changed that stops us from creating small
LVs for testing.

An example failure with a 64 MB partitioned disk:

# parted -s -- /dev/sda mklabel msdos mkpart primary 128s -128s
Warning: The resulting partition is not properly aligned for best performance: 128s % 65535s != 0s
# lvm pvcreate --force /dev/sda1
  /dev/sda1: Data alignment must not exceed device size.
  Format-specific initialisation of physical volume /dev/sda1 failed.
  Failed to setup physical volume "/dev/sda1".

Obviously if I were to increase the beginning of the partition to
65536 sectors (32 MB) then there wouldn't be much space left for data.

Another possibly related issue happens if I use a 32 MB disk and leave
out the partition table (again, this used to work in Fedora up to recently):

# lvm pvcreate --force /dev/sda
# lvm vgcreate VG /dev/sda
# lvm lvcreate -l 100%FREE -n LV /dev/VG
  Calculated size of logical volume is 0 extents. Needs to be larger.
guestfsd: error:   Calculated size of logical volume is 0 extents. Needs to be larger.

I checked the lvm2 git repo and didn't see any recent changes which I
thought could affect this.

I'm not sure what component is responsible.  I have two very similarly
configured machines where it works with one but not with the other.
The only difference seems to be the kernel:

Working:
  kernel-4.15.0-0.rc8.git0.1.fc28.x86_64
  device-mapper-1.02.146-1.fc28.x86_64
  lvm2-2.02.177-1.fc28.x86_64

Not working:
  kernel-4.16.0-0.rc4.git0.1.fc28.x86_64
  device-mapper-1.02.146-1.fc28.x86_64
  lvm2-2.02.177-1.fc28.x86_64

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW
