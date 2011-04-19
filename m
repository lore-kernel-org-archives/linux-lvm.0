Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3JMaoup025654
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2011 18:36:50 -0400
Received: from q7.q7.com (q7.q7.com [69.168.48.248])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3JMak7R020811
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2011 18:36:47 -0400
Received: from charon.spiretech.com (charon.spiretech.com [69.168.63.193])
	(authenticated bits=0)
	by q7.q7.com (8.13.8/8.13.8) with ESMTP id p3JMagGF023920
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2011 15:36:45 -0700
Message-ID: <4DAE0E79.3090503@q7.com>
Date: Tue, 19 Apr 2011 15:36:41 -0700
From: Joe Pruett <joey@q7.com>
MIME-Version: 1.0
References: <4DAE0B5E.4090503@stanford.edu>
In-Reply-To: <4DAE0B5E.4090503@stanford.edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Naming Convention
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
To: LVM general discussion and development <linux-lvm@redhat.com>

i have started putting the hostname in my vg names as well, mainly so
that if i have to move the drives to another system for upgrades,
crashes, etc, i don't get collisions between the local vg and the one
i'm hooking up temporarily.

On 04/19/2011 03:23 PM, Mike Seda wrote:
> Hi All,
> Recently, I came across the new LVM naming convention in RHEL 6. This
> convention places the output of "hostname -s" in the VG name. This
> doesn't really fit into the way I've previously setup VGs, which was
> to create a new VG for each type of disk attached to the system, e.g.
> RAID 1 SAS 10K (local), RAID 6 SATA 7.2K (SAN).
>
> I guess I could modify the naming convention slightly as shown below:
> - /dev/vg_`hostname -s`_[0-9][0-9]/lv_{foo|bar}
>
> Another thought I had was that maybe I don't need a separate VG for
> each type of disk since the lvcreate/lvextend commands seem to be able
> to create/grow an LV by PV. My understanding is that this would allow
> you to skip the step of growing the VG by the PV, right?
>
> Essentially, I'm just wondering what other folks in my situation are
> doing for LVM naming.
>
> Thanks In Advance,
> Mike
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
