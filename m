Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBE3En5b020275
	for <linux-lvm@redhat.com>; Wed, 13 Dec 2006 22:14:49 -0500
Received: from malcolm.theunixman.com (malcolm.theunixman.com [72.37.173.55])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBE3Em1F010550
	for <linux-lvm@redhat.com>; Wed, 13 Dec 2006 22:14:48 -0500
Received: from theunixman.com (valinor.arda.theunixman.com [10.0.2.2])
	by malcolm.theunixman.com (8.13.8/8.12.11) with ESMTP id kBE3ET87001871
	for <linux-lvm@redhat.com>; Thu, 14 Dec 2006 03:14:29 GMT
Date: Thu, 14 Dec 2006 03:14:39 +0000
From: Evan Cofsky <evan@theunixman.com>
Subject: Re: [linux-lvm] EXT3-fs: unable to read superblock
Message-ID: <20061214031438.GE28727@valinor.arda.theunixman.com>
References: <457D8863.1020801@virtua.ch>
	<20061211180859.GN31405@valinor.arda.theunixman.com>
	<457E8170.4000007@virtua.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <457E8170.4000007@virtua.ch>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 12/12 11:16, Jean Chiappini wrote:
> Thank you for your answer, but when I do this command, this error appear :
> tune2fs: Argument invalide while trying to open 
> /dev/mapper/VolGroup00-mysqldata
> Couldn't find valid filesystem superblock.

Have you tried e2fsck on it yet?

-- 
Evan Cofsky, The Architect <evan@theunixman.com>
http://www.theunixman.com/
