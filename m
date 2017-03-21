Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 245DA5DD62
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2017 19:49:22 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1cqPeR-00041A-7e
	for linux-lvm@redhat.com; Tue, 21 Mar 2017 19:41:03 +0000
Date: Tue, 21 Mar 2017 19:41:03 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20170321194103.GA15432@agk-dp.fab.redhat.com>
References: <CAB-bdySeF5boiNRa6x16-DYPPAz75-36NwYAnK+Y3KvCz_bLBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB-bdySeF5boiNRa6x16-DYPPAz75-36NwYAnK+Y3KvCz_bLBw@mail.gmail.com>
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

On Tue, Mar 21, 2017 at 12:07:59PM -0700, Neutron Sharc wrote:
> Is there some reference about udev rules I should use?
 
It should all be handled consistently by configure and make - be sure to
build and install everything in a consistent way.

If you're using a linux distribution, you'll want to build your
replacement packages using the same lvm2 configuration options / patches
that that distribution uses.

Alasdair
