Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DEE0A289D
	for <linux-lvm@redhat.com>; Sun, 16 Feb 2020 15:17:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05292800260
	for <linux-lvm@redhat.com>; Sun, 16 Feb 2020 15:17:45 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 16 Feb 2020 16:17:37 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <3966a334-3406-94c2-2fce-525b7e14c353@redhat.com>
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
	<4d31a0bd-4456-aecd-ce19-076b1220fd77@redhat.com>
	<b1ad4af5a77d5f02d6629ee4d48a094c@assyoma.it>
	<3966a334-3406-94c2-2fce-525b7e14c353@redhat.com>
Message-ID: <5142ee226bc8527d4e0e7fcb61f6230d@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: David, Teigland <teigland@redhat.com>, heming.zhao@suse.com, LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-02-15 21:19 Zdenek Kabelac ha scritto:
> IMHO ZFS is 'somewhat' slow to play with...
> and I've no idea how ZFS can resolve all correctness issues in 
> kernel...
> 
> Zdenek

Oh, it surely does *not* solve all correctness issues. Rather, having 
much simpler constrains (and use cases), it simply avoids many issues.

That said, what LVM achieve despite all abstraction layers and very 
different goals/use cases really is impressive.

So, thanks to the LVM team for the hard work!

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
