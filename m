Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1I8COgT018289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 03:12:24 -0500
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7BFE81226
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 08:12:19 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 9CEECADE0B84
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 09:12:03 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id qwC5-n6XWlKC for <linux-lvm@redhat.com>;
	Sat, 18 Feb 2017 09:12:02 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 3ABA7ADE0BBD
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 09:12:02 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id kBraVhNCq4Wg for <linux-lvm@redhat.com>;
	Sat, 18 Feb 2017 09:12:02 +0100 (CET)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 0950DADE0B84
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 09:12:01 +0100 (CET)
Date: Sat, 18 Feb 2017 09:12:01 +0100 (CET)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <1440710475.214.1487405521405.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <58A78089.7020202@tlinx.org>
References: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
	<1269016789.1015.1487269373950.JavaMail.zimbra@karlsbakk.net>
	<58A64774.10004@tlinx.org>
	<2118934913.869.1487344329807.JavaMail.zimbra@karlsbakk.net>
	<58A78089.7020202@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvmove speed
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
To: linux-lvm <linux-lvm@redhat.com>

>    200-500... impressive for a SAN... but considering the bandwidth
> you have to the box (4x1+10), I'd hope for at least 200 (what I get
> w/just a 10)... so must be some parallel TCP channels there... he..
> What showed those speeds?  I'm _guessing_, but its likely that pvmove
> is single threaded.  So could be related to the I/O transfer size as
> @pattonme was touching on, since multi-threaded I/O can slow things
> down for local I/O when local I/O is in the .5-1GBps and higher range.

Well, it’s a Compellent thing with net storage of around 350TiB, of which around 20 is on SSDs, so really, it should be good. Tiering is turned off during migration of this data, though (that is, we’re migrating the data directly to a low tier, since it’s 40TiB worth of archives).

>    Curious -- do you know your network's cards' MTU size?
> I know that even w/1Gb cards I got 2-4X speed improvement over
> standard 1500 packets (run 9000/9014 byte MTU's over local net).

Everything’s using jumboframes (9000) on the SAN (storage network), and it’s a dedicated network with its own switches and copper/fiber. The rest of the system works well (at least the Compellent things, EqualLogic has a bad nervous breakdown on its way to the cemetery, but that’s another story. The Exchange servers running off it, gave us around 400MB/s (that is, wirespeed) last backup. That wasn’t raw i/o from vmware, this is, but then again, I should at least be able to sustain a gigabit link (the EQL storage is hardly in use anymore, perhaps that’s why it’s depressed), and as shown, I’m limited to around half of that.

Vennlig hilsen / Best regards

roy
--
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Da mihi sis bubulae frustrum assae, solana tuberosa in modo Gallico fricta, ac quassum lactatum coagulatum crassum. Quod me nutrit me destruit.
