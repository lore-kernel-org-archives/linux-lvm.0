Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1C1wm123380
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2006 20:58:48 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1C1wk6r017080
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2006 20:58:47 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 325EA9C64
	for <linux-lvm@redhat.com>; Sun, 12 Feb 2006 01:58:46 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 22048-12 for <linux-lvm@redhat.com>;
	Sun, 12 Feb 2006 01:58:43 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 491489D5D
	for <linux-lvm@redhat.com>; Sun, 12 Feb 2006 01:58:43 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] LVM character devices
Date: Sat, 11 Feb 2006 19:58:36 -0600
References: <d8dbc3c70601181248i78298230q@mail.gmail.com>
In-Reply-To: <d8dbc3c70601181248i78298230q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602111958.38152.krakrjak@volumehost.net>
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

On Wednesday 18 January 2006 14:48, Victor Huaquisto wrote:
> Why doesn't exist the character devices for the logical volumes on Linux.
I'm assuming you are reffering to the rlvols from hpux.  They don't have the 
same utility in Linux.  There is no need for rlvols.  Just as there aren't 
character devices for disks either there are no character devices for the 
lvols.

Is there something you are trying to accomplish that you can't without the 
character device?

-- 
Zac Slade
