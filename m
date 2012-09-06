Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q868mxVp025358
	for <linux-lvm@redhat.com>; Thu, 6 Sep 2012 04:48:59 -0400
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q868mw7m031389
	for <linux-lvm@redhat.com>; Thu, 6 Sep 2012 04:48:59 -0400
Received: by obbuo13 with SMTP id uo13so2312751obb.33
	for <linux-lvm@redhat.com>; Thu, 06 Sep 2012 01:48:58 -0700 (PDT)
MIME-Version: 1.0
From: deanraccoon <deanraccoon@gmail.com>
Date: Thu, 6 Sep 2012 16:48:37 +0800
Message-ID: <CAHz-cgENGWywiMqcooivu28tRM1TTzMAP-GKQit6ysH9HLOzbg@mail.gmail.com>
Subject: [linux-lvm] Dose upstream have any plan to support mirrored in
 --mirrorlog option in cluster?
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
To: linux-lvm@redhat.com

Dear  list,

Now, lvm supports 3 types of mirror-log :"core", "disk", "mirrored" in
local server. But cluster lvm only support
mirror-log: "core","disk".
Does upstream have any plan to support mirrored mirror-log in cluster?

-- 
dongmao
