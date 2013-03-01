Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r21BSC7o026977
	for <linux-lvm@redhat.com>; Fri, 1 Mar 2013 06:28:12 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.9])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r21BSA7E025068
	for <linux-lvm@redhat.com>; Fri, 1 Mar 2013 06:28:11 -0500
Message-ID: <513090CA.8050904@pse-consulting.de>
Date: Fri, 01 Mar 2013 12:28:10 +0100
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, bubble@hoster-ok.com

Hi Vladislav,

I tried the patch you mentioned in 
https://www.redhat.com/archives/linux-lvm/2013-January/msg00006.html , 
but apparently it doesn't work for me. On a locally active LV, I still get

./lvm lvchange -aey -vvvv vg/locktest

...
Activating logical volume "locktest" exclusively
#activate/dev_manager.c:284         Getting device info for vg-locktest 
[LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
#ioctl/libdm-iface.c:1724         dm info 
LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN 
NF   [16384] (*1)
#locking/cluster_locking.c:568         Lock held for 
oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node 
7400a8c0 : CR
#activate/activate.c:1067       vg/locktest is active
#locking/cluster_locking.c:508       Locking LV 
oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN EX 
(LV|NONBLOCK|CLUSTER|LOCAL) (0xdd)
#locking/cluster_locking.c:395   Error locking on node 7400a8c0: Device 
or resource busy

Can you give me a hint what to try further?

Regards
Andreas
