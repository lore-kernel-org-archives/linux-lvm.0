From: Andreas Dilger <adilger@turbolabs.com>
Date: Tue, 9 Oct 2001 21:58:45 -0600
Subject: Re: [linux-lvm] kernel reports vg twice
Message-ID: <20011009215845.L6348@turbolinux.com>
References: <20011008160013.A26865@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011008160013.A26865@cistron.nl>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 08, 2001  16:00 +0200, Wichert Akkerman wrote:
> LVM still does not work for me on one of my machines work:
> 
> cloud:/dev/discs/disc1# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "vg_user"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> cloud:/dev/discs/disc1# vgchange -a y
> vgchange -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan
> 
> I did a bit of looking around and it seems the confusement is in the
> kernel: when lvm_check_kernel_lvmtab_consistency() compares the kernel
> and the lvmtab entries the list from the kernel mentions the vg_user
> volume group twice, while the lvmtab only mentions it once. This
> results in an immediate abort and as a result I can't do anything
> with the LVM tools.

I take it that this is after a reboot?

Does "vgscan -d -v" process vg_user twice, or does "vgchange -a y -v -d"
send vg_user to the kernel twice?  Don't know what else to say.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
