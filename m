Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F04B308BDAC
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 12:32:15 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C28A881DE5
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 12:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id CB39245E
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 14:32:11 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 4aRDfxeFWsio for <linux-lvm@redhat.com>;
	Mon,  9 Jul 2018 14:32:11 +0200 (CEST)
Received: from [IPv6:2003:f6:ebc0:e500:e8a7:e68a:5cd8:5f5a]
	(p200300F6EBC0E500E8A7E68A5CD85F5A.dip0.t-ipconnect.de
	[IPv6:2003:f6:ebc0:e500:e8a7:e68a:5cd8:5f5a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 7996A45C
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 14:32:11 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <d2fad779-7d58-85e8-87f9-bd9ba657ec05@mglug.de>
Date: Mon, 9 Jul 2018 14:32:10 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Error on RegEx with lv_tags-fields
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

Im trying to sort some output with lvs using a regex "=~", which results
in an error:

# lvs -o lv_name,lv_tags -S 'lv_tags=~mac1'
  dm_report: incompatible comparison type for selection field lv_tags

Otherwise, using the =~ operator on lv_names works well:

# lvs -o lv_name -S 'lv_name=~z'
  LV 
  z1 
  z2 
  z3 

If I see right, I can use the selection type "string list" here, but no
regex. Is this right? Is there a way to use regex on tags? Im looking
for a way doing

  "show me all lv's with tags beginning with "abc.."

TfH!

Oliver
