Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5BFZQqd006843
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 11:35:26 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5BFZCs6012626
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 11:35:13 -0400
Received: from ns1.futuresource.com ([10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n5BFZA9w011687
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 10:35:12 -0500
Received: from [10.207.193.131] (xplmikesell.esignalcorp.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n5BFZ9r30709
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 10:35:10 -0500
Message-ID: <4A31242D.5090501@gmail.com>
Date: Thu, 11 Jun 2009 10:35:09 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data deduplication in LVM?
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>	<Pine.LNX.4.64.0906101822350.30724@bmsred.bmsi.com>	<0CCC4321-943D-406A-A1BB-48E2BD6B0857@karlsbakk.net>
	<4A30F8E3.5090508@gmail.com>
In-Reply-To: <4A30F8E3.5090508@gmail.com>
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

Les Mikesell wrote:
> Roy Sigurd Karlsbakk wrote:
>> On 11. juni. 2009, at 00.30, Stuart D. Gathman wrote:
>>
>>> One OSS backup product that does
>>> deduplication is BackupPC (written in Perl).  In the backup server, 
>>> every file
>>> gets hard linked to a name in a special directory that is its md5 
>>> checksum
>>> (plus some fiddly logic to handle metadata)
>>
>>
>> This sounds like file-level deduplication. Most storage systems sing 
>> dedup, uses block-level dedup. NetApp is one example; they dedup 
>> everything with 4k blocks, doing the actual deduplication at night.
> 
> Yes, it is a different concept.  However it does work very well when you 
> are storing your backups on a filesystem without block-level dedup.  And 
> that is probably the place where you have the most redundancy - or if 
> you don't already, you'll be able to store a much longer history.

Apologies for following up my own post, but this does remind me of a 
slightly related problem that someone here might have solved.  The 
backuppc archive ends up containing such a large number of directory 
entries and hardlinks that it is typically impractical to copy by any 
file-oriented means or even rsync.   A recurring topic on the backuppc 
mail list is how to make a copy for offsite storage.

Personally I use a RAID1 created with 3 mirror members and periodically 
swap one out and resync, but that's not very elegant.  Is there a better 
way or one that could be incrementally updated across a WAN?  Does LVM 
have a mechanism like zfs's incremental snapshot send/receive? (Not sure 
if that would work either but it sounds promising).  Is there any other 
way to do a block-oriented remote copy?  Would LVM mirroring work as 
well or better than md-device raid?  The partition can stay mounted 
while the raid rebuilds but realistically not much else can be happening 
because of the performance impact, and I unmount momentarily while 
removing the member to get a clean filesystem.

Are there tricks with drbd or perhaps raid over iscsi that would let a 
periodic sync work incrementally - well enough to use over a WAN?

-- 
   Les Mikesell
     lesmikesell@gmail.com
