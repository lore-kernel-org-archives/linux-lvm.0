Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oA744Awf004119
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2010 00:04:11 -0400
Received: from mail.spinn.net (mail.spinn.net [216.223.224.151])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oA7440Ln027209
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2010 00:04:00 -0400
Message-ID: <4CD6252A.9040003@spinn.net>
Date: Sat, 06 Nov 2010 22:03:54 -0600
From: allan <allane@spinn.net>
MIME-Version: 1.0
References: <4CD35D3E.5030200@cfl.rr.com>	<Pine.LNX.4.64.1011050022550.31032@bmsred.bmsi.com>
	<4CD5F804.3040906@cfl.rr.com>
In-Reply-To: <4CD5F804.3040906@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM + raid + san
Reply-To: allane@spinn.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Have you considered using mdadm for the RAID configuration and lvm to carve it up?


Phillip Susi wrote:
> My understanding of a SAN is where you get a few drive enclosures and a 
> few servers and plug them all into a sas expander so all of the servers 
> can see all of the disks.  You seem to be talking about having all of 
> the disks on one server that then serves them over ethernet with iscsi. 
>  I wouldn't want to do that because it adds a good deal of overhead to 
> the disk access and introduces a single point of failure.
> 
> I'd rather just use LVM to manage all of the disks as part of a single 
> volume group so you can immediately transfer a lv from one server to 
> another, but I can't work out how to still manage to get raid without 
> having lvm do it with the dm-raid5 support.
> 
> On 11/05/2010 12:39 AM, Stuart D. Gathman wrote:
>> I would run LVM on the SAN server, exporting LVs as SAN units, and 
>> each host
>> would get a virtual SAN disk to do with as it pleased, including running
>> LVM on it.  Then you don't have to deal with locking issues for a shared
>> volume group.  If your SAN server is embedded, it must already have 
>> some sort
>> of management interface to parcel out disk space as virtual disks.
>> If you don't like its interface, then consider replacing it with a
>> general purpose host running LVM as described above.  That said, many
>> do use shared volume groups with no problem.
>>
>> Generally, your SAN (whether embedded or a dedicated general purpose 
>> host)
>> already has the raid built in.  The exported virtual disks are raid
>> reliable.  If not, replace the SAN.  The whole point of SAN is to not
>> worry about physical disks anymore on the client systems.  If you had 
>> multiple
>> SANs on separate physical LANs, you could stripe them for super speed, 
>> but
>> otherwise raid is already built in.  And you can bond multiple 1000BT
>> interfaces with a gigabit switch to get really fast transfer from
>> the SAN anyway.
>>
>> If the SAN server is a general purpose host, I would run raid10, or 
>> linux md
>> extensions to it that get most of the benefits with fewer disks:
>>
>> http://en.wikipedia.org/wiki/Non-standard_RAID_levels
>>
>> raid5 has the read/modify/rewrite problem.
>>
>> I would not use the device-mapper raid, as you note.
>>
>> Caveat: I've never actually setup a SAN, just used them.
>>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
