Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j6AFbR3N030817
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2005 16:37:27 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Drdrz-0006Cr-JZ
	for linux-lvm@redhat.com; Sun, 10 Jul 2005 16:37:27 +0100
Date: Sun, 10 Jul 2005 16:37:27 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvextend
Message-ID: <20050710153727.GZ12337@agk.surrey.redhat.com>
References: <20050708164536.GE15561@wavehammer.waldi.eu.org>
	<20050708173853.GU12337@agk.surrey.redhat.com>
	<20050708204215.GB23643@wavehammer.waldi.eu.org>
	<20050708204617.GX12337@agk.surrey.redhat.com>
	<20050709093519.GA1789@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050709093519.GA1789@wavehammer.waldi.eu.org>
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
To: linux-lvm@redhat.com

On Sat, Jul 09, 2005 at 11:35:19AM +0200, Bastian Blank wrote:
> Hmm, why is this tricky?

The device size is stored in two places, the format2 label
as well as the VG metadata, and there's no interface for
updating the first (atomically/recoverably remember) once 
the PV is part of a VG.

Alasdair
-- 
agk@redhat.com
