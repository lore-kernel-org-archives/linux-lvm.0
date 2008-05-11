Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4B0PnIK001579
	for <linux-lvm@redhat.com>; Sat, 10 May 2008 20:25:49 -0400
Received: from nlpi043.prodigy.net (nlpi043.sbcis.sbc.com [207.115.36.72])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4B0PWh8027098
	for <linux-lvm@redhat.com>; Sat, 10 May 2008 20:25:32 -0400
Received: from mail.kdzbn.homelinux.net
	(adsl-75-40-228-163.dsl.klmzmi.sbcglobal.net [75.40.228.163])
	(authenticated bits=0)
	by nlpi043.prodigy.net (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	m4B0PO7h020597
	for <linux-lvm@redhat.com>; Sat, 10 May 2008 19:25:24 -0500
Received: from beta.mydomain ([192.168.2.237])
	by mail.kdzbn.homelinux.net with esmtp (Exim 4.62)
	(envelope-from <bryan@kadzban.is-a-geek.net>) id 1JuzNV-00013M-O7
	for linux-lvm@redhat.com; Sat, 10 May 2008 20:25:25 -0400
Message-ID: <48263CF5.2080305@kadzban.is-a-geek.net>
Date: Sat, 10 May 2008 20:25:25 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Offline fsck (checking snapshots)
References: <48110C2D.5020800@kadzban.is-a-geek.net>
	<4824F560.208@davidcoulson.net>
In-Reply-To: <4824F560.208@davidcoulson.net>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

David Coulson wrote:
> I've been playing with this script today - Is there a more current 
> version, or someone who maintains it? There are a bunch of things
> that seem to be broken that I ended up cleaning up on my own

There isn't a more current version, no.  I guess (for the moment anyway)
I maintain it, since I was the one that took the original and added the
config file, support for other filesystems, etc.  (All that really
happened was some discussion on the ext3-users list.)

If you have patches, I'd be happy to apply them, and re-post.  :-)

(I did try running it once or twice, but those were older versions, and
lots of stuff got changed since then.  Unfortunately my main system
doesn't use LVM, and the qemu image that does seems to be corrupted (it
crashed at one point, and the RAID5 under the LVM got screwed up), so
it's been a long time since I ran it.  It sounds like I should create
another qemu image and start testing it again.)

> (e.g. it calculates the snapshot size in M, then creates it in 
> extents...).

Ouch.  I don't remember exactly when that part of the script changed,
but obviously it should be using -L, and should have an "M" suffix.
I've fixed that.

> I imagine there are other users who are frustrated with it, as it
> does not run cleanly as it is.

If there are any other users.  ;-)

So far, this is just an idea that was brought up in the context of ext3
(and someone complaining about really long fsck times being forced on
them on huge FSes).  I brought it up here in an attempt to get it maybe
merged into the LVM tools.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIJjz1S5vET1Wea5wRAySLAKCXKxAA+ahI/bTzlP2Zcf0gwuNqGwCfeeZC
Cmg0RzRJmIrSKD+0XabcRTQ=
=xn99
-----END PGP SIGNATURE-----
