Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA7D2166B44
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2020 06:46:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408F185828C
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2020 06:46:32 +0000 (UTC)
References: <3e4cbb06-6428-45f2-0b42-d7dc5abdfc81@suse.com>
	<20201117161725.GB18257@redhat.com>
	<ad12a987-adaf-db99-2b3a-200a47fc25db@suse.com>
	<20201118182300.GB28264@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <4475fbfc-0f45-4e1a-6d98-973d963d1f69@suse.com>
Date: Thu, 19 Nov 2020 14:46:15 +0800
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>

On 11/19/20 2:23 AM, David Teigland wrote:
> On Wed, Nov 18, 2020 at 09:28:21AM +0800, Gang He wrote:
>> I prefer to use a metadata flag for each VG or LV to skip auto-activation.
>> Otherwise, it is not easy for the pacemaker cluster to manager a local
>> VG(e.g. local or systemid type) in a cluster via active-passive mode.
> 
> I created a bug for this:
> https://bugzilla.redhat.com/show_bug.cgi?id=1899214
> 

Hello Dave

I read the bug ticket and verified the "lvchange -k", it works.
If I understand correctly, the "lvchange -k" is enough for current issue. 
And you previous mails wanted to have a new function/flag for unify management vg & lv, am I right?
