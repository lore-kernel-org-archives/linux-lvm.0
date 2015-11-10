Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAA8nhxQ019252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 Nov 2015 03:49:44 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (Postfix) with ESMTPS id 4E8E04E
	for <linux-lvm@redhat.com>; Tue, 10 Nov 2015 08:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id F1E20200435
	for <linux-lvm@redhat.com>; Tue, 10 Nov 2015 09:49:39 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id CukunOolfK9C for <linux-lvm@redhat.com>;
	Tue, 10 Nov 2015 09:49:39 +0100 (CET)
Received: from [192.168.178.27] (p5DD7AD86.dip0.t-ipconnect.de
	[93.215.173.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id A0AA6200433
	for <linux-lvm@redhat.com>; Tue, 10 Nov 2015 09:49:39 +0100 (CET)
References: <563FF33C.3010500@mglug.de> <5640568C.6090009@gmail.com>
From: Oliver Rath <rath@mglug.de>
Message-ID: <5641AFA2.1060209@mglug.de>
Date: Tue, 10 Nov 2015 09:49:38 +0100
MIME-Version: 1.0
In-Reply-To: <5640568C.6090009@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [SOLVED] Re:  Kombination of lvm-tags
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

Hi Zdenek,

On 09.11.2015 09:17, Zdenek Kabelac wrote:
> Dne 9.11.2015 v 02:13 Oliver Rath napsal(a):
>> Hi list,
>>
>> I see that I can use tags to group LVs together like a set union. So, if
>> a couple of LVs have tag @a, another the tag @b, I can see all these LVs
>> with
>>
>> lvs @a @b
>>
>> If now I want to see the LVs having @a *AND* @b, is this possible?
>>
>>
> 
> Please check possibilities of --select  option.

This look like exactly where I looked for! Thank you very much!

Regards,
Oliver
