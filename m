Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k05IUt117915
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 13:30:55 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k05IUtFl018993
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 13:30:55 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 089B3250BE
	for <linux-lvm@redhat.com>; Thu,  5 Jan 2006 11:30:29 -0700 (MST)
Date: Thu, 05 Jan 2006 11:30:33 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] Any way to recover "logical volumes"
Message-ID: <0F4AE41EEE8B69A5A2B84985@dhcp-2-206.wgops.com>
In-Reply-To: <POEPJKKIACNHGGMFNPNPGEIFGLAA.dan@absolutelynew.com>
References: <POEPJKKIACNHGGMFNPNPGEIFGLAA.dan@absolutelynew.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

vgscan
lvscan

which your startup scripts should be doing for you.  pvscan just 
finds/shows pv's

--On January 5, 2006 10:08:01 AM -0800 Dan Elder <dan@absolutelynew.com> 
wrote:

> Hi All, yesterday my main system drive crashed, leaving me with two 400GB
> LVM drives with data on them that I need to access. When I run pvscan I
> get the following info on a brand new system install with the LVM drives
> attached:
>
>  PV /dev/sda1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]
>  PV /dev/sdb1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]
>  Total: 2 [745.19 GB] / in use: 2 [745.19 GB] / in no VG: 0 [0   ]
>
>
> so I'm guessing(and hoping) that the data is still there, but I can't
> figure out the proper way to access or mount this. The VG says there are
> 0 logical volumes, is there a way to add the existing disks to this VG as
> logical volumes? I've been reading all of the howto's & forums & haven't
> found anything that works yet.
>
> Thanks in advance
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
