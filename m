Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAREX2mK029384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 09:33:02 -0500
Received: from mailrelay.lanline.com (mailrelay.lanline.com [216.187.10.16])
	by mx1.redhat.com (Postfix) with ESMTPS id 7D5AC68E16
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 14:33:01 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay.lanline.com (8.14.5/8.14.5) with ESMTP id tAREQDiO014570
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 09:26:13 -0500 (EST)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id tAREIOZ7004239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 09:18:25 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22104.26608.435001.167413@quad.stoffel.home>
Date: Fri, 27 Nov 2015 09:25:52 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <56571238.70206@redhat.com>
References: <5654335A.5050702@manchester.ac.uk>
	<22100.38142.696227.209012@quad.stoffel.home>
	<5656DEFB.7020602@manchester.ac.uk> <56571238.70206@redhat.com>
Subject: Re: [linux-lvm] Problems creating/converting large logical
	volume	to RAID1
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

>>>>> "Zdenek" == Zdenek Kabelac <zkabelac@redhat.com> writes:

Zdenek> Dne 26.11.2015 v 11:29 Tony Arnold napsal(a):
>> John,
>> 
>> On 24/11/15 16:49, John Stoffel wrote:
>> 
>>> Can I make a suggestion to you?  Instead of trying to do the mirroring
>>> in LVM, build yourself an MD mirror, then layer LVM ontop of that
>>> instead.  You get nice seperation.
>>> 
>>> You can also take that /dev/sdb3, make it into an MD RAID1 array with
>>> just one device, add it into the VG, then move the LVs onto the new
>>> device.  Once that's done, you remove the sda3 from the VG, then add
>>> it into the MD device.  Something like this...
>>> 
>>>> mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdb3 missing
>>>> cat /proc/mdstat
>>>> pvcreate -v /dev/md1
>>>> vgextend -v vg0 /dev/md1
>>>> pvmove -v sda3
>>>> vgreduce -v vg0 sda3
>>>> mdadm --add /dev/md0 /dev/sda3
>>>> cat /proc/mdstat
>>> 
>>> And you will now be mirrored, etc.
>> 
>> Thanks for your suggestion which I have now implemented. The pvmove took
>> a few hours (1.5TB to move!) and then also some more hours while the
>> mirror set synchronised. But it's all done and I now have my volumes
>> mirrored.
>> 
>> I'm still curious though why the LVM based RAID1 didn't work. I'll just
>> have to stay curious!

Zdenek> 4.1  & 4.2  kernel has broken RAID

Zdenek> DO NOT USE  (at least with lvm2 - but since the flaw there is md driver
Zdenek> I assume mdadm is affected as well)

Zdenek> Switch to 4.3 please.

Was this fixed in 4.2.6 by any chance?  That's what I'm currently running...
