Date: Fri, 01 Sep 2006 09:47:03 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] Cleaning up stale handles in /etc/mtab
Message-ID: <2149C51FF8A80730B2D442F1@d216-220-25-20.dynip.modwest.com>
In-Reply-To: <5F08B160555AC946B5AB743B85FF406D05ABF277@ex2k.bankofamerica.com>
References: <5F08B160555AC946B5AB743B85FF406D05ABF277@ex2k.bankofamerica.com >
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, redhat-sysadmin-list@redhat.com



--On September 1, 2006 11:13:41 AM -0400 "Brown, Rodrick R" 
<rodrick.r.brown@bofasecurities.com> wrote:

> Not sure what exactly happened on this server but it looks like the LUNS
> were pulled w/o removing the volumes correctly or something of that
> sort.

Looks like you managed to hit fs.filemax actually.  What is the output of 
"sysctl fs.file-max fs.file-nr"?

>
># df
> df: `/vob/gcib/its': Too many open files in system
> df: `/vob/lftech/artefacts': Too many open files in system
> df: `/vob/rmt/mktrisk_portal': Too many open files in system
> df: `/vob/gcib/gfx_fxpb_client_facing': Too many open files in system
> df: `/vob/gcib/gfx_fxpb_workflow': Too many open files in system
> df: `/vob/rmt/credittrend': Too many open files in system
> df: `/vob/adv/re_reporting': Too many open files in system
> df: `/vob/datamgmt/atlas_p2': Too many open files in system
> df: `/vob/gcib/gfx_rad': Too many open files in system
> ...
> ...
>
> Does anyone know of a method to fix this without rebooting the box
> thanks?
>
> Thanks.
>
> ---
> Rodrick R. Brown
> UNIX Platform Support (SME)
> Banc of America Securities LLC.
> Global Trading Infrastructure (GCIB)
> 100 West 33rd ST. 3rd Flr.
> New York, NY 10001
> Mail Code: NY1-509-03-18
> Office: 646 733 4473
> Cell: 646-261-5286
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
