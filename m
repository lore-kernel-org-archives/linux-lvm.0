Received: from [10.36.7.85] (vpn1-7-85.ams2.redhat.com [10.36.7.85])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1ND9Ybi009960
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 08:09:35 -0500
From: Joe Thornber <thornber@redhat.com>
In-Reply-To: <4D64FF3C.6080602@abpni.co.uk>
References: <4D64FF3C.6080602@abpni.co.uk>
Date: Wed, 23 Feb 2011 13:09:33 +0000
Message-ID: <1298466573.19562.147.camel@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2011-02-23 at 12:36 +0000, Jonathan Tripathy wrote:
> Hi Everyone,
> 
> We host many Xen VMs for customers. We use LVM as the fisk storage for 
> these VMs. When a customer cancels, we generally dd their LV with 
> /dev/zero, before removing the LV.
> 
> If however we want to create a snapshot of a customer's LV, is there the 
> chance that the data may appear on a new future LV if we were to create 
> one (for a new customer)? Is is my understanding that most filesystems 
> don't actually remove data from a disk when deleting a file, but just 
> set an "ignore" tag of some sort...

I'm a bit confused about your scenario.  But I think this will help:

The snapshot device is composed of 2 sub devices, the origin and the
exception store.  Someone who only has visibility of the snapshot (ie.
your vm if your scenario is what I think it is) will have visibility of
all of the origin.  So you _do_ need to worry about data leaks on the
origin device.  Their view of the exception store is always a subset
which has been overwritten by origin data first.  So data leaks are not
an issue for the exception store.

- Joe
