Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1K6Ssi04862
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 01:28:54 -0500
MIME-Version: 1.0
Message-Id: <E1AtfOX-0007TZ-00@jade.ima.umn.edu>
From: Kumsup Lee <klee@ima.umn.edu>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Kernel Patch for LVm-1.0.8
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
Date: Mon Feb 23 08:41:21 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hi There,

  I used to have kernel 2.8.18 with LVM-1.0.4 on my machine.  After I
upgraded kernel to 2.4.22 because of security problem, I couldn't 
make any snapshot.  So, I tried to use LVM-1.0.8 on kernel 2.4.22.  Then 
it complains about inconsistency.  Is there any LVM patch for 2.4.22+ ?

sys:/# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "mailspool"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "mailspool" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

sys:/#

Thanks,

-- 

=============================================================================
 Kumsup Lee (�̱ݼ�) 				 System/Network Manager 
 Institute for Mathematics and its Applications, University of Minnesota 
 400 Lind Hall,   207 Church Street S.E.,   Minneapolis, MN 55455   USA
 Tel : 612-624-4353	FAX : 612-626-7370	PAGE : 952-608-0112
 klee@ima.umn.edu	www.ima.umn.edu/~klee
