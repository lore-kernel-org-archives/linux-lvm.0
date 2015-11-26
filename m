Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAQATKCA000693
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 05:29:20 -0500
Received: from probity.mcc.ac.uk (probity.mcc.ac.uk [130.88.200.94])
	by mx1.redhat.com (Postfix) with ESMTPS id 7222137EE2
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 10:29:18 +0000 (UTC)
Received: from asmtp2.its.manchester.ac.uk ([130.88.13.150])
	by probity.mcc.ac.uk with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.85 (FreeBSD)) (envelope-from <tony.arnold@manchester.ac.uk>)
	id 1a1tng-0002Mj-EN
	for linux-lvm@redhat.com; Thu, 26 Nov 2015 10:29:16 +0000
Received: from zaphod.itservices.manchester.ac.uk ([130.88.201.81]:57546)
	by asmtp2.its.manchester.ac.uk with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (Exim 4.83)
	(envelope-from <tony.arnold@manchester.ac.uk>) id 1a1tng-0000qV-4q
	for linux-lvm@redhat.com; Thu, 26 Nov 2015 10:29:16 +0000
References: <5654335A.5050702@manchester.ac.uk>
	<22100.38142.696227.209012@quad.stoffel.home>
From: Tony Arnold <tony.arnold@manchester.ac.uk>
Message-ID: <5656DEFB.7020602@manchester.ac.uk>
Date: Thu, 26 Nov 2015 10:29:15 +0000
MIME-Version: 1.0
In-Reply-To: <22100.38142.696227.209012@quad.stoffel.home>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Problems creating/converting large logical volume
 to RAID1
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

John,

On 24/11/15 16:49, John Stoffel wrote:

> Can I make a suggestion to you?  Instead of trying to do the mirroring
> in LVM, build yourself an MD mirror, then layer LVM ontop of that
> instead.  You get nice seperation.
> 
> You can also take that /dev/sdb3, make it into an MD RAID1 array with
> just one device, add it into the VG, then move the LVs onto the new
> device.  Once that's done, you remove the sda3 from the VG, then add
> it into the MD device.  Something like this...
> 
>> mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdb3 missing
>> cat /proc/mdstat
>> pvcreate -v /dev/md1
>> vgextend -v vg0 /dev/md1
>> pvmove -v sda3
>> vgreduce -v vg0 sda3
>> mdadm --add /dev/md0 /dev/sda3
>> cat /proc/mdstat
> 
> And you will now be mirrored, etc.  

Thanks for your suggestion which I have now implemented. The pvmove took
a few hours (1.5TB to move!) and then also some more hours while the
mirror set synchronised. But it's all done and I now have my volumes
mirrored.

I'm still curious though why the LVM based RAID1 didn't work. I'll just
have to stay curious!

Thanks once again.

Regards,
Tony.
-- 
Tony Arnold, IT Security Analyst, University of Manchester.
T: +44 (0) 161 275 6093, F: +44 (0) 705 344 3082,
M: +44 (0) 773 330 0039, E: tony.arnold@manchester.ac.uk
