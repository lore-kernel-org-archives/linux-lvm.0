Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBLFdYsF013345
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 15:39:34 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cgm6o-0007U0-Sc
	for linux-lvm@redhat.com; Tue, 21 Dec 2004 15:39:34 +0000
Date: Tue, 21 Dec 2004 15:39:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm/fs issue
Message-ID: <20041221153934.GD26670@agk.surrey.redhat.com>
References: <0B834CEE3453504B82AB821DFB7047C1FF01AC@enyc11p32003.corpny.csfb.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0B834CEE3453504B82AB821DFB7047C1FF01AC@enyc11p32003.corpny.csfb.com>
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

On Tue, Dec 21, 2004 at 03:19:49PM -0000, Rosenstrauch, David wrote:
>   /dev/sda3: read failed after 0 of 2048 at 0: Input/output error

It's harmless - safe to ignore.

Which version of LVM2 and what architecture?  

2.00.30 started displaying detailed errors like this so we can find out 
about them and fix them; older versions silently ignored them.

Alasdair
-- 
agk@redhat.com
