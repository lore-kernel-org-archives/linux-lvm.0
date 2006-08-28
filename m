Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SMjxgN029054
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 18:45:59 -0400
Received: from mail.esperi.org.uk (user32443@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7SMjoWq011693
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 18:45:51 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	k7SMjmRt028121
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 23:45:48 +0100
Subject: Re: [linux-lvm] Does LVM has something to backup like mbr??
References: <44F33821.4040802@minicom.com.br>
From: Nix <nix@esperi.org.uk>
Date: Mon, 28 Aug 2006 23:45:48 +0100
In-Reply-To: <44F33821.4040802@minicom.com.br> (Du's message of "Mon,
	28 Aug 2006 15:38:25 -0300")
Message-ID: <874pvwqy1v.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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

On Mon, 28 Aug 2006, Du wrote:
> Hi, these days I was wondering if I do some crap in my LV's and I want
> to recover it, can I keep some kind of mbr's backup?

This should be automatically maintained in /etc/lvm/backup: both the
directory to back up to and whether backups are maintained at all
is customizable in /etc/lvm/lvm.conf, but it's a *really good idea*
to leave it turned on.

By default a backup is taken whenever the metadata changes (addition,
removal, or reconfiguration of LVs and VGs, basically).

You can restore an old configuration with `vgcfgrestore' and back up the
existing one on command with `vgcfgbackup'. (Obviously restoring an old
configuration with LVs in different places is unlikely to work because
the data isn't in the right places anymore, but re-restoring the new,
correct configuration should repair things immediately.)

> Something that, when I put it in the right place, it recovers my LV's ??

That's exactly it.

> Just like mbr. Cuz if I backup my mbr, it just recover my unique
> partition with LVM.

Your general system backup (you *do* have one, right? :) ) should be
backing up /etc anyway, in which case the LVM metadata backups should
be backed up with everything else.

-- 
`In typical emacs fashion, it is both absurdly ornate and
 still not really what one wanted.' --- jdev
