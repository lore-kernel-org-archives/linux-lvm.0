Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61218106B459
	for <linux-lvm@redhat.com>; Fri, 15 May 2020 07:44:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9E7B8A19B2
	for <linux-lvm@redhat.com>; Fri, 15 May 2020 07:44:45 +0000 (UTC)
From: Gang He <GHe@suse.com>
Date: Fri, 15 May 2020 07:42:16 +0000
Message-ID: <CH2PR18MB3206236312047FF9317ECD22CFBD0@CH2PR18MB3206.namprd18.prod.outlook.com>
References: <CH2PR18MB3206B9A2BEB7560D3E00BF58CFAE0@CH2PR18MB3206.namprd18.prod.outlook.com>
	<20200427150341.GA27631@redhat.com>
In-Reply-To: <20200427150341.GA27631@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] can we change cluster_ringid_seq in libdlm from
 uint32_t to uint64_t?
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
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi David,

I did some testing with this patch.
It looks OK. Do you plan to commit the patch into the git tree?


Thanks
Gang

> -----Original Message-----
> From: David Teigland [mailto:teigland@redhat.com]
> Sent: 2020��4��27�� 23:04
> To: Gang He <GHe@suse.com>
> Cc: LVM general discussion and development <linux-lvm@redhat.com>
> Subject: Re: [linux-lvm] can we change cluster_ringid_seq in libdlm from
> uint32_t to uint64_t?
> 
> On Sun, Apr 26, 2020 at 07:24:33AM +0000, Gang He wrote:
> > Hello List,
> >
> > In libdlm code, cluster_ringid_seq variable is defined with uint32_t
> > in dlm_controld/dlm_daemon.h, the corosync API returns uinit64_t ring_id,
> in the current code, we use type cast to get the low-32bit ring-id.
> > But, in some case, the corosync returns a huge ring-id (greater than 32bit),
> the DLM daemon does not work normally (looks stuck).
> > Then, I want to know if we can change cluster_ringid_seq in libdlm from
> uint32_t to uint64_t?
> 
> That looks ok, please try the attached patch.
> Dave
