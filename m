Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9VBODPu019670
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2007 07:24:13 -0400
Received: from Pinguin.muster.dyndns.info (manz-4d009c46.pool.mediaWays.net
	[77.0.156.70])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9VBOBV0018290
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2007 07:24:11 -0400
Received: from paul-laptop.muster.dyndns.info ([192.168.0.99] ident=paul)
	by Pinguin.muster.dyndns.info with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <paul.muster@gmx.net>) id 1InBgA-0006mT-Mf
	for linux-lvm@redhat.com; Wed, 31 Oct 2007 12:24:10 +0100
Message-ID: <472865DA.9090801@gmx.net>
Date: Wed, 31 Oct 2007 12:24:10 +0100
From: Paul Muster <paul.muster@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cannot access LVM1 any more
References: <20071002145032.118800@gmx.net> <471A263F.80706@gmx.net>
	<20071020204724.GI10006@agk.fab.redhat.com>
In-Reply-To: <20071020204724.GI10006@agk.fab.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> On Sat, Oct 20, 2007 at 06:01:03PM +0200, Paul Muster wrote:

>> PV /dev/hde2 is a different format (seqno lvm1)
> 
> You tried command line arg: -M1 ?

As soon as I did so, I could restore the LVM-config and then my data. 
Unfortunately I had not found the parameter in the man-page, although it 
is really there.

Good things come to those who wait. Thank you very much for your help!


Greetings,

Paul
