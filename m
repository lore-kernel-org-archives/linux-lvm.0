Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Chris Webb <chris@arachsys.com>
In-Reply-To: <5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
Date: Mon, 7 Sep 2015 14:08:52 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <6D2FDF98-0E23-4A90-9ED1-3AAD61C3CACB@arachsys.com>
References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com> <55ED77AA.7030708@redhat.com>
	<5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
Subject: Re: [linux-lvm] devices.filter changed behaviour in 80ac8f37d6
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: Richard Davies <richard.davies@elastichosts.com>, LVM general discussion and development <linux-lvm@redhat.com>

Just one final thought. A second reason we deliberately exclude those iSCSI  
devices is that they're actually the drives backing customer VMs, so any  
LVM metadata on them should be interpreted by an untrusted guest kernel and  
not by the host. Untrusted third parties have complete control over the  
contents of the block devices.

Is LVM well-secured against attacks from block devices containing malicious  
LVM metadata? If not, an unexpected change in filtering behaviour might  
potentially be a security issue in some environments.

Cheers,

Chris.
