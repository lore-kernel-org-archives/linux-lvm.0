Message-ID: <000701c40daf$ef7f9410$0400a8c0@vector>
From: "Perplexer" <perplexer@thz.net>
References: <20040319105619.GA8676@redhat.com>
Subject: Re: [linux-lvm] *** Hint: Metadata Backups ***
Date: Fri, 19 Mar 2004 13:44:34 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Should that be backupped regulaly (as in every week or so) or only after
actual changes to VGs/LVs (added/removed VG, added/removed PV,
added/removed or extended LV, ...) ?

---------
Perplexer

----- Original Message ----- 
From: "Heinz Mauelshagen" <mauelshagen@redhat.com>
To: <linux-lvm@redhat.com>
Cc: <hjm@redhat.com>
Sent: Friday, March 19, 2004 11:56 AM
Subject: [linux-lvm] *** Hint: Metadata Backups ***


> 
> Please remember to include the LVM Metadata
> 
> o /etc/lvmconf/ for LVM1
> o /etc/lvm/     for LVM2
> 
> in your regular backups.
> 
> Those are necessary in case metadata on your PVs gets accidentially
> overwritten (e.g., some diligent installer) in order to recover
> with vgcfgrestore(8).
> 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Red Hat GmbH
> Consulting Development Engineer                   Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@RedHat.com                            +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
