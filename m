From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problem with vgscan
Message-ID: <20020522145005.G9107@sistina.com>
References: <scebab71.015@MS106BN>
Mime-Version: 1.0
In-Reply-To: <scebab71.015@MS106BN>; from dmitri.levitin@postbank.de on Wed, May 22, 2002 at 02:30:02PM +0200
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
Date: Wed May 22 07:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, this is an ancient LVM version:

 - what does pvscan say?

 - what does "vgscan -d" say?

Send both outputs plus the file "Dmitri.vgda" created with
"dd if=/dev/sdd1 bs=1k count=4k of=Dmitri.vgda" in a bziped tar archive to
me for further investigation (mge@sistina.com).

On Wed, May 22, 2002 at 02:30:02PM +0200, Dmitri Levitin wrote:
> Hi,
> 
> I have installed the LVM-0.9-1 on my Linux Suse7.0 Kernel 2.2.18 and I have marked /dev/sdd1 with Linux LVM label. When I run vgscan for the first time it tells the follows:
> 
> $ vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- found inactive volume group "data"
> vgscan -- reading data of volume group "data" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "data" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> 
> What's the problem? Could anybody help my?
> 
> Thanks a lot
> 
> Dmitri
> 
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
