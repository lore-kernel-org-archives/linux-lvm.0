Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA2FlBr30113
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 10:47:11 -0500
Received: from nexredback-216-168-119-94.nexicom.net
	(nexredback-216-168-119-94.nexicom.net [216.168.119.94])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iA2Fl9E8019793
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 10:47:09 -0500
Message-ID: <4187ABF1.1070004@mikebabcock.ca>
Date: Tue, 02 Nov 2004 10:46:57 -0500
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Re: Software raid on top of lvm logical volume
References: <41801ADE.6030308@monjoin.net>	<20041028011738.GD13737@kluge.net>	<41808B37.40406@monjoin.net>	<20041028063530.GA13279@percy.comedia.it>	<n6t752-uf2.ln1@triangulo.it.uc3m.es>	<41865DE3.6040409@mikebabcock.ca>
	<44376.64.233.217.29.1099327893.squirrel@64.233.217.29>
In-Reply-To: <44376.64.233.217.29.1099327893.squirrel@64.233.217.29>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Erik@echohome.org, LVM general discussion and development <linux-lvm@redhat.com>

Erik Ohrnberger wrote:

>This solution would seem to be as the holy grail in that it would give you
>the best of all worlds: resizable RAID storage.  Or am I wrong about this
>assumption?
>  
>

I've been trying to figure out a reason why it wouldn't be doable for a 
few weeks now.

Currently, one can create RAID-0 like performance with LVM2 by 
specifying stripes for one's LVs.  Why not:

lvcreate -L 3GB --raid-level 5 --stripes 3 -n SafeData VG001 /dev/sda 
/dev/sdb /dev/sdc

PV section 1 on sda and sdb are data, section 1 on sdc is XOR data.  PV 
section 2 on sda and sdc are data, and XOR data on section 2 of sdb, and 
so on.

One of the major performance implications would be the larger block 
sizes being dealt with; many people seem to find smaller stripes better 
for performance in RAID-0/5 situations, and by default one would have 
4MB stripes.  With some effort, I'm sure this could be rectified as well.

Thoughts?  Or should I blog about it instead? ;-)

If I didn't have multiple out-of-town server and firewall installations 
this week, I'd code instead :-)
-- 
Michael T. Babcock
http://mikebabcock.ca
