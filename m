From: "B. Dobalina" <bdobalina@hotmail.com>
Subject: Re: [linux-lvm] pvmove problem
Mime-Version: 1.0
Message-ID: <F119Oc0Ne0PaLI9mK6P0000568f@hotmail.com>
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
Date: Fri Feb  7 11:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Its linux 2.4.19 (with the sgi xfs patch) and lvm 1.0.6. I have two volumes, 
the other volume (vol1) is unaffected. All lvm operations seem to be working 
on vol1. For vol2 (the one that I executed a pvmove on), I cannot get lvm to 
recognize it so I cannot perform any lvm operations.

-skip




Which LVM and Linux  version is this ?
Does everything else irt LVM with the exception of pvmove ru fine
(i.e. creating/removing LVs etc.) ?

Regards,
Heinz    -- The LVM Guy --


On Thu, Feb 06, 2003 at 11:26:44PM +0000, B. Dobalina wrote:
>I am trying to remove an old harddrive from one of my volumes using:
>   pvmove -v /dev/hdh3
>It was chugging along just find until about half way through when it froze. 
>Linux was not "frozen", but I do not think it would allow any io to the 
>block devices (logins, ls's, etc would stall). I waited about an hour, at 
>which point it was still stuck on the same extent, and had no other option 
>but to hard reboot. When the system was booted, the volume to which hdh3 
>belonged, would no longer mount:
>
>$ vgscan
>vgscan -- reading all physical volumes (this may take a while...)
>vgscan -- found active volume group "vol1"
>vgscan -- only found 2523 of 768 LEs for LV /dev/vol2/software (1)
>vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get 
>data of volume group "vol2" from physical volume(s)
>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>vgscan -- WARNING: This program does not do a VGDA backup of your volume 
>groups
>
>
>Looks like some lvm metadata has been corrupted. So I ran vgcfgrestore on 
>/dev/hdh3: same result. Then I ran it on all the PVs in vol2: same result. 
>Does anybody have a solution to get this volume mounted? There is a bunch 
>of data on vol2, but not all that much in /dev/hdh3, so a partial restore 
>would be ok.
>
>Thanks,
>Skip
>
>
>_________________________________________________________________
>Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
>http://join.msn.com/?page=features/junkmail
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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



_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail
