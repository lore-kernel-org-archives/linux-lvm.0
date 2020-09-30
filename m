Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ABF12156A3A
	for <linux-lvm@redhat.com>; Wed, 30 Sep 2020 10:09:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76FFB811E7F
	for <linux-lvm@redhat.com>; Wed, 30 Sep 2020 10:09:20 +0000 (UTC)
References: <HE1PR0402MB3514DC4297C272DF86ECB70FCF320@HE1PR0402MB3514.eurprd04.prod.outlook.com>
	<20200929140230.GA19493@redhat.com>
From: Gang He <ghe@suse.com>
Message-ID: <bb9b3f06-b5cc-bca1-404e-22a7296b5be0@suse.com>
Date: Wed, 30 Sep 2020 18:08:53 +0800
In-Reply-To: <20200929140230.GA19493@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvresize cannot refresh LV size on on other hosts
 when extending LV with a shared lock
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
To: David Teigland <teigland@redhat.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi David,

Thank for your helps.

On 9/29/2020 10:02 PM, David Teigland wrote:
> On Tue, Sep 29, 2020 at 08:46:25AM +0000, Gang He wrote:
>> ghe-tw-nd1# lvresize -L+1024M vg1/lv1
>>    WARNING: extending LV with a shared lock, other hosts may require LV refresh.
>>    Size of logical volume vg1/lv1 changed from 13.00 GiB (3328 extents) to 14.00 GiB (3584 extents).
>>    Logical volume vg1/lv1 successfully resized.
>>    Refreshing LV /dev//vg1/lv1 on other hosts...
> 
> Triggering remote lvchange refresh for lvresize has been implemented using
> dlm_controld.  See configure --enable-lvmlockd-dlmcontrol which enables
> lvmlockd to use the libdlmcontrol api dlmc_run_start/dlm_run_check.
> Dave
That means LV size will be refreshed automatically if this configure 
option is enabled, right?
If we do not enable this configure option, we can use "lvchange 
--refresh vg/lv" on the other nodes to synchronize LV size, right?
This command will affect the upper cluster file system if it is running?

Thanks
Gang
