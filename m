Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 892B960928
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 09:11:26 +0000 (UTC)
Received: from smtp1-3.goneo.de (smtp1-3.goneo.de [85.220.129.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D5A6356CA
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 09:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.goneo.de (Postfix) with ESMTP id DE9CB23F2FC
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 11:11:22 +0200 (CEST)
Received: from smtp1.goneo.de ([127.0.0.1])
	by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yP1r7c-mOqsl for <linux-lvm@redhat.com>;
	Mon,  9 Jul 2018 11:11:22 +0200 (CEST)
Received: from [192.168.42.20] (p54ACDFEA.dip0.t-ipconnect.de [84.172.223.234])
	by smtp1.goneo.de (Postfix) with ESMTPSA id 2761523F0D5
	for <linux-lvm@redhat.com>; Mon,  9 Jul 2018 11:11:22 +0200 (CEST)
From: Oliver Rath <oliver@greenunit.de>
Message-ID: <7217e1f7-ccbe-e072-e8fc-6bf0fac92b0a@greenunit.de>
Date: Mon, 9 Jul 2018 11:11:21 +0200
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
regex. Is this right? Is there a way to use regex on tags?

TfH!

Oliver
