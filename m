Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02FTbCB008834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 2 Jan 2017 10:29:38 -0500
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDAF43DFCC
	for <linux-lvm@redhat.com>; Mon,  2 Jan 2017 15:29:36 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n68so48160199itn.3
	for <linux-lvm@redhat.com>; Mon, 02 Jan 2017 07:29:35 -0800 (PST)
Received: from [192.168.1.6] (d24-150-100-81.home.cgocable.net.
	[24.150.100.81]) by smtp.googlemail.com with ESMTPSA id
	i200sm30764388itb.0.2017.01.02.07.29.34 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 07:29:34 -0800 (PST)
References: <fa65ab01-440c-99a2-a13b-807d302c14e6@gmail.com>
	<6d81aa92-0b9a-56c9-9577-3c6bf13f6a76@redhat.com>
From: Raman Gupta <rocketraman@gmail.com>
Message-ID: <610b64fb-b185-4480-2739-9d6ce600c287@gmail.com>
Date: Mon, 2 Jan 2017 10:29:33 -0500
MIME-Version: 1.0
In-Reply-To: <6d81aa92-0b9a-56c9-9577-3c6bf13f6a76@redhat.com>
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

On 02/01/17 10:15 AM, Zdenek Kabelac wrote:
> Dne 29.12.2016 v 14:52 Raman Gupta napsal(a):
>> I am trying out the lvmcache functionality. So far, everything looks
>> great. I have two questions:
>>
>> 1) The man page of lvmcache states "With the --cachemode option, the
>> cache mode can be set when creating a cache LV, or changed on an
>> existing cache LV." However, I can't figure out the right command to
>> change the cache mode on an existing LV.
> 
> 
> Hi
> 
> 
> 'change' of cachemode  is  'lvchange' operation

Hmm, there is no mention of cachemode change in `lvchange` man page
(nor a reference from `lvmcache` man page). Guessing at the syntax,
still no luck:

# lvchange --verbose --cachemode writeback vg_raid10/lv_var
lvchange: unrecognized option '--cachemode'
  Error during parsing of command line.

Regards,
Raman
