Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9EIJPr08108
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 14:19:25 -0400
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx1.redhat.com (8.12.11/8.12.10) with SMTP id i9EIJOxK005031
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 14:19:25 -0400
Subject: Re: [linux-lvm] Creating snapshot on / hangs machine
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <26B6D679-1E0D-11D9-806D-000A9566A350@DDG.com>
References: <BAY17-F41JPv00J6gX2000169b9@hotmail.com>
	<26B6D679-1E0D-11D9-806D-000A9566A350@DDG.com>
Date: Thu, 14 Oct 2004 11:19:23 -0700
Message-Id: <1097777963.15099.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2004-10-14 at 13:16 -0500, Andrew W. Donoho wrote:
> 
> 
> ______________________________________________________________________
> 
> 
> On Oct 14, 2004, at 11:31, Kai Leibrandt wrote:
>         As soon as I create a snapshot on / however, the machine
>         hangs, although X still works (well, the mouse still moves),
>         it is no longer possible to open a new shell, switch consoles,
>         or even <CTRL>C the lvcreate.
>         
>         I have tried this with ext2 as well as with xfs, including
>         doing xfs_freeze before taking the snapshot, so I don't think
>         it's a filesys related matter.
>         
>         Is there anything I am missing here? Is it even supported to
>         do / snapshots?
> 
> 
> Kai,
> 
> I reported a similar problem starting with my root partition when I
> added a second drive. After a bit of skullduggery, I believe that LVM
> activities on the root partition particularly stress the memory
> system. Or, at least, when I slowed the memory system down on my
> x86-64 machine, I no longer get crashes like you describe above. 
> 


Weird.. I thought the problem was that LVM was causing the atime on
the /dev entries to be updated, which required write access, but there
was a lock on the filesystem while the snapshot was created.
