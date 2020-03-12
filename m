Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 428D12026D67
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2020 04:57:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BA978007AC
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2020 04:57:35 +0000 (UTC)
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Thu, 12 Mar 2020 04:56:33 +0000
From: Gang He <GHe@suse.com>
Date: Thu, 12 Mar 2020 04:54:18 +0000
Message-ID: <CH2PR18MB32064A3308D7D5BB3556EC47CFFD0@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Do we have a way to clone the customer lvm2 environment?
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

Hi Guys,

Sometimes we encountered some lvm2 meta-data damage (by lvm2 commands) problems.
Do we have a way to clone (or dump) the customer lvm2 environment? such like file system e2image tool.
for example, we can dump each pv(meta data + data(with file hole)) to a file, 
next we can rebuild the cloned lvm2 environment in local machine.
then, we can verify the fix in local machine with the tentative rpms before give them to the customers.  

Any suggestions for this kind of case?

Thanks
Gang
