Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1GEYei26004
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 09:34:40 -0500
Received: from scanner.icritical.com (82-68-210-166.dsl.in-addr.zen.co.uk [82.68.210.166])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1GEYdb25406
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 09:34:39 -0500
Received: from scanner.icritical.com ([127.0.0.1])
 by localhost (scanner.icritical.com [127.0.0.1]) (amavisd-new, port 10024)
 with SMTP id 02861-01 for <linux-lvm@redhat.com>;
 Mon, 16 Feb 2004 14:34:35 +0000 (GMT)
From: Duncan Hill <lvm@nacnud.force9.co.uk>
Subject: Re: [linux-lvm] LVM 1 volumes and 2.6.2 kernel
References: <200402151804.14727.dhill@nacnud.force9.co.uk> <20040216142123.GA30713@antimony.msp.redhat.com>
In-Reply-To: <20040216142123.GA30713@antimony.msp.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200402161434.38564.lvm@nacnud.force9.co.uk>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 09:33:30 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Monday 16 February 2004 14:21, AJ Lewis wrote:
> On Sun, Feb 15, 2004 at 06:04:14PM +0000, Duncan Hill wrote:
> > Silly me decided a month or so back to migrate to 2.6, but I forgot that
> > I had a LVM1 installation on my portable drive.  Said installation
> > doesn't seem to work now - even with dm-mod loaded, I get errors about
> > /dev/mapper/control.  What parts am I missing?
>
> There is a script called devmap_mknod.sh in the device mapper tarball's
> scripts directory - you need to run this script to create
> /dev/mapper/control.  I don't know for sure, but I'd guess that it is
> included in the debian packages for device-mapper.
>
> Regards,
14:32:05 dhill@flyingfish
~> sudo modprobe dm-mod

14:32:11 dhill@flyingfish
~> sudo /home/dhill/Build/device-mapper.1.00.07/scripts/devmap_mknod.sh
Creating /dev/mapper/control character device with major:10 minor:63.

Yay :)  Will have to test when I get home to see if the commands work, as I 
left the drive behind this morning.

The script isn't in the rpm that's installed, which is weird.
rpm -ql device-mapper
/lib/libdevmapper.so.1.00
/sbin/dmsetup
/usr/include/libdevmapper.h
/usr/lib/libdevmapper.so
/usr/share/doc/device-mapper-1.00.07
/usr/share/doc/device-mapper-1.00.07/COPYING
/usr/share/doc/device-mapper-1.00.07/COPYING.LIB
/usr/share/doc/device-mapper-1.00.07/README
/usr/share/doc/device-mapper-1.00.07/VERSION
/usr/share/man/man8/dmsetup.8.gz

Thanks!
