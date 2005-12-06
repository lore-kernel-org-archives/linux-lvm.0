Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jB61AHOo003223
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 01:10:17 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EjRLV-0001Yl-CK
	for linux-lvm@redhat.com; Tue, 06 Dec 2005 01:10:17 +0000
Date: Tue, 6 Dec 2005 01:10:17 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Which size for snapshot volume for a *safe* backup?
Message-ID: <20051206011017.GG3647@agk.surrey.redhat.com>
References: <20051205223911.GE3123@mjk.myfqdn.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051205223911.GE3123@mjk.myfqdn.de>
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

On Mon, Dec 05, 2005 at 11:39:11PM +0100, Marc-Jano Knopp wrote:
> So, obviously,
>   snapshot volume size = original volume size
> is not sufficient to hold a complete change of the original volume.
 
Correct - there's a little bit of metadata required too to 
map each piece of data back into the right location.

> Btw.: There's a bug in "lvscan", it still displayed the snapshot
> as being "ACTIVE", while in fact (at least that's what I concluded),
> it was "INACTIVE" due to the lack of space, as shown using "lvdisplay".

The 'lvs' attributes should be accurate (and lvdisplay too I think).
lvscan doesn't check properly and needs fixing, thanks.
 
Alasdair
-- 
agk@redhat.com
