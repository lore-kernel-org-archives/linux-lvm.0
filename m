Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB8L0JE2015690
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2014 16:00:19 -0500
Received: from smtprelay.hostedemail.com (smtprelay0126.hostedemail.com
	[216.40.44.126])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB8L0GMm014677
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2014 16:00:17 -0500
References: <5480E939.3070702@ubuntu.com>
	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
	<5484C5A7.8080601@ubuntu.com>
	<CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
Date: Mon, 08 Dec 2014 14:59:59 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Jason Warr" <jason@warr.net>
Message-ID: <op.xqkhx9gjae9kta@comodus>
In-Reply-To: <CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>, Anatoly
	Pugachev <matorola@gmail.com>

On Mon, 08 Dec 2014 02:30:06 -0600, Anatoly Pugachev <matorola@gmail.com>  
wrote:

> On Mon, Dec 8, 2014 at 12:24 AM, Phillip Susi <psusi@ubuntu.com> wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA512
>>
>> On 12/05/2014 05:12 AM, Anatoly Pugachev wrote:
>> > Phillip,
>> >
>> > can you please paste the commands you've used to convert the
>> > volume? I don't have ubuntu , but rhel7 manual page for lvconvert,
>> > example section is pretty clear on how to convert back to flat
>> > (-m0) volume and what physical device you remove from logical
>> > volume, quote:
>> >
>> >
>> > Converts mirror logical volume "vg00/lvmirror1" to linear, freeing
>> > physical extents from /dev/sda:
>> >
>> > lvconvert -m0 vg00/lvmirror1 /dev/sda
>>
>> I simply used lvconvert -m0 vg/lv.  I did not think I would need to
>> specify which leg should be kept; obviously it should be the one
>> currently in use rather than the out of date copy.
>
>
> I wonder how many more people would lost their data before there would
> be changes to lvconvert -m0 to require specification of physicalVolume
> instead of optional requirement.
>

I may have missed part of the discussion but in order to fully understand  
what is going on I'd like to know what arguments you used when you issued  
the "lvconvert --splitmirrors" command.  There are several options to it  
that can influence what happens to the mirror members.

The best way I know of to get that is from the /etc/lvm/archive/ files for  
the volume group in question.  Those contain the maps for the volume  
group.  A new map version is created in that directory after every command  
that modifies the volume group.  Each map contains a "description" line  
that shows the command that was run making the changes.  The map does not  
include the changes as it is meant to be used as a reference to the  
configuration before the change.

If you only want to send the commands as pulled from the archive maps here  
is an example from the system I have been trying to re-create this failure  
scenario on.

[2:root@hostname /root]# grep Created /etc/lvm/archive/test01VG_0000*
/etc/lvm/archive/test01VG_00000-1787228376.vg:description = "Created  
*before* executing 'vgcreate test01VG /dev/sdar /dev/sdas /dev/sdat  
/dev/sdau /dev/sdav /dev/sdaw /dev/sdax'"
/etc/lvm/archive/test01VG_00001-1025082804.vg:description = "Created  
*before* executing 'lvcreate -L50G -m1 --type raid1 test01VG -n test01LV'"
/etc/lvm/archive/test01VG_00002-178937097.vg:description = "Created  
*before* executing 'lvconvert --splitmirrors 1 --name test01LV-M1  
test01VG/test01LV'"
