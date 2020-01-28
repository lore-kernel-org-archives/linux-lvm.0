Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAB7C68E5
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2020 14:34:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DBC61019296
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2020 14:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtpi.meduniwien.ac.at (Postfix) with ESMTP id 66D5960056
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2020 15:34:47 +0100 (CET)
Received: from smtpi.meduniwien.ac.at ([127.0.0.1])
	by localhost (mailsip.meduniwien.ac.at [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xfB-H9CHuVhK for <linux-lvm@redhat.com>;
	Tue, 28 Jan 2020 15:34:46 +0100 (CET)
Received: from [149.148.52.63] (itsc063.cc.meduniwien.ac.at [149.148.52.63])
	by smtpi.meduniwien.ac.at (Postfix) with ESMTPS id 275D060006
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2020 15:34:46 +0100 (CET)
References: <31a152c7-6497-aaee-2fe9-996f3a522ed5@meduniwien.ac.at>
From: Matthias Leopold <matthias.leopold@meduniwien.ac.at>
Message-ID: <5e7feaa8-c4a2-0aa4-e507-b6d55094a358@meduniwien.ac.at>
Date: Tue, 28 Jan 2020 15:34:46 +0100
MIME-Version: 1.0
In-Reply-To: <31a152c7-6497-aaee-2fe9-996f3a522ed5@meduniwien.ac.at>
Content-Language: de-AT
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvmove --abort
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



Am 27.01.20 um 17:22 schrieb Matthias Leopold:
> Hi,
> 
> I consciously used "pvmove --abort" for the first time now and I'm 
> astonished it doesn't behave like described in the man page. No matter 
> if I've used "--atomic" for the original command, when I interrupt the 
> process with "pvmove --abort" lvm always completely rolls back my copy 
> operation. I would expect that if I don't use "--atomic" then "--abort" 
> will result in "segments that have been moved will remain on the 
> destination PV, while unmoved segments will remain on the source PV" 
> (from man page). Am I missing something?
> 
> I'm using CentOS 7.7.
> 
thx for answers. apparently I misunderstood the "--atomic" and "--abort" 
options.

matthias
