Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A33F92156A23
	for <linux-lvm@redhat.com>; Sun, 26 Apr 2020 07:26:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65CF580CDB0
	for <linux-lvm@redhat.com>; Sun, 26 Apr 2020 07:26:18 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Sun, 26 Apr 2020 07:25:19 +0000
From: Gang He <GHe@suse.com>
Date: Sun, 26 Apr 2020 07:24:33 +0000
Message-ID: <CH2PR18MB3206B9A2BEB7560D3E00BF58CFAE0@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] can we change cluster_ringid_seq in libdlm from
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello List,

In libdlm code, cluster_ringid_seq variable is defined with uint32_t in dlm_controld/dlm_daemon.h,
the corosync API returns uinit64_t ring_id, in the current code, we use type cast to get the low-32bit ring-id.
But, in some case, the corosync returns a huge ring-id (greater than 32bit), the DLM daemon does not work normally (looks stuck).
Then, I want to know if we can change cluster_ringid_seq in libdlm from uint32_t to uint64_t?

If you'd like to know the details about why corosync ran into such a huge ringid, 
you could check the info from: https://github.com/corosync/corosync/pull/532#issuecomment-617647233

Thanks
Gang
