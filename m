Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IKuQrE013159
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 16:56:26 -0400
Received: from ns3.lanforge.com (mail.candelatech.com [208.74.158.172])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8IKuG5M019895
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 16:56:16 -0400
Received: from [192.168.100.195] (firewall.candelatech.com [70.89.124.249])
	(authenticated bits=0)
	by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id n8IKuE1T020735
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 13:56:14 -0700
Message-ID: <4AB3F3EE.5040004@candelatech.com>
Date: Fri, 18 Sep 2009 13:56:14 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question on compatibility with 2.6.31 kernel.
References: <4AB3DE8E.9080301@candelatech.com> <4AB3E3F7.2060704@redhat.com>
In-Reply-To: <4AB3E3F7.2060704@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 09/18/2009 12:48 PM, Milan Broz wrote:
> Ben Greear wrote:
>> I recently tried to boot 2.6.31 on Fedora 8, and it couldn't
>> find the volume groups.  The same kernel works fine on F11.
>
> try to recompile kernel with
> CONFIG_SYSFS_DEPRECATED=y
> CONFIG_SYSFS_DEPRECATED_V2=y
>
> (old lvm will not understand new sysfs design, this should
> provide old sysfs entries)

That did the trick, thanks!

Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com
