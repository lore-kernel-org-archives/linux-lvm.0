Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42FFE5D6A6
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 00:04:21 +0000 (UTC)
Received: from sonic308-10.consmr.mail.gq1.yahoo.com
	(sonic308-10.consmr.mail.gq1.yahoo.com [98.137.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C795E356C9
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 00:04:20 +0000 (UTC)
Date: Wed, 13 Sep 2017 00:04:10 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <57374453.843393.1505261050977@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <57374453.843393.1505261050977.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

'yes'

The filesystem may not be resident on the hypervisor (dom0) so 'dmsetup suspend' is probably more apropos. How well that propagates upward to the unwary client VM remains to be seen. But if one were running a NFS server using thin+xfs/ext4 then the 'fsfreeze' makes sense.
