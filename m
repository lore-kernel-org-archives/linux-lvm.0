Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91BC06027E
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2017 09:02:41 +0000 (UTC)
Received: from sonic308-18.consmr.mail.ir2.yahoo.com
	(sonic308-18.consmr.mail.ir2.yahoo.com [77.238.178.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A26F9C0587DC
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2017 09:02:40 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
Date: Mon, 16 Oct 2017 10:02:35 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Subject: [linux-lvm] raid10 to raid what? - convert
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

hi everyone

I'm sroogling and reading but before spend whole day doing 
that, I was hoping you guys, gals, done conversion from raid10?

I'm thinking best(natural?) would be to convert to two raid0 
LVs, right. Am I right? Would it be optimal, and how do you 
do it?

many thanks, L.
