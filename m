Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u39Njx0P027745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 9 Apr 2016 19:46:00 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1ap2Zi-0005K9-Qt
	for linux-lvm@redhat.com; Sun, 10 Apr 2016 00:45:58 +0100
Date: Sun, 10 Apr 2016 00:45:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20160409234558.GI9081@agk-dp.fab.redhat.com>
References: <20160409101245.GB31040@nicku.org> <57094147.202@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57094147.202@redhat.com>
Subject: Re: [linux-lvm] Shrinking LVM partition at beginning
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

On Sat, Apr 09, 2016 at 07:52:07PM +0200, Zdenek Kabelac wrote:
> Unsupported 

The process could easily be automated, but there just isn't enough
demand to justify spending the time writing and testing code for it.

An expert would also find it pretty easy to test each step as they
proceeded without making any irreversible changes that risked data
loss.  E.g. using device-mapper to try out the device in advance
of the partition table change with the PV header sectors mapped 
somewhere else and using some of the advanced lvm.conf options 
that take metadata from elsewhere.

Alasdair
