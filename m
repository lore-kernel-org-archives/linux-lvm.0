Received: from ns3.rdu.redhat.com (ns3.rdu.redhat.com [10.11.255.199])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m836KTaq032293
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 02:20:29 -0400
Received: from [10.32.4.44] (vpn-4-44.str.redhat.com [10.32.4.44])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m836KSta020808
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 02:20:29 -0400
Message-ID: <48BE2CAC.3050401@redhat.com>
Date: Wed, 03 Sep 2008 08:20:28 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 15 snapshot limit?
References: <1c748a490808291310g274df331ifc76fce539b56954@mail.gmail.com>	<48B85CB6.1080403@redhat.com>	<1c748a490808291412w17dd93f9qcd1454979e77c181@mail.gmail.com>	<1c748a490809020731i39b214ebhc6e76fd964fc75b4@mail.gmail.com>
	<1c748a490809021519i294d1d9fp912ce93cbf6f75d2@mail.gmail.com>
In-Reply-To: <1c748a490809021519i294d1d9fp912ce93cbf6f75d2@mail.gmail.com>
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

Larry Dickson wrote:
> More details: I found a /var/log/messages note that corresponded exactly

Please try recent kernel (>2.6.22). Or patched distro kernel,
e.g. RHEL/CentOS has patched kernel already since 2007
see  https://bugzilla.redhat.com/show_bug.cgi?id=211516

Also recent upstream kernels have a little bit optimized way how to store
snapshot exceptions in memory, which should help here too.
See https://bugzilla.redhat.com/show_bug.cgi?id=421451

There is no magic formula how many snapshots is possible,
previously it was limited by one common mempool (see bug above),
and for some reason it fails in cca ~32 snapshot - but it is no longer true
(And increasing memory doesn't help with these old unpatched kernels.)

With 6GB of memory you should be able create tens of snapshots at least.
(But it will be just very slow - every snapshot is independent.)

Thanks,
Milan
