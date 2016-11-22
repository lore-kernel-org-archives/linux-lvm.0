Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAMGNXdf029739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2016 11:23:34 -0500
Date: Tue, 22 Nov 2016 10:23:33 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20161122162333.GA8508@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] New features for using lvm on shared storage
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

For people using LVM (or clvm) on shared storage, I encourage you to take
a look at two recent additions that you may find to be an improvement:

1. System ID

is for static ownership of VGs by hosts:
http://man7.org/linux/man-pages/man7/lvmsystemid.7.html

The nearest equivalent to system ID in the past has been configuring
lvm.conf filters uniquely on each host.

2. lvmlockd

is for dynamically sharing VGs among hosts:
http://man7.org/linux/man-pages/man8/lvmlockd.8.html

Using lvmlockd with dlm is similar to what clvmd has done in the past.
Using lvmlockd with sanlock has no prior equivalent.

(For distribution packaging, see the "lvm2-lockd" rpm.)

Dave
