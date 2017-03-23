Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A21D45DD62
	for <linux-lvm@redhat.com>; Thu, 23 Mar 2017 01:37:04 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1cqrXd-0004kd-KY
	for linux-lvm@redhat.com; Thu, 23 Mar 2017 01:27:53 +0000
Date: Thu, 23 Mar 2017 01:27:53 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20170323012753.GC15432@agk-dp.fab.redhat.com>
References: <CAB-bdyS2YzqruqsAGpe4risnqFEqLnNxB8y-uFLjq2zm3ATXdw@mail.gmail.com>
	<20170322232512.GB15432@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170322232512.GB15432@agk-dp.fab.redhat.com>
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

On Wed, Mar 22, 2017 at 11:25:12PM +0000, Alasdair G Kergon wrote:
> As I said before, if you're using a standard distro, you must find out what
> patches and config options were used to build the installed packages and use
> the same ones when you configure your own lvm build.
 
I've added an upstream patch so that - once it has found its way into
the distributions - you'll be able to get quickly the configuration line
used by the build by running 'lvm version'.

Alasdair
