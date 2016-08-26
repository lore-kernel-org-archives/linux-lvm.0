Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7QE1l5q020053
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 10:01:47 -0400
Received: from nm9-vm1.bullet.mail.ir2.yahoo.com
	(nm9-vm1.bullet.mail.ir2.yahoo.com [212.82.96.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1A90155E3
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 14:01:39 +0000 (UTC)
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
	<1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
	<1004ca527029b35e6d621a2629fd6ed4@dds.nl>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
Date: Fri, 26 Aug 2016 15:01:37 +0100
MIME-Version: 1.0
In-Reply-To: <1004ca527029b35e6d621a2629fd6ed4@dds.nl>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

whatever you might call it, it works, luks encrypting, 
opening & mounting @boot - so I only wonder (which was my 
question) why not cache pool LVs. Is it not supported...
would be great if a developer sees this question, I'm not 
sure jut yet about filing a bug report.

On 26/08/16 14:28, Xen wrote:
> lejeczek schreef op 26-08-2016 14:45:
>> well, I prefer to encrypt LV itself, and I'm trying the 
>> same what
>> worked always with my "regular" LVs, yet - "cache pools 
>> LVs" fail to
>> encrypt with: Command failed with code 22.
>
> If you are going to encrypt an LV it will no longer be an 
> LV but an (opened) LUKS container.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
