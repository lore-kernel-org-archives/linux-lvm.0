Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9GLrMap021224
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 17:53:22 -0400
Received: from alnrmhc13.comcast.net (alnrmhc13.comcast.net [204.127.225.93])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9GLrL1O019835
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 17:53:21 -0400
Message-ID: <4533FF43.9030702@Englisch.us>
Date: Mon, 16 Oct 2006 17:53:07 -0400
From: Volker Englisch <Volker@englisch.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Boot fails after change of motherboard: No volume
	groups found
References: <20061016183310.D1DA08F00@tinman.seitzassoc.com>
In-Reply-To: <20061016183310.D1DA08F00@tinman.seitzassoc.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

 > Does your new motherboard use a different SATA controller?  Perhaps
 > your initrd doesn't have the proper driver.

Yes, that was (part of) the problem.

I ran mkinitrd and modified /etc/modprobe.conf to make sure the sata_via 
module gets loaded.  Now my system does find and activate the volume.

However, another error message which I've seen before but didn't list in 
my original mail since I thought it was a follow-up message caused by 
not finding the volume group is still present:
    mount: error 6 mounting ext3
    ERROR opening /dev/console!!!!: 2


Thanks

    Volker Englisch

mailto:Volker@Englisch.us (h)
