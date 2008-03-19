Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m2JELi9w011707
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 10:21:44 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JbzAm-0004b8-9F
	for linux-lvm@redhat.com; Wed, 19 Mar 2008 14:21:44 +0000
Date: Wed, 19 Mar 2008 14:21:44 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Characters allowed for vg name
Message-ID: <20080319142144.GG12007@agk.fab.redhat.com>
References: <A78DB34D00374344A0AB65B6523C05DC02CDCF5D@marsden.win.datacash.com>
	<20080319133847.GF12007@agk.fab.redhat.com>
	<A78DB34D00374344A0AB65B6523C05DC02CDCF80@marsden.win.datacash.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A78DB34D00374344A0AB65B6523C05DC02CDCF80@marsden.win.datacash.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 19, 2008 at 01:47:57PM -0000, Gerrard Geldenhuis wrote:
> I did report it as a bug via Redhat support. I have ended up pasting the
> mailinglist response in the support ticket after a week of no positive
> response.

Sorry for that: If you send me the ticket number privately I'll see that it's
progressed.

> Would you aggree that a short note about allowable names should be added
> to man lvm? If yes, then I don't mind creating a patch.

Here's a current summary of the rules (as added to bug 430907).


The characters allowed in VG and
LV names are:  a-z A-Z 0-9 + _ . -

Neither a VG nor an LV can begin with a hyphen.

There are also various reserved names.

A VG cannot be called anything that appears in 'ls /dev' at the time it is
created (including '.' and '..' of course).

An LV can also not be called '.' or '..'.
A new LV cannot begin with the strings 'snapshot' or 'pvmove'.
It may not contain the strings '_mlog' or '_mimage'.
Additional reserved strings are likely to be added over time.

Pre-existing LVs may be found with these names, and the tools will normally cope
adequately.  (Internally-generated LVs do use these reserved names - that's why
they are reserved.)



Alasdair
-- 
agk@redhat.com
