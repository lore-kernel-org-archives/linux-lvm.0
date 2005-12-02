Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB2HOmV23964
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:24:48 -0500
Received: from pd4mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB2HOgdU002847
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:24:42 -0500
Received: from pd5mr7so.prod.shaw.ca
	(pd5mr7so-qfe3.prod.shaw.ca [10.0.141.183]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0IQV0070MSD5WA10@l-daemon> for linux-lvm@redhat.com; Fri,
	02 Dec 2005 10:24:41 -0700 (MST)
Received: from pn2ml6so.prod.shaw.ca ([10.0.121.150])
	by pd5mr7so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IQV00C3FSD5DHB0@pd5mr7so.prod.shaw.ca> for
	linux-lvm@redhat.com; Fri, 02 Dec 2005 10:24:41 -0700 (MST)
Received: from [192.168.1.123] ([24.85.82.146])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0IQV00GHMSD54WG0@l-daemon> for linux-lvm@redhat.com; Fri,
	02 Dec 2005 10:24:41 -0700 (MST)
Date: Fri, 02 Dec 2005 09:24:58 -0800
From: Terry Rigby <t-rigby@shaw.ca>
Subject: Re: [linux-lvm] Need to keep running fsck on LVM
In-reply-to: <!&!AAAAAAAAAAAYAAAAAAAAAIiq6P81RFNNl8OW5VuEScvCgAAAEAAAAN2GyZBWs3FKtxbfU4eFeakBAAAAAA==@echohome.org>
Message-id: <200512020924.58490.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
References: <!&!AAAAAAAAAAAYAAAAAAAAAIiq6P81RFNNl8OW5VuEScvCgAAAEAAAAN2GyZBWs3FKtxbfU4eFeakBAAAAAA==@echohome.org>
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
To: linux-lvm@redhat.com

On December 2, 2005 09:12 am, Erik Ohrnberger wrote:
> grep /dev/hd /var/log/messages /var/log/syslog | more

Nope, that outputs nothing at all.

I do however see the following in /vavr/log/messages over and over and over 
again...

Dec  1 23:12:46 localhost kernel: attempt to access beyond end of device
Dec  1 23:12:46 localhost kernel: dm-0: rw=0, want=6444890144, limit=905314304

Gumby
