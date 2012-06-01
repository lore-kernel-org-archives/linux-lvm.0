Received: from [10.34.30.250] (dhcp-30-250.brq.redhat.com [10.34.30.250])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q517sr2b009547
	for <linux-lvm@redhat.com>; Fri, 1 Jun 2012 03:54:54 -0400
Message-ID: <4FC8754C.3090509@redhat.com>
Date: Fri, 01 Jun 2012 09:54:52 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <FB833AE6C7173C449F93C243719A4C8F96FF7B2E@Exchange2010.corit.local>
In-Reply-To: <FB833AE6C7173C449F93C243719A4C8F96FF7B2E@Exchange2010.corit.local>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin provisioning on a cluster
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 31.5.2012 07:36, Matthew Anderson napsal(a):
> Hi all,
>
> I sifted through the mailing list and wasn't able to find if thin provisioning can be used with clustering, is anyone able to confirm?

You should be able to active thin pool and thin volume exclusively on one 
node. There is no way to active thin volumes from one pool on different nodes.
Only one node could work with pool data and metadata.
So if you want to activate volume on multiple nodes, thin provisioning will 
not help.

Zdenek
