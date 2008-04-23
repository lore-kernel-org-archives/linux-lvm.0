Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3N7glvh007048
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 03:42:48 -0400
Received: from jeltz.chrissie.net (vpn-6-9.fab.redhat.com [10.33.6.9])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3N7glNT018248
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 03:42:47 -0400
Message-ID: <480EE876.6050400@redhat.com>
Date: Wed, 23 Apr 2008 08:42:46 +0100
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd on openais
References: <1cafab770804230025q585c565awc8a70c8b9b2d2345@mail.gmail.com>
In-Reply-To: <1cafab770804230025q585c565awc8a70c8b9b2d2345@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Xinwei Hu wrote:
> Hi all,
>   clvmd-openais.c uses saLckResourceLockAsync and
> saLckResourceUnlockAsync. But they then pthread_cond_wait the lock
> operation to finished.
> 
>   Since we have to wait, why not switch to use saLckResourceLock and
> saLckResourceUnlock directly ? Are there any reasons behind this ?
> 

It's mainly because the code was copied and editted from the other
cluster systems, I think :-)

Chrissie
