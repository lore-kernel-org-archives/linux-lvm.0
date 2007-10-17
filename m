Received: from jeltz.pjc.net (vpn-6-1.fab.redhat.com [10.33.6.1])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l9H8HMJl027483
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 04:17:22 -0400
Message-ID: <4715C511.3050400@redhat.com>
Date: Wed, 17 Oct 2007 09:17:21 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] stupid question about lvm/lvm2/clvm
References: <4715A86F.40504@ezpear.com>
In-Reply-To: <4715A86F.40504@ezpear.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hans wrote:
> Hi!
> I want build cluster. I couldn't decide about which system use OCFS2 or
> GFS2.
> I was looking for some information about clvm.
> On redhat website I found some tarball with clvm toolset but called lvm2...
> Does it mean that clvm=lvm2? Or clvm is special extension to lvm2, not
> identical with lvm2.

The source tarball for lvm2 includes clvmd too. Enable it at compile-time time using
./configure --with-clvmd

If you're using RPMs then the cluster LVM one is called lvm2-cluster

> I use openfiler (installed lvm2-2.02.14). Does it include clvm ext.?
> 
> 


-- 
Patrick
