Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r21FfdMp018030
	for <linux-lvm@redhat.com>; Fri, 1 Mar 2013 10:41:39 -0500
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r21FfZnt014336
	for <linux-lvm@redhat.com>; Fri, 1 Mar 2013 10:41:36 -0500
In-Reply-To: <513090CA.8050904@pse-consulting.de>
References: <513090CA.8050904@pse-consulting.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Fri, 01 Mar 2013 18:41:26 +0300
Message-ID: <aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Andreas Pflug <pgadmin@pse-consulting.de>, LVM general discussion and development <linux-lvm@redhat.com>

Sorry, forgot to reply to list from the first attempt.

Andreas Pflug <pgadmin@pse-consulting.de> wrote:

>Hi Vladislav,
>
>I tried the patch you mentioned in 
>https://www.redhat.com/archives/linux-lvm/2013-January/msg00006.html , 
>but apparently it doesn't work for me. On a locally active LV, I still
>get
>
>./lvm lvchange -aey -vvvv vg/locktest
>
>...
>Activating logical volume "locktest" exclusively
>#activate/dev_manager.c:284         Getting device info for vg-locktest
>
>[LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
>#ioctl/libdm-iface.c:1724         dm info 
>LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN 
>NF   [16384] (*1)
>#locking/cluster_locking.c:568         Lock held for 
>oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node 
>7400a8c0 : CR
>#activate/activate.c:1067       vg/locktest is active
>#locking/cluster_locking.c:508       Locking LV 
>oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN EX 
>(LV|NONBLOCK|CLUSTER|LOCAL) (0xdd)
>#locking/cluster_locking.c:395   Error locking on node 7400a8c0: Device
>
>or resource busy
>
>Can you give me a hint what to try further?
>
>Regards
>Andreas

Hi Andreas,
Lock convertion is only enabled if you pass --force flag.
Also, to upgrade local lock to exclusive one, you need to ensure IIRC that no more node holds local lock.

Vladislav
