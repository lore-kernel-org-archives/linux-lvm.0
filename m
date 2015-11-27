Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAREX3Zm011524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 09:33:03 -0500
Received: from mailrelay.lanline.com (mailrelay.lanline.com [216.187.10.16])
	by mx1.redhat.com (Postfix) with ESMTPS id 812B468E04
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 14:33:02 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay.lanline.com (8.14.5/8.14.5) with ESMTP id tAREQDv9014571
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 09:26:13 -0500 (EST)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id tAREHi9c004228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 09:17:44 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22104.26567.940712.83748@quad.stoffel.home>
Date: Fri, 27 Nov 2015 09:25:11 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <5656DEFB.7020602@manchester.ac.uk>
References: <5654335A.5050702@manchester.ac.uk>
	<22100.38142.696227.209012@quad.stoffel.home>
	<5656DEFB.7020602@manchester.ac.uk>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Tony" == Tony Arnold <tony.arnold@manchester.ac.uk> writes:

Tony> John,
Tony> On 24/11/15 16:49, John Stoffel wrote:

>> Can I make a suggestion to you?  Instead of trying to do the mirroring
>> in LVM, build yourself an MD mirror, then layer LVM ontop of that
>> instead.  You get nice seperation.
>> 
>> You can also take that /dev/sdb3, make it into an MD RAID1 array with
>> just one device, add it into the VG, then move the LVs onto the new
>> device.  Once that's done, you remove the sda3 from the VG, then add
>> it into the MD device.  Something like this...
>> 
>>> mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdb3 missing
>>> cat /proc/mdstat
>>> pvcreate -v /dev/md1
>>> vgextend -v vg0 /dev/md1
>>> pvmove -v sda3
>>> vgreduce -v vg0 sda3
>>> mdadm --add /dev/md0 /dev/sda3
>>> cat /proc/mdstat
>> 
>> And you will now be mirrored, etc.  

Tony> Thanks for your suggestion which I have now implemented. The pvmove took
Tony> a few hours (1.5TB to move!) and then also some more hours while the
Tony> mirror set synchronised. But it's all done and I now have my volumes
Tony> mirrored.

Tony> I'm still curious though why the LVM based RAID1 didn't work. I'll just
Tony> have to stay curious!

I suspect it could have been made to work, but in my experience,
there's a very active MD developer (Neil, who would love more help!)
who does a great job of the pure RAID features that MD provides.

The DM guys are more based on logical block management in my
experience, and so don't do nearly as much in the RAID side of
things.

But in any case, the above setup works really well, and gives you a
good seperation of the layers and is easy to manage and control.

I'm planning on migrating all my setup to a lvm-cache setup, with a
pair of 4TB disk mirrored (and possibly a third mirror of two striped
2Tb drives... belt and suspenders!) with a pair of MX200 SSDS, 500Gb
for boot and cache duties.  Should be a nice fast setup, and take less
power as well.

John
