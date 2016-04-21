Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3LABr4Y001096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2016 06:11:54 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1atBaT-0004gc-Bz
	for linux-lvm@redhat.com; Thu, 21 Apr 2016 11:11:53 +0100
Date: Thu, 21 Apr 2016 11:11:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20160421101153.GE11336@agk-dp.fab.redhat.com>
References: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
Subject: Re: [linux-lvm] Why LVM metadata locations are not properly aligned
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Apr 21, 2016 at 12:08:55PM +0800, Ming-Hung Tsai wrote:
> However, it's hard to achieve that if the PV is busy running IO. 

So flush your data in advance of running the snapshot commands so there is only
minimal data to sync during the snapshot process itself.

> The major overhead is LVM metadata IO.

Are you sure?  That would be unusual.  How many copies of the metadata have you
chosen to keep?  (metadata/vgmetadatacopies)  How big is this metadata?  (E.g.
size of /etc/lvm/backup/<vgname> file.)

Alasdair
