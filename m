Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3JMNQpC017888
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2011 18:23:26 -0400
Received: from smtp.stanford.edu (smtp2.Stanford.EDU [171.67.219.82])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3JMNNwM000809
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2011 18:23:23 -0400
Received: from smtp.stanford.edu (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with SMTP id 7B0B18608
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2011 15:23:23 -0700 (PDT)
Received: from [171.65.32.152] (bmir-msob-x237-2.Stanford.EDU [171.65.32.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: maseda)
	by smtp.stanford.edu (Postfix) with ESMTPSA id 368AA81B7
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2011 15:23:23 -0700 (PDT)
Message-ID: <4DAE0B5E.4090503@stanford.edu>
Date: Tue, 19 Apr 2011 15:23:26 -0700
From: Mike Seda <maseda@stanford.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Naming Convention
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

Hi All,
Recently, I came across the new LVM naming convention in RHEL 6. This 
convention places the output of "hostname -s" in the VG name. This 
doesn't really fit into the way I've previously setup VGs, which was to 
create a new VG for each type of disk attached to the system, e.g. RAID 
1 SAS 10K (local), RAID 6 SATA 7.2K (SAN).

I guess I could modify the naming convention slightly as shown below:
- /dev/vg_`hostname -s`_[0-9][0-9]/lv_{foo|bar}

Another thought I had was that maybe I don't need a separate VG for each 
type of disk since the lvcreate/lvextend commands seem to be able to 
create/grow an LV by PV. My understanding is that this would allow you 
to skip the step of growing the VG by the PV, right?

Essentially, I'm just wondering what other folks in my situation are 
doing for LVM naming.

Thanks In Advance,
Mike
