Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i25Nxu830366
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 18:59:56 -0500
Received: from magic.alttech.com ([64.140.60.35])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i25Nxtb24674
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 18:59:55 -0500
Received: from dogberry.ossmann.com (magic.alttech.com [64.140.60.35])
	by magic.alttech.com (Postfix) with ESMTP id C01E22FEA2
	for <linux-lvm@redhat.com>; Fri,  5 Mar 2004 16:59:49 -0700 (MST)
From: Michael Ossmann <mike@ossmann.com>
Message-ID: <20040305235958.GG8500@ossmann.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm2 vgchange -a n problem
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Mar  5 18:58:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm using lvm2 with linux 2.6.4-rc1.  When I try to
deactivate lvm with 'vgchange -a n' it always tells me:

  LV vgfoo/lvbar in use: not removing

even when the lv is not mounted at all.  So I try to
'lvchange -a n' the lv, but it tells me the same thing.

My workaround is to do 'dmsetup remove vgfoo-lvbar' for each
lv prior to deactivation.  Then 'vgchange -a n' and
'lvchange -a n' work.  My shutdown script includes:

  for lv in $(lvs --noheadings | awk '{print $2 "-" $1}'); do
    dmsetup remove $lv
  done 
  /sbin/vgchange -a n

Is this how I'm supposed to do this?  Am I missing
something?

Thanks,

mossmann
