Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F601019639
	for <linux-lvm@redhat.com>; Fri, 30 Nov 2018 09:35:19 +0000 (UTC)
Received: from mr014msb.fastweb.it (mr014msb.fastweb.it [85.18.95.103])
	by mx1.redhat.com (Postfix) with ESMTP id 6460430DF71D
	for <linux-lvm@redhat.com>; Fri, 30 Nov 2018 09:35:15 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr014msb.fastweb.it (5.8.208)
	id 5BFFC3990018C56D for linux-lvm@redhat.com;
	Fri, 30 Nov 2018 10:35:13 +0100
Received: from gdanti-lenovo.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 9173D235783
	for <linux-lvm@redhat.com>; Fri, 30 Nov 2018 10:35:13 +0100 (CET)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <d2703951-8ad3-9419-82b3-ead1481c58c1@assyoma.it>
Date: Fri, 30 Nov 2018 10:35:08 +0100
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] bcache as a new i/o layer?
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
in BZ 1643651 I read:

"In 7.6 (and 8.0), lvm began using a new i/o layer (bcache)
to read and write data blocks."

Last time I checked, bcache was a completely different caching layer, 
unrelated from LVM. The above quote, instead, implies that bcache is now 
actively used by LVM.

Am I missing something? Can you explain how they interact/behave?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
