Received: from o.ww.redhat.com (vpn-4-5.str.redhat.com [10.32.4.5])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25BrOex018765
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 06:53:24 -0500
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.8/8.13.8) with ESMTP id l25BrNho007834
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 12:53:23 +0100
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.8/8.13.8/Submit) id l25BrNEi007833
	for linux-lvm@redhat.com; Mon, 5 Mar 2007 12:53:23 +0100
Date: Mon, 5 Mar 2007 12:53:23 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Questions
Message-ID: <20070305115323.GA7635@redhat.com>
References: <Pine.LNX.4.44.0703032051050.6632-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0703032051050.6632-100000@bmsred.bmsi.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Mar 03, 2007 at 08:59:38PM -0500, Stuart D. Gathman wrote:
> Which display commands display on-disk metadata, which display 
> lvmtab/lvmtab.d, and which display kernel data structures?  I'd like to 
> know if the metadata is trashed on my original two PVs, or just on
> the new one I tried to add.

Because you're refering to LVM1, you see kernel metadata unless you
provide the -D option to the *display commands.

> 
> Given my situation described previously (where vgextend/me screwed up and 
> kernel data is fine, VG is active, but disk metadata seems to be toast),
> should I run vgcfgrestore on the live VG in the hope that things might 
> boot?  I have Centos-3  /etc/lvmconf backups of metadata (I think) for
> prior to the attempt to vgextend.

Make sure that your /etc/lvmconf backup is alright for your case
by running "vgcfgrestore -ll -f ...".
If so, vgcfgrestore it after initializing the PVs with pvcreate -f.

> 
> What is the equivalent of pvremove (which is what I needed) in LVM1?
> I tried using pvcreate "I'm really really sure", but that seems to have
> screwed up.  If VG metadata is stored at the beginning of a PV, then
> I guess dd might be the answer.

There's no pveremove in LVM1, so dd of 512 bytes of zeroes will do.

> 
> Does the last /etc/lvmconf entry respresent the result of the last 
> command?

/etc/lvmconf contains a backup history including the actual
VG configuration.

> Or is it a backup of things just before the last autobackup
> command?
> 
> 
> -- 
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
> 
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
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
