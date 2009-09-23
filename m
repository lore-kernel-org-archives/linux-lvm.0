Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8NLeZWD008301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 17:40:37 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1MqZZi-0001Uc-I3
	for linux-lvm@redhat.com; Wed, 23 Sep 2009 22:40:34 +0100
Date: Wed, 23 Sep 2009 22:40:34 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Snapshot rollback
Message-ID: <20090923214034.GE3866@agk-dp.fab.redhat.com>
References: <4ABA8D56.8060803@brunson.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ABA8D56.8060803@brunson.com>
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

On Wed, Sep 23, 2009 at 03:04:22PM -0600, Eric Brunson wrote:
> I remember seeing somewhere discussion of adding the ability to roll  
> back to a snapshot.  I think of how cool this would be about ever six  
> months, usually coinciding with an impending Fedora release.  ;-)

The developers are just starting to submit their patch sequence to the
development mailing lists (dm-devel and lvm-devel) for review.  So
that's targetting linux-next in the next few weeks ready for the 2.6.33
kernel.

Alasdair
