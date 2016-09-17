Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HEedPu028926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 10:40:39 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 394ED159CE3
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 14:40:37 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 461F0A6807
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 16:40:38 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 17 Sep 2016 16:40:36 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <20160917134936.GF3302@soda.linbit>
References: <7e54ddf6638609d4e521287b51964ebd@dds.nl>
	<20160917134936.GF3302@soda.linbit>
Message-ID: <122228b22984be95a8978ee34307176d@dds.nl>
Subject: Re: [linux-lvm] creating DD copies of disks
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Lars Ellenberg schreef op 17-09-2016 15:49:
> On Sat, Sep 17, 2016 at 09:29:16AM +0200, Xen wrote:
>> I want to ask again:
>> 
>> What is the proper procedure when duplicating a disk with DD?
> 
> depends on what you define as "proper",
> what the desired outcome is supposed to look like.
> 
> What exactly are you trying to do?
> 
> If you intend to "clone" PVs of some LVM2 VG,
> and want to be able to activate that on the same system
> without first deactivating the "original",
> I suggest:
> 
> 1) create consistent snapshot(s) or clone(s) of all PVs
> 2) import them with "vgimportclone",
> which is a shell script usually in /sbin/vgimportclone,
> that will do all the neccessary magic for you,
> creating new "uuid"s and renaming the vg(s).

Right so that would mean first duplicating partition tables etc.

I will check that out some day. At this point it is already done, 
mostly. I didn't yet know you could do that, or what a "clone" would be, 
so thank you.


>> - my experience indicates that pvchange -ay on a PV that contains a
>> duplicate VG, even if it has a different UUID, but with an identical 
>> name,
>> creates problems.
> 
> You don't say...

I do say but this is very common and you can run into it without 
realizing, e.g. as you open some loopback image of some other system and 
you hadn't realized it would contain an identically named VG as your own 
system.

The issue is not that the problem happens, the issue is that you can't 
recover from it.

After both VGs are activated, in my experience, you are screwed. You may 
not be able to rename the 2nd PV, or even the first. I mean the VG 
sitting in that PV.

Sometimes it means having to reboot the system and then doing it again 
while renaming your own VG prior to loading the alien one.

This "you need foresight" situation is not very good.

Perhaps you can deactivate the new VG and close the PV and clear it from 
the cache; I'm not sure, back then my "skill" was not as great.

The problem really is that LVM will activate a second VG with the same 
name *just fine* without renaming it internally or even in display.

However, once it is activated, you are at a loss. So it will happily, 
without you being able to know about it in advance, create a difficult 
to reverse situation for you.

What if you *are* doing forensics (or recovery) as the Matthew person 
indicated? Are you now to give your own VGS completely unique names? 
Just so you can prevent any conflicts? Not a good situation.

LVM should really auto-rename conflicting VGS that get loaded after 
activation of the original ones, however it is hard to pick which one 
that should be, perhaps.

At least, maybe it should bolt before activating a duplicate and then 
require manual intervention.

Or, just make it easier to recover from the situation. It is just 
extremely common if you ever open an image of another disk (particularly 
if it's your own) or if you are doing anything with default "ubuntu-vg" 
or "kubuntu-vg" systems, in that sense.

I had a habit of calling my main VGs "Linux". Not any longer.

I now try to specify the system they are from, no matter how ugly.

Regards.
