Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Fri, 19 Jan 2001 12:42:10 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] lvmtab and lvmtab.d   disappeared.
Message-ID: <20010119124210.J11381@srv.sistina.com>
References: <3A51DCD10039F1D2@mail.tiscalinet.it>
Mime-Version: 1.0
In-Reply-To: <3A51DCD10039F1D2@mail.tiscalinet.it>; from doganello@tiscalinet.it on Thu, Jan 18, 2001 at 04:18:49PM +0100
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

Hi Doganello,

the error code 328 returned by vg_check_consistency() shows that you might
have more PVs in your system which claim to belong to volume group "vg1"
than there should be.

Please check with pvscan and report again.

Thanks,
Heinz

On Thu, Jan 18, 2001 at 04:18:49PM +0100, doganello wrote:
> Hi there.
> I use a Suse 6.4 (kernel 2.2.14-SUSE) with LVM since six months, with much pleasure.
> I have only a Volume group, with 5 logical volumes.
> Yesterday I decided to delete a logical volume and create a new one.
> I went in single-user mode, made a  lvdelete,  then made a new logical volume with lvcreate, and create a new Reiser file system on it. After that, I came back in mode 3 and continuie to work. Everything war working fine.
> Afer a normal shutdown, this morning my box couldn't access to the VG.
> I Watched in the /etc directory, and there were no lvmtab and lvmtab.d
> 
> I run a vgscan -v, and I got these messages (this i s a summary):
> 
> ERROR - 132 volume group "vg1" is inconsistent
> ERROR - unable to do a backup of volume group "vg1"
> "etc/lvmtab" and "etc/lvmtab.d" were succesfully created.
> But this was not true, there weren't any lvmtab in /etc.
> 
> I watched at your mailing list, to search for answers, but I find nothing .
> 
> Do you think is's possible to recover my VG and my partitions? 
> 
> I'm sending a "vgscan -d" log.
> 
> Saluti
> 
> Anchise.
> 
> 
> 
> --
> TiscaliNet, libero accesso ad Internet.
> http://www.tiscalinet.it



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
