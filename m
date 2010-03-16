Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GI8iOi008890
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 14:08:44 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GI8Yck031092
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 14:08:34 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e37.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id o2GI734V004342
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 12:07:04 -0600
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o2GI8Nkf055764
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 12:08:25 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id o2GI8LVt021065
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 12:08:22 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av01.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o2GI8LEL021031
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 12:08:21 -0600
Date: Tue, 16 Mar 2010 11:08:20 -0700
From: malahal@us.ibm.com
Message-ID: <20100316180820.GA30188@us.ibm.com>
References: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
Subject: Re: [linux-lvm] Multipath / LVM2
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

blub@trans.am [blub@trans.am] wrote:
> hello
> 
> I have troubles to get multipathing working on gentoo. I have an identical
> setup working on a debian box.
> The problem is that LVM does not detect labels on the multipath device
> node; instead it does try to use a physical path (eg /dev/sda1)

One easy way to avoid using the paths rather than actual multipath
devices is to use filtering in /etc/lvm/lvm.conf. Like below:

# Use only names from /dev/mapper directory
filter = [ "a|/dev/mapper/.*|", "r/.*/" ]

> the device nodes /dev/dm-X are not automaticaly created like they get on
> debian, I did run dmsetup mknodes which did not create /dev/dm-X nodes, so
> i created /dev/dm-0 with the minor/major of the corresponding /dev/mapper/
> node. I don't know if this is a problem.

This is odd, maybe something to do with udev rules? Anyway, you don't
need /dev/dm-X nodes if you use LVM filtering.
