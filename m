Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2PFiNj22579
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 10:44:23 -0500
Received: from khe-mailhub1.eigner.com (khe-mailhub1.eigner.com
	[194.120.231.246])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2PFiKWA004854
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 10:44:21 -0500
Received: from agile.com (unknown [194.120.231.18])
	by khe-mailhub1.eigner.com (Postfix) with ESMTP id 74B68851
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 16:43:48 +0100 (CET)
Message-ID: <4062FE4B.2020205@agile.com>
Date: Thu, 25 Mar 2004 16:44:11 +0100
From: Klaus Strebel <klaus.strebel@agile.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Somewhat offtopic: Strange umount problem ....
References: <200403251534.47502.krienke@uni-koblenz.de>
In-Reply-To: <200403251534.47502.krienke@uni-koblenz.de>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Rainer Krienke wrote:
> Hello,
> 
> I have a problem with 3 server machines and I would as far as possible try to 
> isolate the bug which might be related to lvm or might not be. Perhaps 
> someone can help me where and how to look for the problem:
> 
> I am running 3 NFS and SMB servers (suse8.2; SuSE kernel 2.4.21-199, LVM 
> 2.2.00.05) which run perfectly stable but show a strange behaviour
> when rebooting the machines: The filesystems which contain user directories
> cannot be umounted since the kernel claims that they are still busy. When I
> switch to single user mode and run fuser -v or lsof on the mountpoints I
> see no output. There are no more smb or other processes in the processlist
> that might access the filesystems but nevertheless I cannot umount them.
> The output of fuser -v shows only  this:
> 
>                      USER        PID ACCESS COMMAND
> /export/user1        root     kernel mount  /export/user1
> 
> fuser -vm /export/user1 and lsof /export/user1  do not output anything.
> 
> The filesystems are xfs on top of LVM2 logical volumes which again run on
> top of a md raid1 softmirror (the one and only physical vol)  which is built 
> upon a md multipath device:
> 
> xfs_fs: LVM2: md_soft_raid1: md_multipath: Fibrechannel_hardware_raid_5
> 
> Basically all of the software except for LVM2 is a "original" suse 8.2 
> installation. 
>  

Hi Rainer,

is your NFS-server shutting down on reboot. That's typical behaviour for 
an NFS-Server. Perhaps an exportfs -au is missing. Shared filesystems 
cannot be umounted.

Ciao
Klaus
-- 
Klaus Strebel
UNIX-Engineer
<mailto:klaus.strebel@agile.com>

Agile Software GmbH
How Products Become Profits (TM)
Ruschgraben 133
D-76139 Karlsruhe
Office: +49 721 6291 0
Fax: +49 721 6291 1204
URL: <http://www.agile.com>
