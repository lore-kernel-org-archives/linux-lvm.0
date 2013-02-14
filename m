Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1E0wtJw024783
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2013 19:58:56 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1U5nA6-0006Va-BO
	for linux-lvm@redhat.com; Thu, 14 Feb 2013 00:58:54 +0000
Date: Thu, 14 Feb 2013 00:58:54 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130214005854.GF24130@agk-dp.fab.redhat.com>
References: <511BB48A.3010009@ubuntu.com> <511C33AF.7020506@shiftmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <511C33AF.7020506@shiftmail.org>
Subject: Re: [linux-lvm] pvmove doesn't work the way the man page says
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

On Thu, Feb 14, 2013 at 01:45:35AM +0100, Spelic wrote:
> breaking it up in smaller subsegments would probably have been wiser,  

The plan was always for more frequent checkpoints, but it involves more
complicated code and there's simply been no need to do this: given how rarely
pvmove is used, the current approach seems to be good enough and nobody's
written the extra code yet.

Alasdair
