Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0KKVkXu025495
	for <linux-lvm@redhat.com>; Sat, 20 Jan 2007 15:31:46 -0500
Received: from smtp7-g19.free.fr (smtp7-g19.free.fr [212.27.42.64])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0KKVj4W019312
	for <linux-lvm@redhat.com>; Sat, 20 Jan 2007 15:31:45 -0500
Received: from [192.168.0.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp7-g19.free.fr (Postfix) with ESMTP id 9068F5554
	for <linux-lvm@redhat.com>; Sat, 20 Jan 2007 21:31:44 +0100 (CET)
Message-ID: <45B27C2F.5070602@free.fr>
Date: Sat, 20 Jan 2007 21:31:43 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirroring my install. Lots of problems !
References: <1168854146.45ab4c8281ce4@imp6-g19.free.fr>
	<20070119071211.GB31075@percy.comedia.it>
In-Reply-To: <20070119071211.GB31075@percy.comedia.it>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Luca Berra a �crit :
> On Mon, Jan 15, 2007 at 10:42:26AM +0100, Georges Giralt wrote:
> ...
>> The conversion was a failure, because the tools asked for a THIRD disk 
>> in order
>> to mirror the VG. Funny. I thought GNU/Linux was clever, I was wrong. 
>> How come
>> HP-UX or Aix can do LVM mirror on 2 disks and not Linux ? (the corelog 
>> option
>> is also an issue, as reconstruction will take place at every reboot 
>> which occur
>> often as this is a home box, not a server)
> i am still waiting for the lvm mirror interface to settle before trying
> to use it, so i cannot comment...
> 
>> So I decided to try a more complex approach : Create a mirror using 
>> the mdtools
>> (mdadm) and turn this into a VG. My plan was as follow :
>> 1) create a critical mirror using mdadm with only one copy active on 
>> hdb2 repeat
>> with hdb3.
>> 2) pvcreate md0 and md1
>> 3) add md0 to vg0 and md1 to vg-ext
>> 4) pvmove all vg0 lv to md0 and all vg-ext lv to md1.
>> 5) vgreduce vg0 to remove hda2 and vg-ext to remove hda3
>> 6) add hda2 to md0 and hda3 to md1 and force re-sync
>> 7) have a beer, and enjoy.
> this is the best part of your plan :)
>> Again, a disaster. I CAN'T add an md to a vg and have the vg work. 
>> I've tried to
>> do it using plain md0 to pvcreate, partitionning md0 to create md0p1 and
>> pvcreate this (it's impossible, as there is no /dev/md0p1 device...)
> can you please be more verbose as to why you can't add an md to a vg
> eg showing logs and output of lvm commands with verbose options.
> i usually pvcreate md devices without any problem.
> 
> regards,
> L.
> 
Hi Luca !
So I've got some beer, and re-tried a lot of things to mirror my install.
First, I've added a third disk in my box hopping it would be easier to 
mirror the vg/lv using lvm as I've trouble going the raid way.
here are one message I get when I try to mirror an lv using 3 disks and 
system-config-lvm which is a Fedora GUI :
pvmove command failed. Command attempted: "/usr/sbin/pvmove --name 
/dev/vgF32/lv1 /dev/hda3:0-2559 /dev/sda3" - System Error Message: 
device-mapper: reload ioctl failed: Invalid argument
   ABORTING: Temporary mirror activation failed.  Run pvmove --abort.
   device-mapper: reload ioctl failed: Invalid argument
   device-mapper: reload ioctl failed: Invalid argument
I get quite the same message if I try to move one "physical" PV (say 
hda3 to a mirrored device say md0.
So I'm left with no mirroring whatever solution I try to use...
Here is my configuration :
hda IDE 160GB disk
hdb same disk as above
sda Sata 160GB disk same make and model as above except for SATA of course.
The VG/LV I try t mirror is a 55GB vg which comprises 4 lv (10G,used as 
/; 4G (swap); 10G used as /usr and 10G used as /var ) which hold a 32 
bits version of FC6
I'm running kernel 2.6.19-1.2895.fc6 which is the last Fedora 6 one,
lvm is :
lvm> version
   LVM version:     2.02.06 (2006-05-12)
   Library version: 1.02.07 (2006-05-11)
   Driver version:  4.10.0
lvm>
And please don't tell me to use the latest one as I _do_ prefer not to 
install a non pre packaged version of software... It makes Fedora behave 
quite strangely...
thanks for your help !
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
