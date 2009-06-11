Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5BCUhdH014317
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 08:30:43 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5BCUUdW020639
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 08:30:30 -0400
Received: from ns1.futuresource.com ([10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n5BCUTs9009297
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 07:30:29 -0500
Received: from Jill-Mikesells-Computer.local ([10.200.1.18])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n5BCUSr26083
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 07:30:29 -0500
Message-ID: <4A30F8E3.5090508@gmail.com>
Date: Thu, 11 Jun 2009 07:30:27 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data deduplication in LVM?
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>	<Pine.LNX.4.64.0906101822350.30724@bmsred.bmsi.com>
	<0CCC4321-943D-406A-A1BB-48E2BD6B0857@karlsbakk.net>
In-Reply-To: <0CCC4321-943D-406A-A1BB-48E2BD6B0857@karlsbakk.net>
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

Roy Sigurd Karlsbakk wrote:
> On 11. juni. 2009, at 00.30, Stuart D. Gathman wrote:
> 
>> One OSS backup product that does
>> deduplication is BackupPC (written in Perl).  In the backup server, 
>> every file
>> gets hard linked to a name in a special directory that is its md5 
>> checksum
>> (plus some fiddly logic to handle metadata)
> 
> 
> This sounds like file-level deduplication. Most storage systems sing 
> dedup, uses block-level dedup. NetApp is one example; they dedup 
> everything with 4k blocks, doing the actual deduplication at night.

Yes, it is a different concept.  However it does work very well when you 
are storing your backups on a filesystem without block-level dedup.  And 
that is probably the place where you have the most redundancy - or if 
you don't already, you'll be able to store a much longer history.

-- 
   Les Mikesell
    lesmikesell@gmail.com
