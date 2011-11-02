Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2GdI9N031843
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 12:39:19 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2GdHUT027230
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 12:39:18 -0400
Received: from gtw.srd.co.uk ([82.69.77.54] helo=agnew.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1RLdQC-0001xL-7h
	for linux-lvm@redhat.com; Wed, 02 Nov 2011 16:12:12 +0000
Message-ID: <4EB1722F.206@ankh.org>
Date: Wed, 02 Nov 2011 16:39:11 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without
 a	Logical	Volume Group ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dan White wrote:
>
> I just experienced that.
>
> I had to reboot the machine to "see" the expanded LUN.
> I used fdisk to make a partition out of the LUN expansion, but I had to reboot again before I could do anything further.
> After the second reboot, I was able to make a PV out of the new partition, roll it into the existing VG and then expand the two test LV's I had previously created to utilize the new elbow room.
>
> This is on a RHEL 5.7 system.
>
> Is there a way to do this without the rebooting ?
>
>   
Assuming the device is sda then

|echo 1 > /sys/block/sda/device/rescan|

However if that fails (and it can) only a reboot or removing the disk 
driver module and reinstalling it will scan it correctly (possible if 
you have a mix of local and san disk) however probably a reboot is easiler.

James
