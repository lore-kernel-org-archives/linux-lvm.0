Received: from [10.36.7.58] (vpn1-7-58.ams2.redhat.com [10.36.7.58])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2REYdkd029211
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2012 10:34:39 -0400
Message-ID: <4F71CFFF.6090909@redhat.com>
Date: Tue, 27 Mar 2012 16:34:39 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F6ECF9B.40907@nuclearwinter.com>
	<20120326155540.19c85fe9@bettercgi.com>
	<4F7100EC.6070406@nuclearwinter.com>
In-Reply-To: <4F7100EC.6070406@nuclearwinter.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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
To: linux-lvm@redhat.com

Dne 27.3.2012 01:51, Larkin Lowrey napsal(a):
> That helped bring the lvcreate time down from 2min to 1min so that's an
> improvement.  Thank you.
> 
> The source of the remaining slowdown is the writing of metadata to my 4
> PVs. The writes are small and the arrays are all raid5 so each metadata
> write is also requiring a read. I'm still at a loss for why this was not
> a problem when running F15 but the filter is a workable solution for me
> so I'll leave it alone.
> 


Could you please attach attach output of 'lvs -a' and eventually your md array
setup.

Ideally open regular bugzilla for f16.

Zdenek
