Received: from [192.168.1.2] (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k1SDrfOO015445
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 13:53:41 GMT
Message-ID: <440455E5.4060302@redhat.com>
Date: Tue, 28 Feb 2006 13:53:41 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Situation with PVRESIZE command
References: <20060221180029.B14FF12ECC@bluewhale.planbit.co.uk>
In-Reply-To: <20060221180029.B14FF12ECC@bluewhale.planbit.co.uk>
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

Roger Lucas wrote:
> Hi,


> - Is it possible to re-size a PV whilst the system is online using the
> 2.01.15 tools?
> 
> - Is it possible to re-size a PV whilst the system is online using the
> 2.02.02 tools?
> 
> - How "stable" are the 2.02.02 tools, and are there any specific bugs in
> them that may cause problems during typical usage.
> 

If you're wary of the 2.0.2 tools, then why not resize the pv using 2.02 but
leave your existing tools in place ?


-- 

patrick
