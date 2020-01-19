Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E97B88FB0B
	for <linux-lvm@redhat.com>; Sun, 19 Jan 2020 12:59:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 679F480096D
	for <linux-lvm@redhat.com>; Sun, 19 Jan 2020 12:59:19 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr013msb.fastweb.it (5.8.208)
	id 5E19B49F00961C9B for linux-lvm@redhat.com;
	Sun, 19 Jan 2020 13:59:15 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2020 13:59:15 +0100
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <cc1e366b92c320a306f5bd0aa2ec04d6@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Time needed for take a snapshot
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

Hi list,
just for confirmation: is the time needed to take a snapshot constant, 
or does it depend on how many chunks are mapped in/by the specific thin 
pool and volume? In other workds, is snapshot create time O(1) or O(n)?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
