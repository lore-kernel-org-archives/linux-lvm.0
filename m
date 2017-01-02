Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02Gv3DR002298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 2 Jan 2017 11:57:03 -0500
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37CAB8553C
	for <linux-lvm@redhat.com>; Mon,  2 Jan 2017 16:57:03 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 75so48368307ite.1
	for <linux-lvm@redhat.com>; Mon, 02 Jan 2017 08:57:02 -0800 (PST)
Received: from [192.168.1.6] (d24-150-100-81.home.cgocable.net.
	[24.150.100.81]) by smtp.googlemail.com with ESMTPSA id
	l3sm32206323ioa.7.2017.01.02.08.57.00 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 08:57:01 -0800 (PST)
References: <fa65ab01-440c-99a2-a13b-807d302c14e6@gmail.com>
	<6d81aa92-0b9a-56c9-9577-3c6bf13f6a76@redhat.com>
	<610b64fb-b185-4480-2739-9d6ce600c287@gmail.com>
	<dd4b1b45-daa4-06eb-7bf1-9dd3ac4f0276@redhat.com>
From: Raman Gupta <rocketraman@gmail.com>
Message-ID: <80e1d45a-b282-055b-6bfc-046e71e07905@gmail.com>
Date: Mon, 2 Jan 2017 11:57:00 -0500
MIME-Version: 1.0
In-Reply-To: <dd4b1b45-daa4-06eb-7bf1-9dd3ac4f0276@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Two questions about lvm-cache
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

On 02/01/17 11:20 AM, Zdenek Kabelac wrote:
>>
>> # lvchange --verbose --cachemode writeback vg_raid10/lv_var
>> lvchange: unrecognized option '--cachemode'
>>   Error during parsing of command line.
>>
> 
> 
> Please use some more recent version of lvm2  ( > 2.02.155)
> The newer the better...

Ah, thank you. F23 has only .150 available. That explains it.

Regards,
Raman
