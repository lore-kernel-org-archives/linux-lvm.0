Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2BCPF823357
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 07:25:15 -0500
Received: from bucket.localnet (i125-043.nv.iinet.net.au [203.59.125.43])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2BCP807021730
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 07:25:13 -0500
Received: from [127.0.0.1] (6to4-localhost [127.0.0.1] (may be forged))
	by bucket.localnet (8.12.8/8.12.8) with ESMTP id i2BCPQIn012079
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 20:25:28 +0800
Subject: Re: [linux-lvm] LVM2-Snapshot
From: Craig Ringer <craig@postnewspapers.com.au>
In-Reply-To: <20040311092007.GD2138@reti>
References: <20040310173002.75ca7590.Christoph.Pleger@uni-dortmund.de>
	 <20040311092007.GD2138@reti>
Message-Id: <1079007845.6842.4.camel@albert.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar 11 07:23:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Thu, 2004-03-11 at 17:20, Joe Thornber wrote:

> The snapshot target isn't in vanilla 2.6 yet, use my udm (unstable dm)
> tree if you want that functionality.
> 
> http://people.sistina.com/~thornber/dm/
> 
> I _hope_ to submit this to lkml within the next month.

Is there any chance to tweak lvm in the mean time, so that it doesn't
/try/ to take a snapshot? I was forced to reboot to recover access to an
LV after trying to take a snapshot. There was no indication that
snapshots are broken under 2.6 either - a note in the LVM README would
be really handy.

Most importantly, though, an informative error message would be
invaluable.

Craig Ringer
