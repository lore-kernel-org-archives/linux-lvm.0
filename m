Received: from pobox.corp.redhat.com (pobox.corp.redhat.com [10.11.255.20])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5JIV634018914
	for <linux-lvm@redhat.com>; Thu, 19 Jun 2008 14:31:06 -0400
Received: from [192.168.1.101] (vpn-14-123.rdu.redhat.com [10.11.14.123])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5JIV6sq027660
	for <linux-lvm@redhat.com>; Thu, 19 Jun 2008 14:31:06 -0400
Message-Id: <0748F01A-AAE0-4E18-AF1E-8ABDBBCDF2AA@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <EDDC9BAC-A82E-4D93-AA6D-BDCA1E0E1714@pmc.ucsc.edu>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v924)
Subject: Re: [linux-lvm] Volume group "vgs" not found
Date: Thu, 19 Jun 2008 13:30:54 -0500
References: <EDDC9BAC-A82E-4D93-AA6D-BDCA1E0E1714@pmc.ucsc.edu>
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

if you can activate the volume group once the machine is up, it sounds  
like there is a problem in the initrd.  Perhaps the static binaries  
there or the lvm config file it contains...

You turned on logging... When you see "vgs" not found, is that during  
bootup, or after?

('vgs' is an LVM command.  There could be a script somewhere that is  
duplicating the string 'vgs' and inadvertently sending it as an  
argument...)

Might need more information for this one... :(

  brassow

On Jun 12, 2008, at 11:23 AM, Eli Morris wrote:

> Dear all,
>
> 	I'm running Centos 4, as part of a Rocks cluster. I have a 13 TB  
> lvm2 volume. At boot up, the volume group doesn't get activated.  
> When I run 'vgchange -ay' it activates the volume group without  
> error and I can then mount it. I've turned lvm logging on and I  
> notice the message 'toollib.c:508 vgchange  Volume group "vgs" not  
> found'. I don't think I have a 'vgs' volume group. At least I don't  
> find I have one if I use tools like 'vgscan'. The only thing that  
> shows up is my 13 TB volume, as it should be. I haven't been able to  
> find any information on such an error. I used yum update to make  
> sure I had the latest lvm2 packages for my distro. I can't upgrade  
> distros, because that would screw other stuff up. Any info on this,  
> or recommendations as to how I could track it down?
>
> Thanks,
>
> Eli
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
