Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA7GrBr11184
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2004 11:53:11 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA7Gr9ZW022845
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2004 11:53:09 -0500
Date: Sun, 7 Nov 2004 17:52:58 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] 'vgscan' at boot-up
Message-ID: <20041107165258.GG23551@percy.comedia.it>
References: <20041106011259.GB11112@nile.gs.washington.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041106011259.GB11112@nile.gs.washington.edu>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Nov 05, 2004 at 05:12:59PM -0800, David S. wrote:
>
>I'm using lvm2-2.00.15 and device-mapper-1.00.17 on a Slackware (x86)
>system, with a 2.6.9 kernel and udev-026.  I've created a volume
>group and a logical volume without any trouble, but the file system
>I built on the volume won't mount at boot-up.  That's apparently
>because the 'vgscan' program run from the system initialization
>script does not find an volume groups.  After the system boots,
>'vgscan' works fine.  I can get the file system mounted by putting
...
>in 'rc.local'.  Does anyone have a idea why 'vgscan' would fail
>in the sytem initialization script, but succeed in 'rc.local'?
>
wild guess,
udev has not yet created the block device file you require,
try putting udevstart in the system initialization script before vgscan

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
