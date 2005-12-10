Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAK44132101
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:04:04 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBAK40JD011405
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:04:00 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 56AB924FAB
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 13:03:53 -0700 (MST)
Date: Sat, 10 Dec 2005 13:03:52 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
In-Reply-To: <20051210194827.GE3103@mjk.myfqdn.de>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: LVM general discussion and development <linux-lvm@redhat.com>



--On December 10, 2005 8:48:27 PM +0100 Marc-Jano Knopp 
<pub_ml_lvm@marc-jano.de> wrote:

> On Sat, 10 Dec 2005 at 14:38 (-0500), Mag Gam wrote:
>> any news about hot(no unmount, no fsck, no fs resize) ext2/ext3
>> filesystem increase?
>
> And when will online-*shrinking* of ext3 appear?

These are not LVM features.  These are filesystem features.  Better to ask 
on lkml, or the maintainers directly.
