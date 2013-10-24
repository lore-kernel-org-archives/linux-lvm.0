Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9OGQRYK008462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 12:26:28 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1VZNju-0005Fn-Hq
	for linux-lvm@redhat.com; Thu, 24 Oct 2013 17:26:26 +0100
Date: Thu, 24 Oct 2013 17:26:26 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20131024162626.GC17070@agk-dp.fab.redhat.com>
References: <CAFp1kvNSrN+FiVqyzO2OW7FkjtCA3oeo1DQ3D8m2d9ycSCBvsw@mail.gmail.com>
	<5267FCC6.6060605@tekcomms.com> <5268E9CA.60100@redhat.com>
	<52693D2E.705@dogpad.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52693D2E.705@dogpad.net>
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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

The system has no idea what happened to the PV while it was missing,
so it requires you to take this action to confirm that you've checked
what happened and decided it is OK to continue to use the volume after
it reappears.

Alasdair
