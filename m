Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iA98ZKbM009816
	for <linux-lvm@redhat.com>; Tue, 9 Nov 2004 08:35:20 GMT
Date: Tue, 9 Nov 2004 08:35:18 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] Possible version problem
Message-ID: <20041109083518.GB18685@tykepenguin.com>
References: <418DAC9C.70205@dakotacom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <418DAC9C.70205@dakotacom.net>
Sender: Patrick <patrick@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: erich1@dakotacom.net, LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Nov 06, 2004 at 10:03:24PM -0700, ewf wrote:
> Well
>      I have a 2.2.20 kernel, (Debian stable), and I have a Debian 
> package for lvm10 and lvm-common:
> 
>            lvm10,  install version, 1.0.4-4
> 
>            lvm-common, install version, 1.5.5
> 
>     I read that, for this early a version, a kernel module must be 
> installed. However, I see no evidence that
> one has been installed. I suspect that the new, (lvm), package may not 
> contain  the kernel module
> necessary to run with the old kernel version. Please confirm.

Linux 2.2 does not have LVM as standard. If you want to use a 2.2 kernel with
LVM you will have to patch and build your own kernel from sources. In which
case it would be far easier just to get a Debian packaged 2.4 kernel....
 
>     I assume that the process of installing a package under Debian 
> automatically installs a kernel
> module if a given package requires it and contains it.

No. Debian packages don't automatically install kernel modules because they
don't know which kernel you are running.
 

-- 

patrick
