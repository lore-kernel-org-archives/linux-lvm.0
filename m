From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] RAID & LVM
Message-ID: <20020626123739.D18125@sistina.com>
References: <2411209499ABD41180270090274DD8BC0337F1EA@zafnt2> <BDEMIPDEGABMNEFIHCPDAEFLDJAA.bill+f.9sfuw6uo@tao-group.com>
Mime-Version: 1.0
In-Reply-To: <BDEMIPDEGABMNEFIHCPDAEFLDJAA.bill+f.9sfuw6uo@tao-group.com>; from bill+f.9sfuw6uo@tao-group.com on Tue, Jun 25, 2002 at 05:19:41PM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jun 26 05:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 25, 2002 at 05:19:41PM +0100, William Blunn wrote:
> > I know it seems to be a very old question, but I can't find in 
> > the previous messages, the answer for that..
> > 
> > Is it possible to use RAID and LVM together? If positive, is 
> > there a HOW-TO telling something about it?
> 
> Yes it works well.
> 
> Use the standard RAID stuff to make a raid device, say /dev/md0, then create a PV (LVM Physical Volume) on that, then make a VG (LVM volume group) out of that PV, then create LVs (LVM Logical Volumes) in the VG.
> 
> Then (unless you have some other use for them), create filesystems in the LVs.
> 
> I use LVM over RAID1 on ATA disks using Ultra-ATA mode 4 (66 MB/s) or higher.
> 
> > LVM will support mirroring someday?

We've got a mirroring target already in device-mapper, which is the generic
volume mapping driver used by our LVM2 tools (please check it out
at www.sistina.com).
Final (L)GPLed release planned for July.

We will support mirroring directly further down the LVM2 road later this year.

> 
> Not AFAIK.
> 
> Bill
> -- 
> William H. Blunn - <bill+s.9sfuw6uo@tao-group.com> - Developer Support
> Tao
> 62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
> Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
> 
> The contents of this e-mail and any attachments are confidential and may
> be legally privileged. If you have received this e-mail and you are not
> a named addressee, please inform us as soon as possible on
> +44 118 901 2999 and then delete the e-mail from your system. If you are
> not a named addressee you must not copy, use, disclose, distribute,
> print or rely on this e-mail. Any views expressed in this e-mail or any
> attachments may not necessarily reflect those of Tao's management.
> Although we routinely screen for viruses, addressees should scan this
> e-mail and any attachments for viruses. Tao makes no representation or
> warranty as to the absence of viruses in this e-mail or any attachments.
> Please note that for the protection of our business, we may monitor and
> read e-mails sent to and from our server(s).
> 
> Visit our website at http://tao-group.com/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
