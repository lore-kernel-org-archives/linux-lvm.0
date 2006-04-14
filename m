Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3ELb8EQ011944
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 17:37:08 -0400
Received: from mail.nmr.mgh.harvard.edu (mail.nmr.mgh.harvard.edu
	[132.183.202.9])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3ELb2FH018352
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 17:37:02 -0400
Date: Fri, 14 Apr 2006 17:36:52 -0400 (EDT)
From: Paul Raines <raines@nmr.mgh.harvard.edu>
Subject: Re: [linux-lvm] LVM2, NFS and random device (major:minor) numbers
In-Reply-To: <000801c66005$979d28c0$64c8a8c0@balefirehome>
Message-ID: <Pine.LNX.4.62.0604141722240.4454@gate.nmr.mgh.harvard.edu>
References: <000801c66005$979d28c0$64c8a8c0@balefirehome>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Sander Steffann <s.steffann@computel.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 14 Apr 2006, Sander Steffann wrote:
>> NFS depends on what the server says the underlying device id is of the
>> exported volume and if that changes, then NFS mounts are going to change
>> out from under themselves.  And everytime I add a volume and reboot the
>> device ids change.
>
> Unfortunate, but true. One of the side-effects of having dynamic volumes.
> Also note that you would get similar trouble if, for example, you added a
> SCSI device with a lower SCSI-id than an existing SCSI device. /dev/sdb1
> would become /dev/sdc1, etc.

True, but that is a lot more obvious to an admin when it happens because 
the ARE adding a new device to the system.  Also, ironically, lvm1 actually 
protected a user from having the device id change on them due to just 
adding a new disk.  In fact making such physical device issues not a factor 
seems to be a feature of LVM the way PVs have unique UUIDs

>> I finally come upon this old post to this list:
>> http://www.redhat.com/archives/linux-lvm/2005-May/msg00029.html
>
> The part that can solve everything for you is:
>>> These days, that's configurable.
>>> See 'man exports' fsid=num.
>
> With an explicit fsid=n for every export, you tell the NFS server to ignore
> the device-id, and use the specified fsid instead. That way you get
> consistent NFS exports, without being dependent on the underlying
> device-ids.
>

I have reasons besides NFS I need the device id to be persistant.
So I want to use the -My option and would like to know if it is safe
to do on volumes in use.

> I have had the same trouble as you have, and this solution works great.

I think this speaks poorly of LVM2 that this issue which is such a big 
change from LVM1 (which was explictly patched at one point to "fix" this 
changing device ID issue) is not more well documented.  Sure, docs about 
LVM2 do say the big change is the use of the device-mapper.  But the final 
implications of this difference such as this NFS fsid issue are by no means 
obvious.


One thing I don't understand about not being able to set the major number 
in the 2.6 kernel is that since 253 will be the major number for all 
volumes, then is 256 the maximum number of LVM volumes one can have on a 
single system?  Or will the major number increment to 254 randomly
and there is no way to control it?
