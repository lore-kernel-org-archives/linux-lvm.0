Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA69war13773
	for <linux-lvm@redhat.com>; Sat, 6 Nov 2004 04:58:36 -0500
Received: from sutr101.sanderscorner.com (sanderscorner.demon.nl
	[212.238.245.37])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA69wZOb008643
	for <linux-lvm@redhat.com>; Sat, 6 Nov 2004 04:58:36 -0500
Message-ID: <418CA044.1090505@sanderscorner.com>
Date: Sat, 06 Nov 2004 10:58:28 +0100
From: Sander <sander@sanderscorner.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 'vgscan' at boot-up
References: <20041106011259.GB11112@nile.gs.washington.edu>
In-Reply-To: <20041106011259.GB11112@nile.gs.washington.edu>
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

David S. wrote:

>I'm using lvm2-2.00.15 and device-mapper-1.00.17 on a Slackware (x86)
>system, with a 2.6.9 kernel and udev-026.  I've created a volume
>group and a logical volume without any trouble, but the file system
>I built on the volume won't mount at boot-up.  That's apparently
>because the 'vgscan' program run from the system initialization
>script does not find an volume groups.  After the system boots,
>'vgscan' works fine.  I can get the file system mounted by putting
>
>	/sbin/vgscan 2>/dev/null
>	sleep 10
>	/sbin/vgchange -ay
>	/sbin/mount -a
>
>in 'rc.local'.  Does anyone have a idea why 'vgscan' would fail
>in the sytem initialization script, but succeed in 'rc.local'?
>
>David S.
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>  
>
What version of Slackware? I use LVM with 8.1 and 9.1. In 9.1 it should 
work 'out-of-the-box' in 8.1 I had to put the LVM mounting stuf  my 
self. Did you put  / on a logical volume? Is /proc mounted before you 
try to bring the volumes online (i remember I had to do that in 8.1)

Sander
