Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k89NHd2m012824
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 00:17:39 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GMC4x-00047C-K0
	for linux-lvm@redhat.com; Sun, 10 Sep 2006 00:17:39 +0100
Date: Sun, 10 Sep 2006 00:17:39 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Cannot get rid of root filesystem LVM snapshot
Message-ID: <20060909231739.GB13859@agk.surrey.redhat.com>
References: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
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

The tools do not support root snapshots properly yet - whether or not they
work is down to chance.  To remove one reliably you need lvremove from a
rescue environment - you're lucky lvremove is refusing to proceed - if it
got further it could hang your machine.  In principle you can recover
without rebooting but you'll need to write a custom script to run various
dmsetup commands from a ramdisk, for example, and then fix up the lvm2
metadata with activation disabled.  [If you learn how snapshots are
created/destroyed you can work out what to do: sorry, it's too much for me
to explain here.  This is what the tools will want enhancing to do to
provide proper support.]

Older kernels like yours however can get into a state where recovery is only
possible by writing directly to kernel memory, if you already ran certain
commands in the wrong sequence.

Alasdair
-- 
agk@redhat.com
