Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9I0hXr07740
	for <linux-lvm@redhat.com>; Sun, 17 Oct 2004 20:43:33 -0400
Received: from smtp.mailbox.co.uk (smtp.mailbox.co.uk [195.82.125.32])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9I0hUhP001228
	for <linux-lvm@redhat.com>; Sun, 17 Oct 2004 20:43:33 -0400
Message-ID: <4173119C.40602@jonmasters.org>
Date: Mon, 18 Oct 2004 01:43:08 +0100
From: Jon Masters <jonathan@jonmasters.org>
MIME-Version: 1.0
References: <20041015192848.O30562@sphinx.mythic-beasts.com>
	<20041015185452.GG565@scooby.ox.compsoc.net>
	<20041015201822.B29778@sphinx.mythic-beasts.com>
In-Reply-To: <20041015201822.B29778@sphinx.mythic-beasts.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [OxLUG] LVM2 problems
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: oxlug@lists.oxlug.org
Cc: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Warren wrote:

| On Fri, Oct 15, 2004 at 07:54:52PM +0100, Alasdair G Kergon wrote:

|>>Our primary problem is that creating snapshots occassionally hangs the
|>>machine.

|>Known issue now - unfortunately the fix involves a lot of coding and
|>other things have a higher priority at the moment.

| OK - I saw a previous post about this, but from that I wasn't sure that
| it (a) killed the machine and (b) affected ext3 partitions.

It's come up on a whole bunch of other mailing lists by now, including
LKML. It probably wants to be mentioned prominently on the web site.

Currently I avoid using snapshots at all, and I'm a very reserved LVM
user at the best of times - even though I think it's grrrreat. [OT] I
wish the new Debian installer supported (the only sane option)
installing LVM on md rather than having one of the other, but meh.

Look at me, I'm mailing random comments and not fixing anything, but
hey, what better way of relieving insomnia.

Jon.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBcxGceTyyexZHHxERApUQAJ4ghWXlvXxeGeG004gFtryInAjYuwCfSRqL
Pe+Nz4IwBglZf9GHLJgTeTM=
=lvSH
-----END PGP SIGNATURE-----
