Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5KJYrj5004282
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 15:34:53 -0400
Received: from ucsc.edu (massmail.ucsc.edu [128.114.129.84])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5KJYc3X020511
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 15:34:38 -0400
Received: from [128.114.125.126] (HELO ucsc.edu)
	by massmail.ucsc.edu (CommuniGate Pro SMTP 5.1.7)
	with ESMTPS id 35990115 for linux-lvm@redhat.com;
	Fri, 20 Jun 2008 12:34:37 -0700
Received: from [76.102.103.184] (account ermorris@ucsc.edu HELO [192.168.0.2])
	by email-prod-fe-2.ucsc.edu (CommuniGate Pro SMTP 5.1.11)
	with ESMTPSA id 118983061 for linux-lvm@redhat.com;
	Fri, 20 Jun 2008 12:34:34 -0700
Message-Id: <9DE31BCD-199C-412A-9C4E-6DECDB84B4CA@pmc.ucsc.edu>
From: Eli Morris <emorris@pmc.ucsc.edu>
In-Reply-To: <0748F01A-AAE0-4E18-AF1E-8ABDBBCDF2AA@redhat.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v924)
Subject: Re: [linux-lvm] Volume group "vgs" not found
Date: Fri, 20 Jun 2008 12:34:32 -0700
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

Thank you for helping. I kind of thought that it might be something  
like that. The 'vgs not found' was during bootup. Here is a snippet  
from /var/log/messages:

Jun 11 08:41:59 nimbus kernel: ehci_hcd 0000:00:1d.7: qh  
0000010000522320 (#0) state 1
Jun 11 08:42:02 nimbus smartd[5015]: Unable to register SCSI device / 
dev/sdb at line 30 of file /etc/smartd.conf
Jun 11 08:42:02 nimbus smartd[5015]: Unable to register device /dev/ 
sdb (no Directive -d removable). Exiting.
Jun 11 08:41:39 nimbus lvm[3104]: /var/log/lvm2.log: fopen failed: No  
such file or directory <14>Jun 11 08:41:39 lvm[3104]: Setti
ng log/activation to 1
Jun 11 08:41:39 nimbus lvm[3104]: No volume groups found
Jun 11 08:41:51 nimbus lvm[3910]: Volume group "vgs" not found
Jun 11 08:42:08 nimbus sshd[5180]: error: Bind to port 22 on 0.0.0.0  
failed: Address already in use.
Jun 11 08:42:08 nimbus xinetd[5195]: /etc/xinetd.d/RCS is not a  
regular file. It is being skipped.
Jun 11 08:42:08 nimbus nfsd[5273]: nfssvc_versbits: +2 +3 +4

This was before I turned on lvm logging or I guess I had just turned  
it on. I know I've seen the same vgs not found in that log also, but I  
can't find it in there now. It must have rotated out of the log file,  
or I'm imagining things. I'm rebooting next week, so I should see the  
message in the lvm log then. I will post it when I do.

Thanks again,

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
