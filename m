Received: from mx2.redhat.com (ext-mx01.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.1])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4ILoB5w016028
	for <linux-lvm@redhat.com>; Sun, 18 May 2014 17:50:12 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx2.redhat.com (8.14.4/8.14.4) with ESMTP id s4ILo9rn031237
	for <linux-lvm@redhat.com>; Sun, 18 May 2014 17:50:09 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Wm8y3-0008JF-QA
	for linux-lvm@redhat.com; Sun, 18 May 2014 23:50:03 +0200
Received: from ltea-047-066-167-105.pools.arcor-ip.net ([47.66.167.105])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 18 May 2014 23:50:03 +0200
Received: from andy.kittner by ltea-047-066-167-105.pools.arcor-ip.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 18 May 2014 23:50:03 +0200
From: Andy Kittner <andy.kittner@gmail.com>
Date: Sun, 18 May 2014 23:44:07 +0200
Message-ID: <llb9j7$b01$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Race condition in udev_is_running check when running
	under systemd
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

Hi all,

first of I hope I have come to the right place for reporting (possible)
bugs, if not feel free to give me a gentle kick in the right direction
;)


After updating to systemd-212 I was experiencing problems with
cryptsetup for a while. systemd would open and close my encrypted
partitions in rapid succession, causing dependent services like fsck to
fail most of the time because the device vanished again.

After some discussion on the systemd mailing list and a bit of debugging
I found that the root of the issue is, that when systemd calls cryptsetup
the _check_udev_is_running() function (in ./libdm/libdm-common.c) would
still return false.
This causes libdm to create some device nodes itself, and that in turn
apparently to causes the problems with systemd thinking the device has
vanished.

According to the systemd developers this issue should be fixed on the
libdm side. To quote the relevant part from the mails there:

>On 15/05/14 23:38, Lennart Poettering wrote:
>> On Thu, 15.05.14 23:15, Andy Kittner (andy.kittner@gmail.com) wrote:
>>> Anyway, my conclusion from this is that either the LVM guys need to
>>> use another method to detect that udev is running, or systemd should
>>> not start the cryptsetup stuff until udev is fully initialized.
>> 
>> Nope, we don't need more synchronization. The LVM guys should stop doing
>> mknod() on their own.

For full details see the thread here
  http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18992/focus=19069



Regards,
Andy
