Date: Wed, 22 Aug 2001 08:57:23 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Ow.. not again (fwd)
Message-ID: <20010822085723.A7109@sistina.com>
References: <Pine.LNX.4.21.0108210646200.18607-100000@nutrot.ern-e.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0108210646200.18607-100000@nutrot.ern-e.org>; from elim@nutrot.ern-e.org on Tue, Aug 21, 2001 at 07:08:13AM -0400
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

On Tue, Aug 21, 2001 at 07:08:13AM -0400, elim wrote:
> 
> 
> Here's a follow-up to my previous msg to the list (below)
> 
> I've been able to mount my lv's by doing this:
> 
> creating /etc/lvmtab with "vg_name" as the content
> copying /etc/lvmconf/vg_name.conf to /etc/lvmtab.d/vg_name
> 
> then vgchange -ay
> 
> Credit goes to Ed Tomlinson for his msg here: 
> http://lists.sistina.com/pipermail/linux-lvm/2001-March/006518.html
> 
> However, doing a vgscan still barks errors.. and so does vgcfgbackup ;)
> 
> System would not boot into multiuser mode because the vg's would not come
> up on boot. I had to manually run the above commands then mount them. Then
> it was simply a matter of changing to multi-user runlevel.
> 
> Busily backing up data right now :)
> 
> When i restore.. I may not bother anymore with the lvm. I suppose you can
> bitch at me for not being current with versions. There is a reason -- 
> Never have I been so afeared of rebooting and messing with the lvm. In the
> last year or so that I've been using it this is the 2nd plain old reboot
> that has caused my vg's to lose their beans -- luckily I had a recent
> system backup and rebuilt from scratch (thank god for ADSM). This time my
> backups were stale so I was a bit more desperate to get these fs's
> back. Two other occasions where the current LVM at the time refused to
> work with the corresponding version of the user-tools -- causing great
> grief and much cursing.
> 
> 
> 
> 
>  ---------- Forwarded message ----------
> Date: Tue, 21 Aug 2001 05:53:48 -0400 (EDT)
> From: elim <elim@nutrot.ern-e.org>
> To: linux-lvm@sistina.com
> Subject: Ow.. not again
> 
> Hiya
> 
> After a lengthy period of uptime, my Linux box was rebooted today and this
> is what it spewed out on bootup:
> 
> vgscan -- found inactive volume group "vg01"
> vgscan -- reading data of volume group "vg01" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "vg01" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
> "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> 
> I tried the vgcfgrestore but then I ended up with "No volume groups
> found" error.

Did you vgcfgrestore to *all* PVs of the restored VG?
In case you have created the metadata backup you restored you probably
need to run uuid_fixer after the restore as well in order to vgscan your
VG fine.

> I then tried dd'ing the vg info onto the pv's as per a
> previous post which basically got me back to the "ERROR
> "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "vg01" from physical volume(s)" error. 
> 
> Basically Im going in circles. I even tried the uuid_fixer but it seems it
> does the same thing as the dd trick.
> 
> I've scoured the faq's and read one too many list messages... can somebody
> please help??? Having my fs's back would be really convenient right now :)
> 
> Kernel is 2.2.19aa1 and Iam using 0.9beta4 of lvm and the tools. The vg
> on disk was created pre 0.6.. i cant remember exactly.
> 
> Thanks.
> Ernie
> 
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
