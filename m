Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3K6n0Pf006201
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2011 02:49:00 -0400
Received: from seldrel01.sonyericsson.com (seldrel01.sonyericsson.com
	[212.209.106.2])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3K6muBa019596
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2011 02:48:56 -0400
From: "Assarsson, Emil" <Emil.Assarsson@sonyericsson.com>
Date: Wed, 20 Apr 2011 08:48:54 +0200
Message-ID: <2BF070A7A2375D46BA1B6087F8D5DCB67D93C8349E@seldmbx01.corpusers.net>
References: <4DAE0B5E.4090503@stanford.edu> <4DAE0E79.3090503@q7.com>
In-Reply-To: <4DAE0E79.3090503@q7.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

We have also started to use hostnames in the VG names for the same reason. Starting with vg makes is easier to auto complete when using bash :-P. I don't see any reason why to use "lv" to the LV's but it doesn't hurt. I also try to use UUID's in the /etc/fstab as much as possible.

Best regards
Emil Assarsson


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
> Behalf Of Joe Pruett
> Sent: onsdag den 20 april 2011 00:37
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] LVM Naming Convention
> 
> i have started putting the hostname in my vg names as well, mainly so
> that if i have to move the drives to another system for upgrades,
> crashes, etc, i don't get collisions between the local vg and the one
> i'm hooking up temporarily.
> 
> On 04/19/2011 03:23 PM, Mike Seda wrote:
> > Hi All,
> > Recently, I came across the new LVM naming convention in RHEL 6. This
> > convention places the output of "hostname -s" in the VG name. This
> > doesn't really fit into the way I've previously setup VGs, which was
> > to create a new VG for each type of disk attached to the system, e.g.
> > RAID 1 SAS 10K (local), RAID 6 SATA 7.2K (SAN).
> >
> > I guess I could modify the naming convention slightly as shown below:
> > - /dev/vg_`hostname -s`_[0-9][0-9]/lv_{foo|bar}
> >
> > Another thought I had was that maybe I don't need a separate VG for
> > each type of disk since the lvcreate/lvextend commands seem to be able
> > to create/grow an LV by PV. My understanding is that this would allow
> > you to skip the step of growing the VG by the PV, right?
> >
> > Essentially, I'm just wondering what other folks in my situation are
> > doing for LVM naming.
> >
> > Thanks In Advance,
> > Mike
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
