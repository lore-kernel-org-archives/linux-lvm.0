Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k34CZxN4029215
	for <linux-lvm@redhat.com>; Tue, 4 Apr 2006 08:35:59 -0400
Received: from mnementh.dragonhold.org (mnementh.dragonhold.org
	[80.229.192.21])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k34CZq78027932
	for <linux-lvm@redhat.com>; Tue, 4 Apr 2006 08:35:52 -0400
Date: Tue, 4 Apr 2006 13:35:32 +0100
Subject: Re: [linux-lvm] Shrinking what part of a PV a VG uses, Is it possible?
Message-ID: <20060404123532.GD21526@dragonhold.org>
References: <44326388.90001@tiscali.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44326388.90001@tiscali.nl>
From: gwood@dragonhold.org
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
To: sverre@rabbelier.nl, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Apr 04, 2006 at 02:16:08PM +0200, Sverre Rabbelier wrote:
> My first choice would be to partition a part of the VG as 
> Windows-readable, but I didn't think that's possible (if it is, please 
> tell me!).
You might want to look at 'explore2fs'.

http://uranus.it.swin.edu.au/~jn/linux/explore2fs.htm

It claims to support LVM, and will give windows sort of access to the
data - it can't treat it as a normal drive, but you get an explorer type
front end to it
