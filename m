Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0SK1W4G031607
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 15:01:32 -0500
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0SK1KEJ007039
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 15:01:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 8B7CC86F2A
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 21:01:19 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id smqYBSQWAPoV for <linux-lvm@redhat.com>;
	Thu, 28 Jan 2010 21:01:19 +0100 (CET)
Date: Thu, 28 Jan 2010 21:01:19 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100128200119.GA15513@maude.comedia.it>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] loading of dm-mod by libdevmapper
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Is there any particular reason why libdevmapper does not load dm-mod as
needed, like lvm does for dm targets?

Would a patch in this sense be accepted?

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
