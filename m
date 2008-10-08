Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m98KmaPu014370
	for <linux-lvm@redhat.com>; Wed, 8 Oct 2008 16:48:36 -0400
Received: from ucsc.edu (massmail.ucsc.edu [128.114.129.84])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m98KmY79011180
	for <linux-lvm@redhat.com>; Wed, 8 Oct 2008 16:48:34 -0400
Received: from [128.114.125.120] (HELO ucsc.edu)
	by massmail.ucsc.edu (CommuniGate Pro SMTP 5.1.7)
	with ESMTPS id 40652650 for linux-lvm@redhat.com;
	Wed, 08 Oct 2008 13:48:33 -0700
Received: from [24.5.124.163] (account ermorris@ucsc.edu HELO [10.0.1.200])
	by email-prod-fe-1.ucsc.edu (CommuniGate Pro SMTP 5.1.11)
	with ESMTPSA id 172535722 for linux-lvm@redhat.com;
	Wed, 08 Oct 2008 13:48:13 -0700
Message-Id: <AAB2F6AF-589C-44C0-9BB0-8BA831068EC7@pmc.ucsc.edu>
From: Eli Morris <emorris@pmc.ucsc.edu>
In-Reply-To: <D1CA7710-F172-4749-8B4C-2A46C384906A@pmc.ucsc.edu>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Volume group "vgs" not found
Date: Wed, 8 Oct 2008 13:48:12 -0700
References: <EDDC9BAC-A82E-4D93-AA6D-BDCA1E0E1714@pmc.ucsc.edu>
	<0748F01A-AAE0-4E18-AF1E-8ABDBBCDF2AA@redhat.com>
	<D1CA7710-F172-4749-8B4C-2A46C384906A@pmc.ucsc.edu>
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

Hi All,

Does anyone know if lvm volumes won't be activated because of a  
different partition type other than 'lvm'? My disks that compose my  
lvm volumes are type 'EFI GPT (code ee)', instead of 'lvm' (code 8e)  
for the disk partition type.

The problem, in case, this doesn't make it into the correct thread, is  
that my lvm volume is not activated on boot. I can activate it  
normally, with the command 'vgchange -ay name', however, after the  
system is booted. I'm running Centos 4.

Also, is it possible to change the partition type of disks that  
comprise an lvm2 volume without causing problems to the data that is  
residing in the lvm2 volume?

thanks,

Eli
