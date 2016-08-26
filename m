Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7QHtFPS027417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 13:55:15 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 662BAC05678C
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 17:55:12 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id 748AE40B2392
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 19:55:10 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 26 Aug 2016 19:55:10 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
	<1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
	<1004ca527029b35e6d621a2629fd6ed4@dds.nl>
	<e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
Message-ID: <1234596c91e51623e6a675acfc1b05dd@dds.nl>
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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

lejeczek schreef op 26-08-2016 16:01:
> whatever you might call it, it works, luks encrypting, opening &
> mounting @boot - so I only wonder (which was my question) why not
> cache pool LVs. Is it not supported...
> would be great if a developer sees this question, I'm not sure jut yet
> about filing a bug report.

Ondrej has it down.

You can only encrypt the combined volume, not the individual parts, 
unless you encrypt those at the PV level.
