Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i44MKcv25281
	for <linux-lvm@redhat.com>; Tue, 4 May 2004 18:20:38 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i44MKb106732
	for linux-lvm@redhat.com; Tue, 4 May 2004 17:20:37 -0500
Date: Tue, 4 May 2004 17:20:37 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH] crypto for LVM2
Message-ID: <20040504172037.B5316@homer.msp.redhat.com>
References: <20040503232018.GD7384@fukurou.paranoiacs.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040503232018.GD7384@fukurou.paranoiacs.org>;
	from sluskyb@paranoiacs.org on Mon, May 03, 2004 at 07:20:20PM
	-0400
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 03, 2004 at 07:20:20PM -0400, Ben Slusky wrote:
> The encryption key is not stored with the metadata, as that would
> kinda defeat the purpose of encryption. 

That depends on the usage - some people may be happy to keep the
key in the metadata on removable media.

> * If you try to create an encrypted and striped volume, lvcreate will
>   inform you that this isn't possible. The necessary support for
>   compound volumes just isn't there. I assume that's somewhere down
>   the line in the development plan?
 
Yes, shouldn't be too far off.

I'm doing some code restructuring at the moment to abstract the 
various segment types better (see today's check-in).

I'll merge elements of this patch after restructuring.

Alasdair
-- 
agk@redhat.com
