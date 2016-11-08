Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA8FFgC9007683
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 8 Nov 2016 10:15:43 -0500
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B94DBC057FAD
	for <linux-lvm@redhat.com>; Tue,  8 Nov 2016 15:15:40 +0000 (UTC)
Message-ID: <5821EC1A.306@strike.wu.ac.at>
Date: Tue, 08 Nov 2016 16:15:38 +0100
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
References: <582049AF.7010905@strike.wu.ac.at>	<6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>	<5820A497.80501@strike.wu.ac.at>
	<3c20480f-45e2-5864-cebc-ddc43b563944@redhat.com>
In-Reply-To: <3c20480f-45e2-5864-cebc-ddc43b563944@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 11/08/2016 10:26 AM, Zdenek Kabelac wrote:
> Dne 7.11.2016 v 16:58 Alexander 'Leo' Bergolth napsal(a):
>> On 11/07/2016 11:22 AM, Zdenek Kabelac wrote:
>> Is there a way to change the regionsize for an existing LV?
>
> I'm afraid there is not yet support for runtime 'regionsize' change
> other then rebuilding array.

Unfortunately even rebuilding (converting to linear and back to raid1)
doesn't work.

lvconvert seems to ignore the --regionsize option and use defaults:

lvconvert -m 0 /dev/vg_sys/lv_test
lvconvert --type raid1 -m 1 --regionsize 128M /dev/vg_sys/lv_test

[10881847.012504] mdX: bitmap initialized from disk: read 1 pages, set
4096 of 4096 bits

... which translates to a regionsize of 512k for a 2G volume.

:-(

Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
