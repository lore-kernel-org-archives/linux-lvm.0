Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i52FYo011960
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 11:34:50 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i52FYni5018078
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 11:34:49 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C719823@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Subject: RE: [linux-lvm] LVM problem on MD devices
Date: Wed, 2 Jun 2004 18:34:43 +0300 
MIME-Version: 1.0
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

 Yes, /dev/md/2 is the actual device file (I'm using devfs).

Also, I tested the same with LVM 1.0.8 plus I applied the kernel patches to
1.0.8, - same problem.

Dan

> -----Original Message-----
> From: Jeffrey Layton [mailto:jtlayton@poochiereds.net] 
> Sent: Wednesday, June 02, 2004 5:55 PM
> To: LVM general discussion and development
> Cc: Dan Bar Dov
> Subject: Re: [linux-lvm] LVM problem on MD devices
> 
> On Wed, 2004-06-02 at 10:44, Dan Bar Dov wrote:
> > I create an MD multipath device, and then a PV on it. 
> > Pvdisplay on the device fails with
> > pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID 
> > physical volume "/dev/md/2"
> 
> Just a guess here, but is /dev/md/2 an actual block device 
> file? LVM is picky about symlinks and such...
> -- Jeff
> 
> 
