Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB2HCbV20503
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:12:37 -0500
Received: from echohome.org (s233-64-196-242.try.wideopenwest.com
	[64.233.242.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB2HCVdX032273
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:12:31 -0500
Received: from echo (echo.echohome.org [192.168.2.254])
	by echohome.org (8.12.8/8.12.8) with ESMTP id jB2HCN5Y012602
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:12:23 -0500
From: "Erik Ohrnberger" <erik@echohome.org>
Subject: RE: [linux-lvm] Need to keep running fsck on LVM
Date: Fri, 2 Dec 2005 12:12:38 -0500
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAIiq6P81RFNNl8OW5VuEScvCgAAAEAAAAN2GyZBWs3FKtxbfU4eFeakBAAAAAA==@echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200512020907.52315.t-rigby@shaw.ca>
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

I would think that if you look in the /var/log/messages and/or
/var/log/syslog would give you some indication if there is a hardware
failure building.

Try this:
# grep /dev/hd /var/log/messages /var/log/syslog | more

And see what you get.

> 
> Once a week or so I am getting an issue with my volume where 
> I can no longer 
> write to it  and I get "read only filesystem" errors.  I need 
> to unmount it 
> and run an fsck.ext3 on it and it will fix errors and then 
> will be fine for 
> awhile.  I assume that there is a drive that is dying in the 
> array.  Is there 
> any way or telling which drive this might be?
> 
> Gumby
> 
