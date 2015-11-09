Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA91Dj5k011849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 8 Nov 2015 20:13:45 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (Postfix) with ESMTPS id 305DA2651
	for <linux-lvm@redhat.com>; Mon,  9 Nov 2015 01:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id C00A320042E
	for <linux-lvm@redhat.com>; Mon,  9 Nov 2015 02:13:40 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 09PBkxKIUKtd for <linux-lvm@redhat.com>;
	Mon,  9 Nov 2015 02:13:36 +0100 (CET)
Received: from [192.168.200.186] (host-62-245-233-61.customer.m-online.net
	[62.245.233.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 5DFE820042A
	for <linux-lvm@redhat.com>; Mon,  9 Nov 2015 02:13:35 +0100 (CET)
From: Oliver Rath <rath@mglug.de>
Message-ID: <563FF33C.3010500@mglug.de>
Date: Mon, 9 Nov 2015 02:13:32 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Kombination of lvm-tags
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

Hi list,

I see that I can use tags to group LVs together like a set union. So, if
a couple of LVs have tag @a, another the tag @b, I can see all these LVs
with

lvs @a @b

If now I want to see the LVs having @a *AND* @b, is this possible?

Tfh!
Oliver
