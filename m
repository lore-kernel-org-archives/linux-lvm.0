Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3995F8567E
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2017 23:34:19 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1cqpcu-0004iL-Ex
	for linux-lvm@redhat.com; Wed, 22 Mar 2017 23:25:12 +0000
Date: Wed, 22 Mar 2017 23:25:12 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20170322232512.GB15432@agk-dp.fab.redhat.com>
References: <CAB-bdyS2YzqruqsAGpe4risnqFEqLnNxB8y-uFLjq2zm3ATXdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB-bdyS2YzqruqsAGpe4risnqFEqLnNxB8y-uFLjq2zm3ATXdw@mail.gmail.com>
Subject: Re: [linux-lvm] lvm operation hangs at semop()
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

Most likely your lvm and udev rules are incompatible.

As I said before, if you're using a standard distro, you must find out what
patches and config options were used to build the installed packages and use
the same ones when you configure your own lvm build.

Alasdair
