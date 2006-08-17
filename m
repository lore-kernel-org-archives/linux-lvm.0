Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7J3CSfB003272
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 23:12:28 -0400
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7J3CGwP032450
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 23:12:22 -0400
Subject: Re: [linux-lvm] how to learn number of stripes on logical volume?
From: Bill Ranck <ranck@vt.edu>
In-Reply-To: <20060817201917.1EF8E1EB6B8@labrador.eecs.harvard.edu>
References: <20060817201917.1EF8E1EB6B8@labrador.eecs.harvard.edu>
Date: Thu, 17 Aug 2006 16:46:26 -0400
Message-Id: <1155847586.12486.131.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
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
To: LVM discussion list <linux-lvm@redhat.com>

On Thu, 2006-08-17 at 16:19 -0400, Norman Ramsey wrote:
> I'm using LVM2 under Debian.  I have a logical volume 
> created by the Debian installer, and I'd like to know if it
> is striped.  How can I find out?
> 
> I tried 'lvdisplay -v' and 'vgdisplay -v', but neither
> shows the number of stripes on a logical volume (I tried
> with a newly created LV with two stripes, but the information
> is not shown).

Have you tried 'lvs -v' ?
It has something called "segments" but since I don't have a striped
volumes to test it with I can't be sure that's what you want.

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
