Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBS78OfL027888
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2012 02:08:24 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBS78MjX009547
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2012 02:08:22 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1ToU3V-0007AQ-RM
	for linux-lvm@redhat.com; Fri, 28 Dec 2012 08:08:33 +0100
Received: from ebox.rath.org ([173.255.235.238])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2012 08:08:33 +0100
Received: from Nikolaus by ebox.rath.org with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2012 08:08:33 +0100
From: Nikolaus Rath <Nikolaus@rath.org>
Date: Thu, 27 Dec 2012 22:13:53 -0800
Message-ID: <87txr6snz2.fsf@vostro.rath.org>
References: <50D242B2.8080108@rath.org>
	<20121220101448.GC9613@agk-dp.fab.redhat.com>
	<50D33E74.1040801@rath.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Nikolaus Rath <Nikolaus@rath.org> writes:
> On 12/20/2012 02:14 AM, Alasdair G Kergon wrote:
>> On Wed, Dec 19, 2012 at 02:41:54PM -0800, Nikolaus Rath wrote:
>>> I'm having some trouble changing the owner of a logical device. I added
>>> the following udev rule to both my initramfs and the real root:
>> Tell people which distribution you're using and which version, and which
>> udev rule file you're editing.
> I'm using Debian wheezy and added the rule to
> /etc/udev/rules.d/99-udev-custom.rules.
> I made sure this is copied into the initrd by adding a hook in
> /etc/initramfs/hooks/.
>
> Sorry for the omission. I thought it wouldn't matter because the rule
> seemed to be parsed and used by udev perfectly both in the initrd and
> after system boot.


No one any idea?


Best,

   -Nikolaus

-- 
 »Time flies like an arrow, fruit flies like a Banana.«

  PGP fingerprint: 5B93 61F8 4EA2 E279 ABF6  02CF A9AD B7F8 AE4E 425C
