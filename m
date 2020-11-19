Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF1962166BA2
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2020 02:56:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7482B1021F60
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2020 02:56:33 +0000 (UTC)
References: <3e4cbb06-6428-45f2-0b42-d7dc5abdfc81@suse.com>
	<20201117161725.GB18257@redhat.com>
	<ad12a987-adaf-db99-2b3a-200a47fc25db@suse.com>
	<20201118182300.GB28264@redhat.com>
From: Gang He <ghe@suse.com>
Message-ID: <caf2d160-aa4f-6598-6199-e7727100f87a@suse.com>
Date: Thu, 19 Nov 2020 10:56:15 +0800
In-Reply-To: <20201118182300.GB28264@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] discussion about
 activation/auto_activation_volume_list
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

Hi David,

On 2020/11/19 2:23, David Teigland wrote:
> On Wed, Nov 18, 2020 at 09:28:21AM +0800, Gang He wrote:
>> I prefer to use a metadata flag for each VG or LV to skip auto-activation.
>> Otherwise, it is not easy for the pacemaker cluster to manager a local
>> VG(e.g. local or systemid type) in a cluster via active-passive mode.
> 
> I created a bug for this:
> https://bugzilla.redhat.com/show_bug.cgi?id=1899214
Thank for your follow-up.
More comments here,
Should we keep the default behavior like before? e.g. VG/LV should be 
auto-activated by default like before.Otherwise, some users will feel
strange after lvm upgrade.

Second, how to keep the compatibility with the existed VG/LV? since we 
can upgrade lvm2 version, but VG/LV is possible old. I wonder if there 
are some Reserved Bits in lvm meta-data layout to use? if yes, I feel 
this proposal is very perfect.

Thanks
Gang

> 
> Dave
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
