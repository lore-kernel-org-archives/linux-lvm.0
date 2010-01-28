Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0SMemwZ013078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 17:40:49 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1Nad2g-0002QF-4s
	for linux-lvm@redhat.com; Thu, 28 Jan 2010 22:40:50 +0000
Date: Thu, 28 Jan 2010 22:40:50 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100128224049.GK5478@agk-dp.fab.redhat.com>
References: <20100128200119.GA15513@maude.comedia.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20100128200119.GA15513@maude.comedia.it>
Subject: Re: [linux-lvm] loading of dm-mod by libdevmapper
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Jan 28, 2010 at 09:01:19PM +0100, Luca Berra wrote:
> Is there any particular reason why libdevmapper does not load dm-mod as
> needed, like lvm does for dm targets?

Until recently libdevmapper did not have target-specific code (which this
would need).  Ultimately I want to move most of the target-specific 
activation code out of LVM into libdevmapper.

> Would a patch in this sense be accepted?

Depends on the patch.  If it works as the next step of this 'moving the code
scheme' or is tiny, perhaps.  If it's too clumsy or would have to be removed
before moving the code in, no.

Alasdair
