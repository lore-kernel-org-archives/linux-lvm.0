Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i7NDgrRE003827
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2004 15:42:53 +0200
Date: Mon, 23 Aug 2004 15:42:53 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] vgscan vs vgcfgrestore
Message-ID: <20040823134253.GB9740@redhat.com>
References: <025001c484ce$95942560$5208580a@b034547>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <025001c484ce$95942560$5208580a@b034547>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Aug 17, 2004 at 10:53:48PM -0400, Rob Schwartz wrote:
> Hello Heinz,
> 
> Forgive me for writing in English.   As I come from the United States I am embarassingly uni-lingual.   I have been working with LVM for several months now and finally have had the opportunity to get into the guts of the lvm configuration.   I am preparing myself for the situation where my LVM environment gets corrupted in some manner.  Actually, last week I encountered a problem with LVM and was unable to quickly recover so I ended up simply rebuilding the LVM PV's, VG's and LV's and restoring data.  Fortunately, it was an easy restore.   I have been comparing the vgscan utility with vgcfgrestore.   In a test environment I have deleted the /etc/lvm* stuff and even deleted the /dev/lvm* stuff and successfully recovered the VG and LV by simply doing a vgscan.

Yes, vgscan's task is to discover any PVs, retrieve the LVM metadata, store
it in /etc/lvmtab* and created devnodes for access to the VGs/LVs.

>   Whew... nice... I understand vgcfgbackup and vgcfgrestore but am not sure when I would need to use the configuration backup.   The VGDA as I understand it is stored on the PV's.   If I have the PV's intact I therefore have the VGDA and hence am able to recover using vgscan.    When would I need to use vgcfgrestore?

You indirectly answered your onw question ;)

You need vgcfgrestor, when the metadata on the PVs is *not* intact (eg,
accidential overwrite or starnge crash). and vgscan fails to discover
your VG(s).

> I have found much information on LVM on the web but nothing that really pinpoints my question.  If there is something out there that I can refer to, please tell me.

Have you referenced the LVM-HOWTO yet (URL below) ?

> 
> Regards,
> Rob
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
