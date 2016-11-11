Received: from [10.10.61.253] (vpn-61-253.rdu2.redhat.com [10.10.61.253])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uABEUTl2022418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2016 09:30:30 -0500
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <5821EC1A.306@strike.wu.ac.at>
Date: Fri, 11 Nov 2016 08:30:28 -0600
Message-Id: <573002B3-4495-4E25-B444-027BB87E0F73@redhat.com>
References: <582049AF.7010905@strike.wu.ac.at>
	<6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>
	<5820A497.80501@strike.wu.ac.at>
	<3c20480f-45e2-5864-cebc-ddc43b563944@redhat.com>
	<5821EC1A.306@strike.wu.ac.at>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] very slow sequential writes on lvm raid1 (bitmap?)
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

I’ll get a bug created for this and we’ll fix it.

thanks,
 brassow

> On Nov 8, 2016, at 9:15 AM, Alexander 'Leo' Bergolth <leo@strike.wu.ac.at> wrote:
> 
> lvconvert seems to ignore the --regionsize option and use defaults:
