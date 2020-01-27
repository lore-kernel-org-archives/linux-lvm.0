Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1906863A7D
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 16:22:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 924BF10197EF
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 16:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtpi.meduniwien.ac.at (Postfix) with ESMTP id 1B6526003C
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 17:22:30 +0100 (CET)
Received: from smtpi.meduniwien.ac.at ([127.0.0.1])
	by localhost (mailsip.meduniwien.ac.at [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id WKkl1qT3oLBi for <linux-lvm@redhat.com>;
	Mon, 27 Jan 2020 17:22:29 +0100 (CET)
Received: from [149.148.52.63] (itsc063.cc.meduniwien.ac.at [149.148.52.63])
	by smtpi.meduniwien.ac.at (Postfix) with ESMTPS id 06C976002D
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 17:22:29 +0100 (CET)
From: Matthias Leopold <matthias.leopold@meduniwien.ac.at>
Message-ID: <31a152c7-6497-aaee-2fe9-996f3a522ed5@meduniwien.ac.at>
Date: Mon, 27 Jan 2020 17:22:28 +0100
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvmove --abort
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
To: linux-lvm@redhat.com

Hi,

I consciously used "pvmove --abort" for the first time now and I'm 
astonished it doesn't behave like described in the man page. No matter 
if I've used "--atomic" for the original command, when I interrupt the 
process with "pvmove --abort" lvm always completely rolls back my copy 
operation. I would expect that if I don't use "--atomic" then "--abort" 
will result in "segments that have been moved will remain on the 
destination PV, while unmoved segments will remain on the source PV" 
(from man page). Am I missing something?

I'm using CentOS 7.7.

thx
matthias
