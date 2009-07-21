Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n6LAZBRR006970
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 06:35:12 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1MTCgh-0000Td-Lx
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 11:35:11 +0100
Date: Tue, 21 Jul 2009 11:35:11 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgs result code error
Message-ID: <20090721103511.GH32330@agk-dp.fab.redhat.com>
References: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>
	<4A657BEB.6070200@cox.net>
	<38bdcd1f0907210208g19b3a803j90e43a4ce8f6b301@mail.gmail.com>
	<4A658D5A.7060205@cox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A658D5A.7060205@cox.net>
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

On Tue, Jul 21, 2009 at 04:41:46AM -0500, Ron Johnson wrote:
> Debian Sid's 2.02.44-3 returns a non-zero code, so either RH fixed it 
> upstream, or Debian patched it...

> # vgs /dev/sdc1
>   WARNING: Ignoring duplicate config node: filter (seeking filter)
>   Volume group "sdc1" not found
> # echo $?
> 5

That's a *different* error case that works correctly.

Yes, I agree that the original case mentioned should give EINVALID_CMD_LINE
instead of ECMD_PROCESSED.

Alasdair
