Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F2B152EA
	for <linux-lvm@redhat.com>; Wed, 21 Aug 2019 07:58:42 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DD9785546
	for <linux-lvm@redhat.com>; Wed, 21 Aug 2019 07:58:40 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	x7L7wbNB007009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 21 Aug 2019 09:58:37 +0200 (MEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Aug 2019 09:58:37 +0200
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
Message-ID: <5c0bded03fb05d7320afa10e025b4061@cs.uni-dortmund.de>
Subject: [linux-lvm] Programming interface
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

Hello,

Some time ago, we wrote an application that uses the lvm2app interface 
to manage volume groups and logical volumes. Of course, the application 
does not work anymore, now that lvm2app has been skipped. So, is there 
anywhere something like a guide how to rewrite code that used the 
lvm2app interface?

Regards
   Christoph
