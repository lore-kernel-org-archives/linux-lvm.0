Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6N7NNVV011210
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 03:23:24 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6N7NL3a016045
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 03:23:22 -0400
Date: Mon, 23 Jul 2007 09:23:20 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets. Good
	idea or not?
Message-ID: <20070723072320.GB30790@percy.comedia.it>
References: <46A38AE6.3070805@emat.be>
	<Pine.LNX.4.44.0707221446080.990-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0707221446080.990-100000@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sun, Jul 22, 2007 at 02:57:33PM -0400, Stuart D. Gathman wrote:
>The main drawback to md raid1 is that it always resynchronizes
>the *entire* partition when a disk goes offline temporarily.  I also
False. md uses bitmaps to avoid this.

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
