Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAR2xsNA021666
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2007 21:59:54 -0500
Received: from scan.5ninesdata.com (scan.5ninesdata.com [208.66.134.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAR2xLAo017119
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2007 21:59:21 -0500
Received: from 5ninesdata.com (unknown [208.66.134.10])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by scan.5ninesdata.com (Spam Firewall) with ESMTP id D6D2810DACE
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2007 20:59:19 -0600 (CST)
Message-ID: <474B87F3.7000003@stthomasepc.org>
Date: Mon, 26 Nov 2007 21:58:59 -0500
From: Tod <tod@stthomasepc.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Renaming Loopback 'Mounted' Volume Group
References: <47474790.9010009@stthomasepc.org> <474A83A4.30103@redhat.com>
In-Reply-To: <474A83A4.30103@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Bryn M. Reeves wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Tod wrote:
>> Please take a look at this old thread first ...
>>
>> http://linux.derkeiler.com/Mailing-Lists/Fedora/2007-02/msg02237.html
>>
>>
>> This was back in February and I'm just now trying to get back into
>> recovery mode.  I've mounted the image like so:
>>
>> /sbin/losetup /dev/loop0 ./recover.img
>> /sbin/kpartx -lv /dev/loop0
>> /sbin/kpartx -av /dev/loop0
>>
>> This gives me /dev/mapper/loop0p1, and /dev/mapper/loop0p2 which seeoupNew
>>  be my original boot drive and VolGroup00.  When I do an lvscan I get: 
>>
>> WARNING: Duplicate VG name VolGroup00: Existing
>> Vmi02d-0hr7-7NVb-vYZi-1fbD-E9n5-ixWu0a (created here) takes precedence
>> over D7avZX-pVCb-ibTN-tyvs-7Q62-rzR9-tquBi9
> 
> See the steps I posted last Friday, with some corrections/improvements
> from Alasdair:
> 
> https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html
> https://www.redhat.com/archives/linux-lvm/2007-November/msg00040.html


Thanks Bryn.

Before I make a mess I'd like to recite my steps to see if they seem 
reasonable to you.  I've made a little progress (I think) since the post 
above that might allow me to streamline things.

Of the two 'partitions' on my disk image, only the LVM one has content 
that is important to me and I already know its offset.  Combining both 
your's and Alasdair's steps:

1.  /sbin/losetup /dev/loop0 ./recover.img
2.  /sbin/losetup -o 106928640 /dev/loop1 /dev/loop0
3.  Running pvscan shows me the loopback PV, and gives me expected 
warning regarding the duplicate VG name
4.  Setup temp LVM dir and set LVM_SYSTEM_DIR to point to it
5.  Copy lvm.conf to that dir and apply filter = [ "r|/dev/loop[01]|", 
"a|.*|" ] to it
6.  Clone the PV -> dd if=/dev/loop1 of=/dev/loop2
7.  pvchange --uuid /dev/loop2
8.  vgchange --uuid VolGroup00
9.  vgrename VolGroup00 VolGroupNew
10. Discard LVM_SYSTEM_DIR env var & directory
11. Activate new VG ->  vgchange -ay VolGroupNew

Does this look right?  The one concern I had was step 8 since both my 
currently active VG and the one from the disk image share the same name. 
  I'm guessing steps 4 and 5 will prevent that?

Thanks for all of your help.


- Tod
