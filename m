Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i52EtB030778
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 10:55:11 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i52Et6Xn011635
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 10:55:06 -0400
Subject: Re: [linux-lvm] LVM problem on MD devices
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <2F75AEE4E86FDE44BF97709D289BAA7C719821@vega.voltaire.com>
References: <2F75AEE4E86FDE44BF97709D289BAA7C719821@vega.voltaire.com>
Message-Id: <1086188103.7008.4.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Wed, 02 Jun 2004 10:55:03 -0400
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Dan Bar Dov <danb@voltaire.com>

On Wed, 2004-06-02 at 10:44, Dan Bar Dov wrote:
> I create an MD multipath device, and then a PV on it. 
> Pvdisplay on the device fails with 
> pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical
> volume "/dev/md/2"

Just a guess here, but is /dev/md/2 an actual block device file? LVM is
picky about symlinks and such...
-- Jeff
