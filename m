Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6ULjD4U025593
	for <linux-lvm@redhat.com>; Wed, 30 Jul 2008 17:45:13 -0400
Received: from ucsc.edu (massmail.ucsc.edu [128.114.129.84])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6ULiwUB000957
	for <linux-lvm@redhat.com>; Wed, 30 Jul 2008 17:44:58 -0400
Received: from [128.114.125.120] (HELO ucsc.edu)
	by massmail.ucsc.edu (CommuniGate Pro SMTP 5.1.7)
	with ESMTPS id 37478967 for linux-lvm@redhat.com;
	Wed, 30 Jul 2008 14:44:57 -0700
Received: from [24.5.124.163] (account ermorris@ucsc.edu HELO [10.0.1.200])
	by email-prod-fe-1.ucsc.edu (CommuniGate Pro SMTP 5.1.11)
	with ESMTPSA id 135103613 for linux-lvm@redhat.com;
	Wed, 30 Jul 2008 14:44:44 -0700
Message-Id: <D1CA7710-F172-4749-8B4C-2A46C384906A@pmc.ucsc.edu>
From: Eli Morris <emorris@pmc.ucsc.edu>
In-Reply-To: <0748F01A-AAE0-4E18-AF1E-8ABDBBCDF2AA@redhat.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v926)
Subject: Re: [linux-lvm] Volume group "vgs" not found
Date: Wed, 30 Jul 2008 14:44:43 -0700
References: <EDDC9BAC-A82E-4D93-AA6D-BDCA1E0E1714@pmc.ucsc.edu>
	<0748F01A-AAE0-4E18-AF1E-8ABDBBCDF2AA@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I finally got a chance to reboot and get back to this problem. Here is  
a bit from rc.sysinit.

[root@nimbus etc]# more rc.sysinit | grep lvm
if [ -x /sbin/lvm.static -o -x /sbin/multipath.static -o -x /sbin/ 
dmraid ]; then
     if [ -x /sbin/lvm.static ]; then
	    action $"Setting up Logical Volume Management:" /sbin/lvm.static  
vgchange -a y --ignorelockingfailure
		if [ -x /sbin/lvm.static ]; then
			action $"Setting up Logical Volume Management:" /sbin/lvm.static  
vgchange -a y --ignorelockingfailure
		if [ -x /sbin/lvm.static ]; then
			action $"Setting up Logical Volume Management:" /sbin/lvm.static  
vgchange -a y --ignorelockingfailure


  I think the error happens during boot, because like you said there  
is some sort of problem with the initialization script. Here is a  
snippet from the lvm2.log during bootup:

lvmcmdline.c:877   Parsing: /usr/sbin/vgchange --monitor y vgs
lvmcmdline.c:905 vgchange  Processing: /usr/sbin/vgchange --monitor y  
vgs
lvmcmdline.c:908 vgchange  O_DIRECT will be used
config/config.c:952 vgchange  Setting global/locking_type to 1
locking/locking.c:222 vgchange  File-based locking selected.
config/config.c:929 vgchange  Setting global/locking_dir to /var/lock/ 
lvm
toollib.c:560 vgchange  Using volume group(s) on command line
locking/file_locking.c:164 vgchange  Locking /var/lock/lvm/V_vgs WB
toollib.c:506 vgchange  Finding volume group "vgs"

Any ideas? Thanks,

Eli



On Jun 19, 2008, at 11:30 AM, Jonathan Brassow wrote:

> if you can activate the volume group once the machine is up, it  
> sounds like there is a problem in the initrd.  Perhaps the static  
> binaries there or the lvm config file it contains...
>
> You turned on logging... When you see "vgs" not found, is that  
> during bootup, or after?
>
> ('vgs' is an LVM command.  There could be a script somewhere that is  
> duplicating the string 'vgs' and inadvertently sending it as an  
> argument...)
>
> Might need more information for this one... :(
>
> brassow
>
> On Jun 12, 2008, at 11:23 AM, Eli Morris wrote:
>
>> Dear all,
>>
>> 	I'm running Centos 4, as part of a Rocks cluster. I have a 13 TB  
>> lvm2 volume. At boot up, the volume group doesn't get activated.  
>> When I run 'vgchange -ay' it activates the volume group without  
>> error and I can then mount it. I've turned lvm logging on and I  
>> notice the message 'toollib.c:508 vgchange  Volume group "vgs" not  
>> found'. I don't think I have a 'vgs' volume group. At least I don't  
>> find I have one if I use tools like 'vgscan'. The only thing that  
>> shows up is my 13 TB volume, as it should be. I haven't been able  
>> to find any information on such an error. I used yum update to make  
>> sure I had the latest lvm2 packages for my distro. I can't upgrade  
>> distros, because that would screw other stuff up. Any info on this,  
>> or recommendations as to how I could track it down?
>>
>> Thanks,
>>
>> Eli
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
