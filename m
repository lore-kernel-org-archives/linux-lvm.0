Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0BH8wBD021245
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 12:08:59 -0500
Received: from nerv.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0BH8ffw003364
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 12:08:42 -0500
Received: from [IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]
	([IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]) (authenticated bits=0)
	by nerv.dolda2000.com (8.14.3/8.14.3/Debian-5) with ESMTP id
	o0BGsIlt017754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2010 17:54:19 +0100
From: Fredrik Tolf <fredrik@dolda2000.com>
Date: Mon, 11 Jan 2010 17:54:18 +0100
Message-ID: <1263228858.2845.12.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing a PV from a mirror
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

Hi list,

I've got a mirror volume with two S-ATA disks, one of which started
getting bad sectors recently, and I want to replace it. I'm having
trouble removing it from the volume, however.

When googling around on the subject, I've read everywhere that I
shouldn't have to do anymore than remove it, and LVM should discover
that and reconvert the mirror back into a linear volume. To be a bit
more careful, though, I ran "echo 1 >/sys/block/sdh/device/delete" to
have it removed properly in software first. Much to my surprise, shall
we say, that just made the LV die a horrible death; it started returning
EIO for every access to it, and I had to reboot the server to get it
working again. Again, this is the proper procedure according to what
I've been reading on the net; did I do it wrong, somehow, or are my
sources completely off? (And if this doesn't work, then what would
actually happen if the disk were to fail physically?)

As I rebooted the server, I tried disconnecting the disk in advance, but
that made LVM unable to bring the VG back online at all.

How am I supposed to take this disk out of the volume? If I should use
`lvconvert -m 0 $LV', then how do I specify which disk is to be removed?

I'm using a stock Debian stable (Lenny) installation, meaning Linux
2.6.24 and LVM2 2.02.39.

Appreciative for any answers,

Fredrik Tolf
