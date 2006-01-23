Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0NND2118084
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 18:13:02 -0500
Received: from smtp.meme.com (janus.meme.com [69.17.73.118])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0NND0SD002838
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 18:13:00 -0500
Date: Mon, 23 Jan 2006 23:12:48 +0000
From: "Karl O. Pinc" <kop@meme.com>
Subject: Re: [linux-lvm] pvcreate can't use entire disk?
References: <200601232226.RAA22595@out-of-band.media.mit.edu>
	<20060123223516.GN4280@agk.surrey.redhat.com>
In-Reply-To: <20060123223516.GN4280@agk.surrey.redhat.com> (from
	agk@redhat.com on Mon Jan 23 16:35:16 2006)
Message-Id: <1138057968l.16256l.8l@mofo>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: f-lvm@media.mit.edu


On 01/23/2006 04:35:16 PM, Alasdair G Kergon wrote:
> On Mon, Jan 23, 2006 at 05:26:00PM -0500, f-lvm@media.mit.edu wrote:

> > (at which point I would have zeroed it and tried again)
> 
> Did you try that?

I would find this a bit annoying.  I just put a 300GB disk into
an old slow machine and found it took over 12 hours to zero.

While zeroing the early part of the disk would probably be
adequate, it'd be nice if there was some sort of force option.


Karl <kop@meme.com>
Free Software:  "You don't pay back, you pay forward."
                  -- Robert A. Heinlein
