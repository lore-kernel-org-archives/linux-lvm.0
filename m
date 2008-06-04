Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m540KYrt009765
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 20:20:34 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.240])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m540KJiD003661
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 20:20:19 -0400
Received: by an-out-0708.google.com with SMTP id d31so545321and.124
	for <linux-lvm@redhat.com>; Tue, 03 Jun 2008 17:20:19 -0700 (PDT)
Message-ID: <87f94c370806031720ybdc557ax303c03fb8f4e56ff@mail.gmail.com>
Date: Tue, 3 Jun 2008 20:20:19 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <1212537926.2724.16.camel@behemoth.csg.stercomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525819.19122.16.camel@behemoth.csg.stercomm.com>
	<1212536286.29076.202.camel@pc.ilinx>
	<1212537926.2724.16.camel@behemoth.csg.stercomm.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Your making it too complicated.

Effectively the snapshot immediately becomes the primary volume and a
bunch of stuff goes on in the background to sync the true primary and
the other snapshots to it.

After everything is in sync, the snapshot is deleted and the true
primary once again becomes the logical primary.

Greg

On Tue, Jun 3, 2008 at 8:05 PM, Chris Cox <chris_cox@stercomm.com> wrote:
> On Tue, 2008-06-03 at 19:38 -0400, Brian J. Murrell wrote:
>> On Tue, 2008-06-03 at 15:43 -0500, Chris Cox wrote:
>> >
>> > I would think this would be VERY hard to do since both the "origin" and
>> > "snapshot" change (file deletes, etc).
>>
>> I don't think it's as difficult as you are thinking it is.  You are
>> thinking of synchronizing filesystems, at the filesystem level, but
>> merging a snapshot back up into the origin does not deal with files or
>> even filesystems.  It deals with block devices and blocks, and is really
>> nothing more than a coordinated:
>>
>> for each COW_block in snapshot; do
>>     for other_snapshot of origin; do
>>         copy origin[COW_block] to other_snapshot[COW_block]
>>         copy snapshot[COW_block] to origin[COW_block]
>>     done
>> done
>>
>> > Do you have a set of rules you
>> > use for the merge?
>>
>> There is no filesystem level merge.  There are no rules needed.
>
> Ok... I'm still a bit confused (sorry)... I'm going to assume
> a last out wins scenario with regards to meta data conflicts
> ... yes.. I know, I'm having a tough time separating out the
> filesystem element from the block device :)
>
> Thanks for the answer... it does make sense (just makes my
> brain hurt).
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Greg Freemyer
Litigation Triage Solutions Specialist
http://www.linkedin.com/in/gregfreemyer
First 99 Days Litigation White Paper -
http://www.norcrossgroup.com/forms/whitepapers/99%20Days%20whitepaper.pdf

The Norcross Group
The Intersection of Evidence & Technology
http://www.norcrossgroup.com
