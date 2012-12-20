Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBKGZxOX017330
	for <linux-lvm@redhat.com>; Thu, 20 Dec 2012 11:35:59 -0500
Received: from ebox.rath.org (ebox.rath.org [173.255.235.238])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBKGZvRt027354
	for <linux-lvm@redhat.com>; Thu, 20 Dec 2012 11:35:57 -0500
Received: from wsip-68-225-19-102.oc.oc.cox.net ([68.225.19.102]
	helo=[10.11.13.57])
	by ebox.rath.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Nikolaus@rath.org>) id 1Tlj6C-000469-TN
	for linux-lvm@redhat.com; Thu, 20 Dec 2012 16:35:57 +0000
Message-ID: <50D33E74.1040801@rath.org>
Date: Thu, 20 Dec 2012 08:36:04 -0800
From: Nikolaus Rath <Nikolaus@rath.org>
MIME-Version: 1.0
References: <50D242B2.8080108@rath.org>
	<20121220101448.GC9613@agk-dp.fab.redhat.com>
In-Reply-To: <20121220101448.GC9613@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Changing owner of lv device with udev
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
To: linux-lvm@redhat.com

On 12/20/2012 02:14 AM, Alasdair G Kergon wrote:
> On Wed, Dec 19, 2012 at 02:41:54PM -0800, Nikolaus Rath wrote:
>> I'm having some trouble changing the owner of a logical device. I added
>> the following udev rule to both my initramfs and the real root:
> Tell people which distribution you're using and which version, and which
> udev rule file you're editing.
I'm using Debian wheezy and added the rule to
/etc/udev/rules.d/99-udev-custom.rules.
I made sure this is copied into the initrd by adding a hook in
/etc/initramfs/hooks/.

Sorry for the omission. I thought it wouldn't matter because the rule
seemed to be parsed and used by udev perfectly both in the initrd and
after system boot.


Best,
Niko
