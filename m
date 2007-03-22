Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2MKwpE8028605
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 16:58:51 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2MKwl3Z014430
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 16:58:48 -0400
Message-ID: <4602EDFF.20301@arabidopsis.info>
Date: Thu, 22 Mar 2007 20:58:39 +0000
From: Tim Milstead <tim@arabidopsis.info>
MIME-Version: 1.0
Subject: Re: [linux-lvm] failing hard drive
References: <4602A28E.8010502@arabidopsis.info> <4602A6CA.6050809@redhat.com>
In-Reply-To: <4602A6CA.6050809@redhat.com>
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

Bryn M. Reeves wrote:

SNIP
>> It would be nice if I could just dd the failing drive onto the new drive
>> and replace it (using linux on a cd) but I have no reason to believe
>> this will work - will it?
>>     
>
> This should work OK, although as usual with backups you want to make
> sure that nothing is writing to the disk while you take the dd - using a
> rescue CD would be fine, or deactivating the volume group before
> starting (but if it includes your root file system then you will need to
> use a rescue CD).
>   
I have made the copy using a rescue CD and an external USB drive. 
Fitting the replacement internally is going to be difficult hence the 
question about doing it this way. Are you sure? I was just worried that 
perhaps LVM looked beyond a simple '/dev/hde' referred to drives in some 
deeper way e.g. serial number, model, make etc.
>   
>> Has anyone got a step by step guide of what to do? I guess I must shrink
>> the filesystem and then whatever that sits on.
>>     
>
> That may work, but you'll need to make enough space within the VG to
> accommodate all the data that is currently stored on the failing hde.
>
> To do this, you first have to shrink file systems from the VG, then
> shrink the logical volumes (LVs) that the file systems are sitting on.
>
> Another option would be to add the new drive to the system and run:
>
> pvcreate /path/to/new/disk
>
> followed by:
>
> vgextend <VG name> /path/to/new/disk
>   
Thanks.
> To temporarily bring the VG up to 10 disks to allow you to remove the
> failing member. You should then find the "pvmove /dev/hde" works as
> expected (assuming the new disk is at least as big as the one you are
> replacing).
>   
Yes, but given the space constraints I'd rather avoid this.
>   
>> This seems to depend on the version of LVM one is running. I have no
>> idea what version comes with Fedora Core 4 or how to find out.
>>     
>
> You'll have lvm2 in FC4, although it's a relatively old version now.
>
> Kind regards,
>
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFGAqbK6YSQoMYUY94RAlG0AJwPGQ60wQ6NyjnouTL9/NsY0fyrwACfdGeS
> pyksRh8UAdGrSwlbm2HJ+tI=
> =39ku
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
