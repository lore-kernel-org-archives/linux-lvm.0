Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DC166062D
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2017 06:07:01 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FE286A7DF
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2017 06:07:00 +0000 (UTC)
From: Eric Ren <zren@suse.com>
Message-ID: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
Date: Mon, 30 Oct 2017 14:06:45 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] When and why vgs command can change metadata and incur
 old metadata to be backed up?
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

Hi all,

Sometimes, I see the following message in the VG metadata backups under 
/etc/lvm/archive:

"""
contents = "Text Format Volume Group"
version = 1

description = "Created *before* executing 'vgs'"
"""

I'm wondering when and why the new backups will be created by reporting 
command like vgs?

Thanks in advance!
Eric
