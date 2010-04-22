Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3M6JF6V001712
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 02:19:15 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3M6J3B6005728
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 02:19:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id BD60F86FFA
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 08:19:02 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id iIjP+2gH0eTJ for <linux-lvm@redhat.com>;
	Thu, 22 Apr 2010 08:18:57 +0200 (CEST)
Date: Thu, 22 Apr 2010 08:18:57 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100422061857.GD23093@maude.comedia.it>
References: <4BCE910C.5020108@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BCE910C.5020108@tlinx.org>
Subject: Re: [linux-lvm] volume developing problems even though should
	be	static...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Apr 20, 2010 at 10:45:48PM -0700, Linda A. Walsh wrote:
>I needed extra space on my home partition, and speed, so I disabled my
> snapshoting cron job and deleted any logical jobs for now.
>
>But during this transition time, I've started getting some were symptoms.
>Now when I do a "pvs", I see:
>
># pvs
>  /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
please provide "dmsetup ls" and "dmsetup status" so we might know what
/dev/dm-1 is.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
