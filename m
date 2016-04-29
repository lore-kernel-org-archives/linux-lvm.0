Received: from [10.10.55.165] (vpn-55-165.rdu2.redhat.com [10.10.55.165])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3TDQTqV026815
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 09:26:29 -0400
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <8B2E34D671F53945B041A44D66D79E6EAABD77@P-EXMB5-DC21.corp.sgi.com>
Date: Fri, 29 Apr 2016 08:26:28 -0500
Message-Id: <E412E125-5E55-47FF-B68F-86715DB7261D@redhat.com>
References: <8B2E34D671F53945B041A44D66D79E6EAABD77@P-EXMB5-DC21.corp.sgi.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM feature parity with MD
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

We are working on reviewing the patches ATM.  The short answer to “when” is when you start seeing the upstream commits start flowing into the various trees.  There are kernel patches required, followed by a number of userspace enablement patches.  We hope it is measured in weeks, not months.

Thanks,
 brassow

> On Apr 26, 2016, at 1:25 PM, Jason Czerak <jczerak@sgi.com> wrote:
> 
> I found the presentation linked below regarding LVM’s new features and I’m wondering if anyone shed any light on when these may become stable? Specifically the RAID0 reshaping.
>  
> https://guug.de/veranstaltungen/ffg2016/slides/Heinz%20Mauelshagen%20-%20Neueste%20Entwicklungen%20in%20LVM%20RAID.pdf
>  
> --
> Jason Czerak 
>  
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
