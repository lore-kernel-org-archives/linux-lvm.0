From: "B. Dobalina" <bdobalina@hotmail.com>
Subject: Re: [linux-lvm] pvmove problem
Mime-Version: 1.0
Message-ID: <F182lo1GO59FCakbOBT0000645d@hotmail.com>
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
Date: Mon Feb 10 12:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Luckily I have some backups of all but one LV (which is just too big to 
backup) on vol2. But it would be nice to recover that volume.

As far as syslog messages, I did not see anything out of the ordinary before 
the pvmove. Now of course I get the error message produced by vgscan which I 
pasted in the first message.

Not quite sure what you mean about "using vol2's content". I cannot get LVM 
to recognize vol2, so of course it will not activate it. So I cannot mount 
any of the volumes in vol2.

It is only complaining about /dev/vol2/software volume. If there was someway 
I could delete this volume without having to have vol2 activated, that might 
solve the problem--unless other volumes' metadata is corrupted as well. I 
seem to remember reading about LVM2's ability to do a partial activation 
(missing 1 or more PVs from a VG). Would it be worthwhile to try and mount 
vol2 under LVM2 with hdh3 removed?

Thanks,
Skip


>From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
>Reply-To: linux-lvm@sistina.com
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] pvmove problem
>Date: Mon, 10 Feb 2003 14:53:49 +0100
>
>On Fri, Feb 07, 2003 at 05:50:21PM +0000, B. Dobalina wrote:
> > Its linux 2.4.19 (with the sgi xfs patch) and lvm 1.0.6. I have two 
>volumes,
> > the other volume (vol1) is unaffected. All lvm operations seem to be 
>working
> > on vol1. For vol2 (the one that I executed a pvmove on), I cannot get 
>lvm to
> > recognize it so I cannot perform any lvm operations.
>
>You've got the actual LVM software. Let's try to approach the problem
>a bit more...
>
>Have there been any syslog messages spotting some light on this ?
>Are you still able to use vol2's content ?
>
>Before changing anything, don't forget to keep recent backups!
>
>Regards,
>Heinz    -- The LVM Guy --
>
> >
> > -skip
> >
> >
> >
> >
> > Which LVM and Linux  version is this ?
> > Does everything else irt LVM with the exception of pvmove ru fine
> > (i.e. creating/removing LVs etc.) ?
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> >
> >
> > On Thu, Feb 06, 2003 at 11:26:44PM +0000, B. Dobalina wrote:
> > >I am trying to remove an old harddrive from one of my volumes using:
> > >   pvmove -v /dev/hdh3
> > >It was chugging along just find until about half way through when it 
>froze.
> > >Linux was not "frozen", but I do not think it would allow any io to the
> > >block devices (logins, ls's, etc would stall). I waited about an hour, 
>at
> > >which point it was still stuck on the same extent, and had no other 
>option
> > >but to hard reboot. When the system was booted, the volume to which 
>hdh3
> > >belonged, would no longer mount:
> > >
> > >$ vgscan
> > >vgscan -- reading all physical volumes (this may take a while...)
> > >vgscan -- found active volume group "vol1"
> > >vgscan -- only found 2523 of 768 LEs for LV /dev/vol2/software (1)
> > >vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't 
>get
> > >data of volume group "vol2" from physical volume(s)
> > >vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > >vgscan -- WARNING: This program does not do a VGDA backup of your 
>volume
> > >groups
> > >
> > >
> > >Looks like some lvm metadata has been corrupted. So I ran vgcfgrestore 
>on
> > >/dev/hdh3: same result. Then I ran it on all the PVs in vol2: same 
>result.
> > >Does anybody have a solution to get this volume mounted? There is a 
>bunch
> > >of data on vol2, but not all that much in /dev/hdh3, so a partial 
>restore
> > >would be ok.
> > >
> > >Thanks,
> > >Skip
> > >
> > >
> > >_________________________________________________________________
> > >Help STOP SPAM with the new MSN 8 and get 2 months FREE*
> > >http://join.msn.com/?page=features/junkmail
> > >
> > >
> > >_______________________________________________
> > >linux-lvm mailing list
> > >linux-lvm@sistina.com
> > >http://lists.sistina.com/mailman/listinfo/linux-lvm
> > >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>*** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>Heinz Mauelshagen                                 Sistina Software Inc.
>Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
>Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail
