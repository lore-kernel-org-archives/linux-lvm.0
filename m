Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49D062166BA4
	for <linux-lvm@redhat.com>; Thu,  3 Sep 2020 14:58:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54216801223
	for <linux-lvm@redhat.com>; Thu,  3 Sep 2020 14:58:36 +0000 (UTC)
References: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
	<ff41471a-d775-a314-434a-eac3fd0668a4@suse.com>
	<80e36f4c-8193-1df5-41ad-e0caf42f6537@redhat.com>
	<4bb3e590-39f1-75e7-9000-03d1d3fc0e73@suse.com>
	<66fe8fdc-3147-8a22-9a34-7201f4187be4@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <39629002-09bb-7aa0-1053-66670c2ee5d0@suse.com>
Date: Thu, 3 Sep 2020 22:58:20 +0800
In-Reply-To: <66fe8fdc-3147-8a22-9a34-7201f4187be4@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH] gcc: change zero-sized array to fexlible
	array
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: dcermak@suse.com

Hello Zdenek,

For dependency, I patched below 3 patches, the opensuse tumbleweed building completed successfully

```
