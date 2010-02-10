Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1AEMKVa005766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2010 09:22:21 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1NfDSU-00020x-9D
	for linux-lvm@redhat.com; Wed, 10 Feb 2010 14:22:26 +0000
Date: Wed, 10 Feb 2010 14:22:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100210142226.GF18505@agk-dp.fab.redhat.com>
References: <1265793636.27966.3@raydesk1.bettercgi.com>
	<4B72BAF5.9090005@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B72BAF5.9090005@tlinx.org>
Subject: Re: [linux-lvm] lvextend docmentation vs.
	implementation	(lvm2-2.02.39), Suse-11.1
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

On Wed, Feb 10, 2010 at 05:56:05AM -0800, Linda A. Walsh wrote:
>    Sorry -- I was using it with capital "L" not lower case...didn't know
> there were two separate switches... my bad.
> thanks,

The implementation of the feature turned out simpler with -l than with -L.
(Because sizes supplied with -L require conversion to 'natural units'
of extents which may involve rounding.)

Alasdair
