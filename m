Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F4E15D965
	for <linux-lvm@redhat.com>; Tue, 31 Oct 2017 07:59:39 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41BB5C059721
	for <linux-lvm@redhat.com>; Tue, 31 Oct 2017 07:59:38 +0000 (UTC)
Date: Tue, 31 Oct 2017 15:54:24 +0800
From: Eric Ren <zren@suse.com>
Message-ID: <20171031075424.GA18156@laptop.apac.novell.com>
References: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
	<20171030170451.GB28695@redhat.com>
	<02763e2a9b9872a01a7a0e4e54e2230e@assyoma.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02763e2a9b9872a01a7a0e4e54e2230e@assyoma.it>
Subject: Re: [linux-lvm] When and why vgs command can change metadata and
 incur old metadata to be backed up?
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
Content-Transfer-Encoding: 7bit
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

> 
> Interesting. Eric, can you show the *before* and *after* vgs textual
> metadata (you should find them in /etc/lvm/archive)?
> 

Ah, I think no need to show the archives now. Alasdair and David have
given us a very good explanation, thanks for them!

Regards,
Eric
