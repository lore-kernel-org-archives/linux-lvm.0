Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m52D1clg026767
	for <linux-lvm@redhat.com>; Mon, 2 Jun 2008 09:01:38 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.247])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m52D1F6E027000
	for <linux-lvm@redhat.com>; Mon, 2 Jun 2008 09:01:15 -0400
Received: by an-out-0708.google.com with SMTP id d31so322119and.124
	for <linux-lvm@redhat.com>; Mon, 02 Jun 2008 06:01:15 -0700 (PDT)
Message-ID: <87f94c370806020601h6a4b4ff1s20f89899ce1848f5@mail.gmail.com>
Date: Mon, 2 Jun 2008 09:01:14 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
In-Reply-To: <20080601230039.GO19431@lug-owl.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080529231213.GY19431@lug-owl.de>
	<48430FED.1080306@theendofthetunnel.de>
	<20080601230039.GO19431@lug-owl.de>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>, Maximilian Wilhelm <max@rfc2324.org>

2008/6/1 Jan-Benedict Glaw <jbglaw@lug-owl.de>:
> On Sun, 2008-06-01 23:09:01 +0200, Hannes Dorbath <light@theendofthetunnel.de> wrote:
>> Jan-Benedict Glaw wrote:
>> > However I still fail to find a good approach. One initial idea was to
>> > export all physical volumes (partitions or full disks) vie NBD, join
>> > them all on a single machine into one VG/LV, create a filesystem and
>> > re-export that via NFS/SMB/...  However, all data would need to go
>> > through the net twice. While speed isn't the most important thing here
>> > (but storage is!), that's way suboptimal.
>>
>> GlusterFS with Unify translator is exactly what you are asking for.
>>
>> http://www.gluster.org/docs/index.php/GlusterFS
>
> Already had a look at that, too. "Unify" seems to not directly
> implement any measure of redundancy. So if one Brick goes down,
> everything that was there is gone. Maybe its possible to play with the
> `mirror' translator as well, but on the first look, it seems to be
> non-trivial to accomodate for a steady loss and addition of bricks.
>
> MfG, JBG

I haven't seen Lustre mentioned in this thread.  I think there is
kernel support, etc.  May be worth checking out. (I have not used it.)

Quoting wikipedia http://en.wikipedia.org/wiki/Lustre_(file_system)
===
High availability

Lustre file system high availability features include a robust
failover and recovery mechanism, making server failures and reboots
transparent. Version interoperability between successive minor
versions of the Lustre software enables a server to be upgraded by
taking it offline (or failing it over to a standby server), performing
the upgrade, and restarting it, while all active jobs continue to run,
merely experiencing a delay.

Lustre MDSs are configured as an active/passive pair, while OSSs are
typically deployed in an active/active configuration that provides
redundancy without extra overhead. Often the standby MDS is the active
MDS for another Lustre file system, so no nodes are idle in the
cluster.
===

Greg
-- 
Greg Freemyer
Litigation Triage Solutions Specialist
http://www.linkedin.com/in/gregfreemyer
First 99 Days Litigation White Paper -
http://www.norcrossgroup.com/forms/whitepapers/99%20Days%20whitepaper.pdf

The Norcross Group
The Intersection of Evidence & Technology
http://www.norcrossgroup.com
