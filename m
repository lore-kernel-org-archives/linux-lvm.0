Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sADJRpSC021501
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 14:27:51 -0500
Received: from golfcontact.eu (golfcontact.eu [62.210.207.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sADJRmgx011402
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 14:27:49 -0500
Received: from [10.0.0.140] (143.141.broadband17.iol.cz [109.80.141.143])
	by golfcontact.eu (Postfix) with ESMTPSA id 5BBE228807EB
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 20:27:47 +0100 (CET)
Message-ID: <54650631.4020707@ttux.net>
Date: Thu, 13 Nov 2014 20:27:45 +0100
From: Marc des Garets <marc@ttux.net>
MIME-Version: 1.0
References: <5463DC2D.5020305@ttux.net>
	<CAD+pdNfniQEczbEO1aP+f2E-XhqjvnYrPSf+ig+OQzO6G+Gtbw@mail.gmail.com>
In-Reply-To: <CAD+pdNfniQEczbEO1aP+f2E-XhqjvnYrPSf+ig+OQzO6G+Gtbw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] broken fs after removing disk from group
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

Obviously data on the bad disk is gone. Can you explain why the entire 
file system is gone also?

I did what I said in my previous email and so far it has worked pretty 
well. The idea came from this: 
https://www.novell.com/coolsolutions/appnote/19386.html#DiskPermanentlyRemoved

So I took a disk and did the: pvcreate --uuid 
NOskcl-8nOA-PpZg-DCtW-KQgG-doKw-n3J9xd --restorefile 
VolGroup00_00001-16738001.vg /dev/sdc1

The restorefile being the config before the disk died.

Then I did vgcfgrestore with the VolGroup00_00001-16738001.vg followed 
by vgscan and vgchange -ay VolGroup00

All the above went well, exactly like on the novell.com link.

pvdisplay shows the 3 disks exactly like before I had the one that died 
but the e2fsck (or fsck.ext4) tells me:
The filesystem size (according to the superblock) is 675863552 blocks
The physical size of the device is 597721088 blocks
Either the superblock or the partition table is likely to be corrupt!
Abort<y>?

That's what I don't understand, shouldn't the size of the device be back 
to 675863552 blocks and so I should be able to do the fsck without 
getting this warning?

Thanks.

On 11/13/2014 01:38 PM, Matthew Patton wrote:
>
> Dude seriously?  Any data that was on the bad disk is gone including 
> the ENTIRE file system if any of it resided on said disk.
>
> Moral of the story use better disks and don't spread file systems 
> across multiple devices.
On 11/13/2014 12:11 AM, Fran Garcia wrote:
> On Wed, Nov 12, 2014 at 11:16 PM, Marc des Garets wrote:
>> Hi,
>> [...]
>> Now the problem is that I can't mount my volume because it says:
>> wrong fs type, bad option, bad superblock
>>
>> Which makes sense as the size of the partition is supposed to be 2.4Tb but
>> now has only 2.2Tb. Now the question is how do I fix this? Should I use a
>> tool like testdisk or should I be able to somehow create a new physical
>> volume / volume group where I can add my logical volumes which consist of 2
>> physical disks and somehow get the file system right (file system is ext4)?
> So you basically need a tool that will "invent" about 200 *Gb* of
> missing filesystem? :-)
>
> I think you better start grabbing your tapes for a restore...
>
> ~f
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
