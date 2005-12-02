Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB2HSnV25111
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:28:49 -0500
Received: from echohome.org (s233-64-196-242.try.wideopenwest.com
	[64.233.242.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB2HShHF003836
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:28:43 -0500
Received: from echo (echo.echohome.org [192.168.2.254])
	by echohome.org (8.12.8/8.12.8) with ESMTP id jB2HSa5Y012886
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:28:36 -0500
From: "Erik Ohrnberger" <erik@echohome.org>
Subject: RE: [linux-lvm] Need to keep running fsck on LVM
Date: Fri, 2 Dec 2005 12:28:51 -0500
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAIiq6P81RFNNl8OW5VuEScvCgAAAEAAAAD9op+i2TYNLk6p+oqtvNDIBAAAAAA==@echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200512020924.58490.t-rigby@shaw.ca>
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

I've had the beyond end of device errors on a regular IDE drive before.
Then they mysteriously went away.

If you find out, let me know.  I was always curious about those.

 
> On December 2, 2005 09:12 am, Erik Ohrnberger wrote:
> > grep /dev/hd /var/log/messages /var/log/syslog | more
> 
> Nope, that outputs nothing at all.
> 
> I do however see the following in /vavr/log/messages over and 
> over and over 
> again...
> 
> Dec  1 23:12:46 localhost kernel: attempt to access beyond 
> end of device
> Dec  1 23:12:46 localhost kernel: dm-0: rw=0, 
> want=6444890144, limit=905314304
> 
> Gumby
> 
