Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB78soV13404
	for <linux-lvm@redhat.com>; Wed, 7 Dec 2005 03:54:50 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB78seQd014073
	for <linux-lvm@redhat.com>; Wed, 7 Dec 2005 03:54:40 -0500
Received: by zproxy.gmail.com with SMTP id n1so304458nzf
	for <linux-lvm@redhat.com>; Wed, 07 Dec 2005 00:54:40 -0800 (PST)
Message-ID: <40b3fe60512070054p728e5930vee5a55bdaac2922e@mail.gmail.com>
Date: Wed, 7 Dec 2005 14:24:39 +0530
From: neelima dahiya <neelima.dahiya@gmail.com>
In-Reply-To: <20051207080708.8B79573A80@hormel.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_24566_8061488.1133945679499"
References: <20051207080708.8B79573A80@hormel.redhat.com>
Subject: [linux-lvm] Re: linux-lvm Digest, Vol 22, Issue 5
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
To: linux-lvm@redhat.com

------=_Part_24566_8061488.1133945679499
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

hi

i am totally new to the field of system programming...........
i wanna know about the device mapper  per se ...........

can anyone guide me how to approach the task...........

pls reply
Neelima


On 12/7/05, linux-lvm-request@redhat.com <linux-lvm-request@redhat.com>
wrote:
>
> Send linux-lvm mailing list submissions to
>        linux-lvm@redhat.com
>
> To subscribe or unsubscribe via the World Wide Web, visit
>        https://www.redhat.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
>        linux-lvm-request@redhat.com
>
> You can reach the person managing the list at
>        linux-lvm-owner@redhat.com
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
>
>
> Today's Topics:
>
>   1. Re: Which size for snapshot volume for a *safe* backup?
>      (Alasdair G Kergon)
>   2. Re: Which size for snapshot volume for a *safe* backup?
>      (Alasdair G Kergon)
>   3. Re: Dumb LVM question (Heinz Mauelshagen)
>   4. Re: Which size for snapshot volume for a *safe* backup?
>      (Marc-Jano Knopp)
>   5. invalid lv in extent map (Greg Freemyer)
>   6. LVM problems (Kelly Harding)
>   7. Re: invalid lv in extent map (Greg Freemyer)
>   8. Re: LVM problems (Kelly Harding)
>   9. Re: LVM problems (Anil Kumar Sharma)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 6 Dec 2005 01:03:58 +0000
> From: Alasdair G Kergon <agk@redhat.com>
> Subject: Re: [linux-lvm] Which size for snapshot volume for a *safe*
>        backup?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <20051206010357.GF3647@agk.surrey.redhat.com>
> Content-Type: text/plain; charset=3Dus-ascii
>
> On Mon, Dec 05, 2005 at 11:39:11PM +0100, Marc-Jano Knopp wrote:
> >   But for files smaller than that (like 512 bytes), it erronously
> >   prints:
> >
> >     Device /dev/loop/0 not found
>
> Maybe should be changed to:
> Device /dev/loop/0 not found (or ignored by filters).
>
> Tiny devices are filtered out at a low level in the code as
> it is never valid for lvm2 to scan them to see if they
> are PVs.
>
> This was added for devices with extended partitions.
> # blockdev --getsize /dev/hda4
> 2
>
> Alasdair
> --
> agk@redhat.com
>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 6 Dec 2005 01:10:17 +0000
> From: Alasdair G Kergon <agk@redhat.com>
> Subject: Re: [linux-lvm] Which size for snapshot volume for a *safe*
>        backup?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <20051206011017.GG3647@agk.surrey.redhat.com>
> Content-Type: text/plain; charset=3Dus-ascii
>
> On Mon, Dec 05, 2005 at 11:39:11PM +0100, Marc-Jano Knopp wrote:
> > So, obviously,
> >   snapshot volume size =3D original volume size
> > is not sufficient to hold a complete change of the original volume.
>
> Correct - there's a little bit of metadata required too to
> map each piece of data back into the right location.
>
> > Btw.: There's a bug in "lvscan", it still displayed the snapshot
> > as being "ACTIVE", while in fact (at least that's what I concluded),
> > it was "INACTIVE" due to the lack of space, as shown using "lvdisplay".
>
> The 'lvs' attributes should be accurate (and lvdisplay too I think).
> lvscan doesn't check properly and needs fixing, thanks.
>
> Alasdair
> --
> agk@redhat.com
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 6 Dec 2005 11:56:00 +0100
> From: Heinz Mauelshagen <mauelshagen@redhat.com>
> Subject: Re: [linux-lvm] Dumb LVM question
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Cc: hjm@redhat.com
> Message-ID: <20051206105600.GB2778@redhat.com>
> Content-Type: text/plain; charset=3Dus-ascii
>
> On Mon, Dec 05, 2005 at 01:29:23PM -0500, Greg Freemyer wrote:
> > All,
> >
> > With LVM 2, how do I kill any and all snapshots.
> >
> > With LVM 1 it was "vgscan -r".
> >
> > I need to be able to do this with a script, so I'm hoping lvm 2 has a
> > way to kill all snapshots without knowing their names, etc.  If not, I
> > guess I can script up something to do the job.
>
> Yes, you could use something like:
>
> <quick_hacking_mode>
> lvs|perl -ne '@a =3D split /\s+/,$_;if ($a[3] =3D~ /^s/) {print
> "/dev/$a[2]/$a[1]\n";}'|xargs lvremove -f
> </quick_hacking_mode>
>
>
> >
> > Greg
> > --
> > Greg Freemyer
> > The Norcross Group
> > Forensics for the 21st Century
> >
> >
> > --
> > Greg Freemyer
> > The Norcross Group
> > Forensics for the 21st Century
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> --
>
> Regards,
> Heinz    -- The LVM Guy --
>
> *** Software bugs are stupid.
>    Nevertheless it needs not so stupid people to solve them ***
>
>
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>
> Heinz Mauelshagen                                 Red Hat GmbH
> Consulting Development Engineer                   Am Sonnenhang 11
> Cluster and Storage Development                   56242 Marienrachdorf
>                                                  Germany
> Mauelshagen@RedHat.com                            +49 2626 141200
>                                                       FAX 924446
>
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 6 Dec 2005 12:36:29 +0100
> From: Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>
> Subject: Re: [linux-lvm] Which size for snapshot volume for a *safe*
>        backup?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <20051206113629.GB2867@mjk.myfqdn.de>
> Content-Type: text/plain; charset=3Dus-ascii
>
> On Tue, 06 Dec 2005 at 01:10 (+0000), Alasdair G Kergon wrote:
> > On Mon, Dec 05, 2005 at 11:39:11PM +0100, Marc-Jano Knopp wrote:
> > > So, obviously,
> > >   snapshot volume size =3D original volume size
> > > is not sufficient to hold a complete change of the original volume.
> >
> > Correct - there's a little bit of metadata required too to
> > map each piece of data back into the right location.
>
> Thought so, just wasn't sure if it gets stored inside the volume or in
> an extra file or device.
>
>
> I have noticed that lvdisplay <snapshot volume> prints:
>
> Allocated to snapshot:   5.00%
>
> But as I don't know the inner workings of LVM, I preferred not to take
> this value for all variants of logical volumes for granted, but instead
> ask here in this list for exact numbers.
>
>
> [lvscan displays inactive snapshot volume as active]
>
> > The 'lvs' attributes should be accurate (and lvdisplay too I think).
> > lvscan doesn't check properly and needs fixing, thanks.
>
> http://www.gotfuturama.com/Multimedia/EpisodeSounds/2ACV14/10.mp3
>
> :-)
>
>
> Best regards
>
> Marc-Jano
>
>
>
> ------------------------------
>
> Message: 5
> Date: Tue, 6 Dec 2005 17:40:36 -0500
> From: Greg Freemyer <greg.freemyer@gmail.com>
> Subject: [linux-lvm] invalid lv in extent map
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID:
>        <87f94c370512061440s6b1b7ca0rffad7f53503309e4@mail.gmail.com>
> Content-Type: text/plain; charset=3DISO-8859-1
>
> I have recently upgraded a test server from 2.4.x with LVM 1 to 2.6.13
> with LVM 2.
>
> I can mount my 3 LVs, but when I try to do basic lvm commands I get
> "invalid lv in extent map".
>
> # pvscan
> invalid lv in extent map
> Couldn't fill logical volume maps.
> invalid lv in extent map
> Couldn't fill logical volume maps.
> No matching physical volumes found
>
> # pvscan --version
> LVM version:     2.01.14 (2005-08-04)
> Library version: 1.01.04 (2005-08-02)
> Driver version:  4.4.0
>
> I did not run vgconvert manually, so I assume I still have LVM1 metadata.
>
> This is a test server, so none of the data in the LVs is important,
> but I hope to be upgrading my live file server soon, so I would like
> to figure out how to not lose any data.
>
> Thanks
> Greg
> --
> Greg Freemyer
> The Norcross Group
> Forensics for the 21st Century
>
>
>
> ------------------------------
>
> Message: 6
> Date: Wed, 07 Dec 2005 01:47:49 +0000
> From: Kelly Harding <kelly.harding@ntlworld.com>
> Subject: [linux-lvm] LVM problems
> To: linux-lvm@redhat.com
> Message-ID: <43963F45.5060104@ntlworld.com>
> Content-Type: text/plain; charset=3D"iso-8859-1"
>
> Hi,
>
> I've just brought my Debian Linux box back up after a power failure and
> now my LVM set up seems to be non-functional.
>
> I'm not very clued up on LVM tbh, but it has worked so far fine for ages.
>
> I get the following error if I try  to run 'vgchange -a y 3diskvolume:
>
> device-mapper ioctl cmd 11 failed: Invalid argument
>   _deps: task run failed for (254:0)
>   Failed to add device (254:0) to dtree
>   1 logical volume(s) in volume group "3diskvolume" now active
>
> It obviously won't mount after that as mount tells me it can't find the
> superblock etc.
>
> any ideas? is one of the discs dead?
>
> Thanks,
>
> Kelly
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: kelly.harding.vcf
> Type: text/x-vcard
> Size: 149 bytes
> Desc: not available
> Url :
> https://www.redhat.com/archives/linux-lvm/attachments/20051207/5b45c848/k=
elly.harding.vcf
>
> ------------------------------
>
> Message: 7
> Date: Tue, 6 Dec 2005 20:52:21 -0500
> From: Greg Freemyer <greg.freemyer@gmail.com>
> Subject: [linux-lvm] Re: invalid lv in extent map
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID:
>        <87f94c370512061752g3d948e01t15b17902a130da63@mail.gmail.com>
> Content-Type: text/plain; charset=3DISO-8859-1
>
> Not sure how I caused the below, but after a reboot I was unable to
> use my VG at all.
>
> I wiped it out and rebuilt it.  Hopefully it does not happen again.
>
> Greg
>
> On 12/6/05, Greg Freemyer <greg.freemyer@gmail.com> wrote:
> > I have recently upgraded a test server from 2.4.x with LVM 1 to 2.6.13
> > with LVM 2.
> >
> > I can mount my 3 LVs, but when I try to do basic lvm commands I get
> > "invalid lv in extent map".
> >
> > # pvscan
> >   invalid lv in extent map
> >   Couldn't fill logical volume maps.
> >   invalid lv in extent map
> >   Couldn't fill logical volume maps.
> >   No matching physical volumes found
> >
> > # pvscan --version
> >   LVM version:     2.01.14 (2005-08-04)
> >   Library version: 1.01.04 (2005-08-02)
> >   Driver version:  4.4.0
> >
> > I did not run vgconvert manually, so I assume I still have LVM1
> metadata.
> >
> > This is a test server, so none of the data in the LVs is important,
> > but I hope to be upgrading my live file server soon, so I would like
> > to figure out how to not lose any data.
> >
> > Thanks
> > Greg
> > --
> > Greg Freemyer
> > The Norcross Group
> > Forensics for the 21st Century
> >
>
>
> --
> Greg Freemyer
> The Norcross Group
> Forensics for the 21st Century
>
>
>
> ------------------------------
>
> Message: 8
> Date: Wed, 07 Dec 2005 02:06:18 +0000
> From: Kelly Harding <kelly.harding@ntlworld.com>
> Subject: Re: [linux-lvm] LVM problems
> To: kelly.harding@ntlworld.com, LVM general discussion and development
>        <linux-lvm@redhat.com>
> Message-ID: <4396439A.7080500@ntlworld.com>
> Content-Type: text/plain; charset=3D"iso-8859-1"
>
> Hi again,
>
> Forgot to add details:
>
> PC: dual PII/350mhz (p/pro overdrive), 512mb ram, SCSI LVD 80mb/s.
>
> The VG is across 3 36gb scsi drives attached to an adaptect 2940U2W card.
>
> I'm running kernel version 2.4.27 (2.6 doesn't seem to like this system).
>
> I noticed from the dmesg output the following:
>
> device-mapper: one of name or uuid must be supplied, cmd(11)
>
> This appears when the previously mentioned command is run.
>
> I've no idea what this means or if it isa case of a re-install of the
> base system might fix this? maybe something with the
> base system has gone a bit fubar?
>
> any help or advice on this would be greatly appreciated.
>
> If it comes ot it that I lose the data and have to format and star the
> LVM VG over again it won't be ideal but it won't
> be losing anything vital either (just video files, etc).
>
> Kelly
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: kelly.harding.vcf
> Type: text/x-vcard
> Size: 149 bytes
> Desc: not available
> Url :
> https://www.redhat.com/archives/linux-lvm/attachments/20051207/dfe376a0/k=
elly.harding.vcf
>
> ------------------------------
>
> Message: 9
> Date: Wed, 7 Dec 2005 13:36:57 +0530
> From: Anil Kumar Sharma <xplusaks@gmail.com>
> Subject: Re: [linux-lvm] LVM problems
> To: kelly.harding@ntlworld.com, LVM general discussion and development
>        <linux-lvm@redhat.com>
> Message-ID:
>        <52fe6b680512070006i7578827av304946cd51d37313@mail.gmail.com>
> Content-Type: text/plain; charset=3D"iso-8859-1"
>
> Recently I also suffered problems with LVM(2)
>
> These are very basic things I presume U might have already done but just
> in
> case if not ...
>
> imho pl boot with rescue disk (or mode)
> As a precaution select read-only mount of file system
> if required chroot to /mnt/sysimage
> # mount  ! look for lvm things specifically a word - mapper
> # pvdisplay
> # vgdisplay
> # lvdisplay
> # pvscan
> # vgscan
> # lvscan
>
> thiese will tell status of lvm things
> Then check /etc/fstab (carefully)
>
> U may then "very very carefully" use e2fsck or fsck [{("after dismounting
> the volumes")}] as you may you deem fit.
> "very very carefully"  means, as a minimum, first read both manpages, try
> these commands in read-only mode + do not modify anything + verbose.
>
> ### use vgck with caution and also checkout /etc/lvm/lvm.conf
>
> U may try in init 1 mode also but more caution requested.
>
> good luck & Pl post if U get it right this way or anyway.
>
> --
> Anil Kumar Shrama
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL:
> https://www.redhat.com/archives/linux-lvm/attachments/20051207/ca4d210f/a=
ttachment.html
>
> ------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> End of linux-lvm Digest, Vol 22, Issue 5
> ****************************************
>

------=_Part_24566_8061488.1133945679499
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>hi </div>
<div>&nbsp;</div>
<div>i am totally new to the field of system programming...........</div>
<div>i wanna know about the device mapper&nbsp; per se ...........</div>
<div>&nbsp;</div>
<div>can anyone guide me how to approach the task...........</div>
<div>&nbsp;</div>
<div>pls reply</div>
<div>Neelima<br><br>&nbsp;</div>
<div><span class=3D"gmail_quote">On 12/7/05, <b class=3D"gmail_sendername">=
<a href=3D"mailto:linux-lvm-request@redhat.com">linux-lvm-request@redhat.co=
m</a></b> &lt;<a href=3D"mailto:linux-lvm-request@redhat.com">linux-lvm-req=
uest@redhat.com
</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Send linux-lvm mailing list subm=
issions to<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:linux-=
lvm@redhat.com">linux-lvm@redhat.com
</a><br><br>To subscribe or unsubscribe via the World Wide Web, visit<br>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://www.redhat.com/mailma=
n/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>=
<br>or, via email, send a message with subject or body 'help' to
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:linux-lvm-reques=
t@redhat.com">linux-lvm-request@redhat.com</a><br><br>You can reach the per=
son managing the list at<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D=
"mailto:linux-lvm-owner@redhat.com">linux-lvm-owner@redhat.com
</a><br><br>When replying, please edit your Subject line so it is more spec=
ific<br>than &quot;Re: Contents of linux-lvm digest...&quot;<br><br><br>Tod=
ay's Topics:<br><br>&nbsp;&nbsp;1. Re: Which size for snapshot volume for a=
 *safe* backup?
<br>&nbsp;&nbsp;&nbsp;&nbsp; (Alasdair G Kergon)<br>&nbsp;&nbsp;2. Re: Whic=
h size for snapshot volume for a *safe* backup?<br>&nbsp;&nbsp;&nbsp;&nbsp;=
 (Alasdair G Kergon)<br>&nbsp;&nbsp;3. Re: Dumb LVM question (Heinz Mauelsh=
agen)<br>&nbsp;&nbsp;4. Re: Which size for snapshot volume for a *safe* bac=
kup?
<br>&nbsp;&nbsp;&nbsp;&nbsp; (Marc-Jano Knopp)<br>&nbsp;&nbsp;5. invalid lv=
 in extent map (Greg Freemyer)<br>&nbsp;&nbsp;6. LVM problems (Kelly Hardin=
g)<br>&nbsp;&nbsp;7. Re: invalid lv in extent map (Greg Freemyer)<br>&nbsp;=
&nbsp;8. Re: LVM problems (Kelly Harding)<br>&nbsp;&nbsp;9. Re: LVM problem=
s (Anil Kumar Sharma)
<br><br><br>---------------------------------------------------------------=
-------<br><br>Message: 1<br>Date: Tue, 6 Dec 2005 01:03:58 +0000<br>From: =
Alasdair G Kergon &lt;<a href=3D"mailto:agk@redhat.com">agk@redhat.com</a>
&gt;<br>Subject: Re: [linux-lvm] Which size for snapshot volume for a *safe=
*<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backup?<br>To: LVM general discus=
sion and development &lt;<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@=
redhat.com</a>&gt;<br>Message-ID: &lt;
<a href=3D"mailto:20051206010357.GF3647@agk.surrey.redhat.com">200512060103=
57.GF3647@agk.surrey.redhat.com</a>&gt;<br>Content-Type: text/plain; charse=
t=3Dus-ascii<br><br>On Mon, Dec 05, 2005 at 11:39:11PM +0100, Marc-Jano Kno=
pp wrote:
<br>&gt;&nbsp;&nbsp; But for files smaller than that (like 512 bytes), it e=
rronously<br>&gt;&nbsp;&nbsp; prints:<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbs=
p; Device /dev/loop/0 not found<br><br>Maybe should be changed to:<br>Devic=
e /dev/loop/0 not found (or ignored by filters).
<br><br>Tiny devices are filtered out at a low level in the code as<br>it i=
s never valid for lvm2 to scan them to see if they<br>are PVs.<br><br>This =
was added for devices with extended partitions.<br># blockdev --getsize /de=
v/hda4
<br>2<br><br>Alasdair<br>--<br><a href=3D"mailto:agk@redhat.com">agk@redhat=
.com</a><br><br><br><br>------------------------------<br><br>Message: 2<br=
>Date: Tue, 6 Dec 2005 01:10:17 +0000<br>From: Alasdair G Kergon &lt;<a hre=
f=3D"mailto:agk@redhat.com">
agk@redhat.com</a>&gt;<br>Subject: Re: [linux-lvm] Which size for snapshot =
volume for a *safe*<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backup?<br>To: =
LVM general discussion and development &lt;<a href=3D"mailto:linux-lvm@redh=
at.com">linux-lvm@redhat.com
</a>&gt;<br>Message-ID: &lt;<a href=3D"mailto:20051206011017.GG3647@agk.sur=
rey.redhat.com">20051206011017.GG3647@agk.surrey.redhat.com</a>&gt;<br>Cont=
ent-Type: text/plain; charset=3Dus-ascii<br><br>On Mon, Dec 05, 2005 at 11:=
39:11PM +0100, Marc-Jano Knopp wrote:
<br>&gt; So, obviously,<br>&gt;&nbsp;&nbsp; snapshot volume size =3D origin=
al volume size<br>&gt; is not sufficient to hold a complete change of the o=
riginal volume.<br><br>Correct - there's a little bit of metadata required =
too to<br>
map each piece of data back into the right location.<br><br>&gt; Btw.: Ther=
e's a bug in &quot;lvscan&quot;, it still displayed the snapshot<br>&gt; as=
 being &quot;ACTIVE&quot;, while in fact (at least that's what I concluded)=
,
<br>&gt; it was &quot;INACTIVE&quot; due to the lack of space, as shown usi=
ng &quot;lvdisplay&quot;.<br><br>The 'lvs' attributes should be accurate (a=
nd lvdisplay too I think).<br>lvscan doesn't check properly and needs fixin=
g, thanks.
<br><br>Alasdair<br>--<br><a href=3D"mailto:agk@redhat.com">agk@redhat.com<=
/a><br><br><br><br>------------------------------<br><br>Message: 3<br>Date=
: Tue, 6 Dec 2005 11:56:00 +0100<br>From: Heinz Mauelshagen &lt;<a href=3D"=
mailto:mauelshagen@redhat.com">
mauelshagen@redhat.com</a>&gt;<br>Subject: Re: [linux-lvm] Dumb LVM questio=
n<br>To: LVM general discussion and development &lt;<a href=3D"mailto:linux=
-lvm@redhat.com">linux-lvm@redhat.com</a>&gt;<br>Cc: <a href=3D"mailto:hjm@=
redhat.com">
hjm@redhat.com</a><br>Message-ID: &lt;<a href=3D"mailto:20051206105600.GB27=
78@redhat.com">20051206105600.GB2778@redhat.com</a>&gt;<br>Content-Type: te=
xt/plain; charset=3Dus-ascii<br><br>On Mon, Dec 05, 2005 at 01:29:23PM -050=
0, Greg Freemyer wrote:
<br>&gt; All,<br>&gt;<br>&gt; With LVM 2, how do I kill any and all snapsho=
ts.<br>&gt;<br>&gt; With LVM 1 it was &quot;vgscan -r&quot;.<br>&gt;<br>&gt=
; I need to be able to do this with a script, so I'm hoping lvm 2 has a
<br>&gt; way to kill all snapshots without knowing their names, etc.&nbsp;&=
nbsp;If not, I<br>&gt; guess I can script up something to do the job.<br><b=
r>Yes, you could use something like:<br><br>&lt;quick_hacking_mode&gt;<br>l=
vs|perl -ne '@a =3D split /\s+/,$_;if ($a[3] =3D~ /^s/) {print &quot;/dev/$=
a[2]/$a[1]\n&quot;;}'|xargs lvremove -f
<br>&lt;/quick_hacking_mode&gt;<br><br><br>&gt;<br>&gt; Greg<br>&gt; --<br>=
&gt; Greg Freemyer<br>&gt; The Norcross Group<br>&gt; Forensics for the 21s=
t Century<br>&gt;<br>&gt;<br>&gt; --<br>&gt; Greg Freemyer<br>&gt; The Norc=
ross Group
<br>&gt; Forensics for the 21st Century<br>&gt;<br>&gt; ___________________=
____________________________<br>&gt; linux-lvm mailing list<br>&gt; <a href=
=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>&gt; <a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>&gt; read the LVM =
HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWT=
O/LVM-HOWTO/</a><br><br>--<br><br>Regards,<br>Heinz&nbsp;&nbsp;&nbsp;&nbsp;=
-- The LVM Guy --<br>
<br>*** Software bugs are stupid.<br>&nbsp;&nbsp; Nevertheless it needs not=
 so stupid people to solve them ***<br><br>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br><br>Heinz Mauelshagen&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Red Hat GmbH
<br>Consulting Development Engineer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Am Son=
nenhang 11<br>Cluster and Storage Development&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 56242 Marienrachdorf<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; Germany<br><a href=3D"mailto:Mauelshagen@RedHat.com">
Mauelshagen@RedHat.com</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+49 2626 141200<br>&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;FAX 924446<br>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br><br><br>------------------------------<br><br>Message: 4<br>Date: Tue, =
6 Dec 2005 12:36:29 +0100<br>From: Marc-Jano Knopp &lt;<a href=3D"mailto:pu=
b_ml_lvm@marc-jano.de">pub_ml_lvm@marc-jano.de</a>&gt;<br>Subject: Re: [lin=
ux-lvm] Which size for snapshot volume for a *safe*
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; backup?<br>To: LVM general discuss=
ion and development &lt;<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@r=
edhat.com</a>&gt;<br>Message-ID: &lt;<a href=3D"mailto:20051206113629.GB286=
7@mjk.myfqdn.de">20051206113629.GB2867@mjk.myfqdn.de
</a>&gt;<br>Content-Type: text/plain; charset=3Dus-ascii<br><br>On Tue, 06 =
Dec 2005 at 01:10 (+0000), Alasdair G Kergon wrote:<br>&gt; On Mon, Dec 05,=
 2005 at 11:39:11PM +0100, Marc-Jano Knopp wrote:<br>&gt; &gt; So, obviousl=
y,
<br>&gt; &gt;&nbsp;&nbsp; snapshot volume size =3D original volume size<br>=
&gt; &gt; is not sufficient to hold a complete change of the original volum=
e.<br>&gt;<br>&gt; Correct - there's a little bit of metadata required too =
to<br>&gt; map each piece of data back into the right location.
<br><br>Thought so, just wasn't sure if it gets stored inside the volume or=
 in<br>an extra file or device.<br><br><br>I have noticed that lvdisplay &l=
t;snapshot volume&gt; prints:<br><br>Allocated to snapshot:&nbsp;&nbsp; 5.0=
0%<br>
<br>But as I don't know the inner workings of LVM, I preferred not to take<=
br>this value for all variants of logical volumes for granted, but instead<=
br>ask here in this list for exact numbers.<br><br><br>[lvscan displays ina=
ctive snapshot volume as active]
<br><br>&gt; The 'lvs' attributes should be accurate (and lvdisplay too I t=
hink).<br>&gt; lvscan doesn't check properly and needs fixing, thanks.<br><=
br><a href=3D"http://www.gotfuturama.com/Multimedia/EpisodeSounds/2ACV14/10=
.mp3">
http://www.gotfuturama.com/Multimedia/EpisodeSounds/2ACV14/10.mp3</a><br><b=
r>:-)<br><br><br>Best regards<br><br>Marc-Jano<br><br><br><br>-------------=
-----------------<br><br>Message: 5<br>Date: Tue, 6 Dec 2005 17:40:36 -0500
<br>From: Greg Freemyer &lt;<a href=3D"mailto:greg.freemyer@gmail.com">greg=
.freemyer@gmail.com</a>&gt;<br>Subject: [linux-lvm] invalid lv in extent ma=
p<br>To: LVM general discussion and development &lt;<a href=3D"mailto:linux=
-lvm@redhat.com">
linux-lvm@redhat.com</a>&gt;<br>Message-ID:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &lt;<a href=3D"mailto:87f94c370512061440s6b1b7ca0rffad7f53503309e4=
@mail.gmail.com">87f94c370512061440s6b1b7ca0rffad7f53503309e4@mail.gmail.co=
m</a>&gt;<br>Content-Type: text/plain; charset=3DISO-8859-1
<br><br>I have recently upgraded a test server from 2.4.x with LVM 1 to 2.6=
.13<br>with LVM 2.<br><br>I can mount my 3 LVs, but when I try to do basic =
lvm commands I get<br>&quot;invalid lv in extent map&quot;.<br><br># pvscan
<br>invalid lv in extent map<br>Couldn't fill logical volume maps.<br>inval=
id lv in extent map<br>Couldn't fill logical volume maps.<br>No matching ph=
ysical volumes found<br><br># pvscan --version<br>LVM version:&nbsp;&nbsp;&=
nbsp;&nbsp; 2.01.14
 (2005-08-04)<br>Library version: 1.01.04 (2005-08-02)<br>Driver version:&n=
bsp;&nbsp;4.4.0<br><br>I did not run vgconvert manually, so I assume I stil=
l have LVM1 metadata.<br><br>This is a test server, so none of the data in =
the LVs is important,
<br>but I hope to be upgrading my live file server soon, so I would like<br=
>to figure out how to not lose any data.<br><br>Thanks<br>Greg<br>--<br>Gre=
g Freemyer<br>The Norcross Group<br>Forensics for the 21st Century<br><br>
<br><br>------------------------------<br><br>Message: 6<br>Date: Wed, 07 D=
ec 2005 01:47:49 +0000<br>From: Kelly Harding &lt;<a href=3D"mailto:kelly.h=
arding@ntlworld.com">kelly.harding@ntlworld.com</a>&gt;<br>Subject: [linux-=
lvm] LVM problems
<br>To: <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br=
>Message-ID: &lt;<a href=3D"mailto:43963F45.5060104@ntlworld.com">43963F45.=
5060104@ntlworld.com</a>&gt;<br>Content-Type: text/plain; charset=3D&quot;i=
so-8859-1&quot;
<br><br>Hi,<br><br>I've just brought my Debian Linux box back up after a po=
wer failure and<br>now my LVM set up seems to be non-functional.<br><br>I'm=
 not very clued up on LVM tbh, but it has worked so far fine for ages.<br>
<br>I get the following error if I try&nbsp;&nbsp;to run 'vgchange -a y 3di=
skvolume:<br><br>device-mapper ioctl cmd 11 failed: Invalid argument<br>&nb=
sp;&nbsp;_deps: task run failed for (254:0)<br>&nbsp;&nbsp;Failed to add de=
vice (254:0) to dtree<br>&nbsp;&nbsp;1 logical volume(s) in volume group &q=
uot;3diskvolume&quot; now active
<br><br>It obviously won't mount after that as mount tells me it can't find=
 the<br>superblock etc.<br><br>any ideas? is one of the discs dead?<br><br>=
Thanks,<br><br>Kelly<br>-------------- next part --------------<br>A non-te=
xt attachment was scrubbed...
<br>Name: kelly.harding.vcf<br>Type: text/x-vcard<br>Size: 149 bytes<br>Des=
c: not available<br>Url : <a href=3D"https://www.redhat.com/archives/linux-=
lvm/attachments/20051207/5b45c848/kelly.harding.vcf">https://www.redhat.com=
/archives/linux-lvm/attachments/20051207/5b45c848/kelly.harding.vcf
</a><br><br>------------------------------<br><br>Message: 7<br>Date: Tue, =
6 Dec 2005 20:52:21 -0500<br>From: Greg Freemyer &lt;<a href=3D"mailto:greg=
.freemyer@gmail.com">greg.freemyer@gmail.com</a>&gt;<br>Subject: [linux-lvm=
] Re: invalid lv in extent map
<br>To: LVM general discussion and development &lt;<a href=3D"mailto:linux-=
lvm@redhat.com">linux-lvm@redhat.com</a>&gt;<br>Message-ID:<br>&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:87f94c370512061752g3d948e01t=
15b17902a130da63@mail.gmail.com">
87f94c370512061752g3d948e01t15b17902a130da63@mail.gmail.com</a>&gt;<br>Cont=
ent-Type: text/plain; charset=3DISO-8859-1<br><br>Not sure how I caused the=
 below, but after a reboot I was unable to<br>use my VG at all.<br><br>I wi=
ped it out and rebuilt it.&nbsp;&nbsp;Hopefully it does not happen again.
<br><br>Greg<br><br>On 12/6/05, Greg Freemyer &lt;<a href=3D"mailto:greg.fr=
eemyer@gmail.com">greg.freemyer@gmail.com</a>&gt; wrote:<br>&gt; I have rec=
ently upgraded a test server from 2.4.x with LVM 1 to 2.6.13<br>&gt; with L=
VM 2.
<br>&gt;<br>&gt; I can mount my 3 LVs, but when I try to do basic lvm comma=
nds I get<br>&gt; &quot;invalid lv in extent map&quot;.<br>&gt;<br>&gt; # p=
vscan<br>&gt;&nbsp;&nbsp; invalid lv in extent map<br>&gt;&nbsp;&nbsp; Coul=
dn't fill logical volume maps.
<br>&gt;&nbsp;&nbsp; invalid lv in extent map<br>&gt;&nbsp;&nbsp; Couldn't =
fill logical volume maps.<br>&gt;&nbsp;&nbsp; No matching physical volumes =
found<br>&gt;<br>&gt; # pvscan --version<br>&gt;&nbsp;&nbsp; LVM version:&n=
bsp;&nbsp;&nbsp;&nbsp; 2.01.14 (2005-08-04)<br>&gt;&nbsp;&nbsp; Library ver=
sion:=20
1.01.04 (2005-08-02)<br>&gt;&nbsp;&nbsp; Driver version:&nbsp;&nbsp;4.4.0<b=
r>&gt;<br>&gt; I did not run vgconvert manually, so I assume I still have L=
VM1 metadata.<br>&gt;<br>&gt; This is a test server, so none of the data in=
 the LVs is important,
<br>&gt; but I hope to be upgrading my live file server soon, so I would li=
ke<br>&gt; to figure out how to not lose any data.<br>&gt;<br>&gt; Thanks<b=
r>&gt; Greg<br>&gt; --<br>&gt; Greg Freemyer<br>&gt; The Norcross Group
<br>&gt; Forensics for the 21st Century<br>&gt;<br><br><br>--<br>Greg Freem=
yer<br>The Norcross Group<br>Forensics for the 21st Century<br><br><br><br>=
------------------------------<br><br>Message: 8<br>Date: Wed, 07 Dec 2005 =
02:06:18 +0000
<br>From: Kelly Harding &lt;<a href=3D"mailto:kelly.harding@ntlworld.com">k=
elly.harding@ntlworld.com</a>&gt;<br>Subject: Re: [linux-lvm] LVM problems<=
br>To: <a href=3D"mailto:kelly.harding@ntlworld.com">kelly.harding@ntlworld=
.com
</a>, LVM general discussion and development<br>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &lt;<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com<=
/a>&gt;<br>Message-ID: &lt;<a href=3D"mailto:4396439A.7080500@ntlworld.com"=
>4396439A.7080500@ntlworld.com
</a>&gt;<br>Content-Type: text/plain; charset=3D&quot;iso-8859-1&quot;<br><=
br>Hi again,<br><br>Forgot to add details:<br><br>PC: dual PII/350mhz (p/pr=
o overdrive), 512mb ram, SCSI LVD 80mb/s.<br><br>The VG is across 3 36gb sc=
si drives attached to an adaptect 2940U2W card.
<br><br>I'm running kernel version 2.4.27 (2.6 doesn't seem to like this sy=
stem).<br><br>I noticed from the dmesg output the following:<br><br>device-=
mapper: one of name or uuid must be supplied, cmd(11)<br><br>This appears w=
hen the previously mentioned command is run.
<br><br>I've no idea what this means or if it isa case of a re-install of t=
he<br>base system might fix this? maybe something with the<br>base system h=
as gone a bit fubar?<br><br>any help or advice on this would be greatly app=
reciated.
<br><br>If it comes ot it that I lose the data and have to format and star =
the<br>LVM VG over again it won't be ideal but it won't<br>be losing anythi=
ng vital either (just video files, etc).<br><br>Kelly<br>-------------- nex=
t part --------------
<br>A non-text attachment was scrubbed...<br>Name: kelly.harding.vcf<br>Typ=
e: text/x-vcard<br>Size: 149 bytes<br>Desc: not available<br>Url : <a href=
=3D"https://www.redhat.com/archives/linux-lvm/attachments/20051207/dfe376a0=
/kelly.harding.vcf">
https://www.redhat.com/archives/linux-lvm/attachments/20051207/dfe376a0/kel=
ly.harding.vcf</a><br><br>------------------------------<br><br>Message: 9<=
br>Date: Wed, 7 Dec 2005 13:36:57 +0530<br>From: Anil Kumar Sharma &lt;
<a href=3D"mailto:xplusaks@gmail.com">xplusaks@gmail.com</a>&gt;<br>Subject=
: Re: [linux-lvm] LVM problems<br>To: <a href=3D"mailto:kelly.harding@ntlwo=
rld.com">kelly.harding@ntlworld.com</a>, LVM general discussion and develop=
ment
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:linux-lvm@re=
dhat.com">linux-lvm@redhat.com</a>&gt;<br>Message-ID:<br>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:52fe6b680512070006i7578827av304946=
cd51d37313@mail.gmail.com">52fe6b680512070006i7578827av304946cd51d37313@mai=
l.gmail.com
</a>&gt;<br>Content-Type: text/plain; charset=3D&quot;iso-8859-1&quot;<br><=
br>Recently I also suffered problems with LVM(2)<br><br>These are very basi=
c things I presume U might have already done but just in<br>case if not ...
<br><br>imho pl boot with rescue disk (or mode)<br>As a precaution select r=
ead-only mount of file system<br>if required chroot to /mnt/sysimage<br># m=
ount&nbsp;&nbsp;! look for lvm things specifically a word - mapper<br># pvd=
isplay
<br># vgdisplay<br># lvdisplay<br># pvscan<br># vgscan<br># lvscan<br><br>t=
hiese will tell status of lvm things<br>Then check /etc/fstab (carefully)<b=
r><br>U may then &quot;very very carefully&quot; use e2fsck or fsck [{(&quo=
t;after dismounting
<br>the volumes&quot;)}] as you may you deem fit.<br>&quot;very very carefu=
lly&quot;&nbsp;&nbsp;means, as a minimum, first read both manpages, try<br>=
these commands in read-only mode + do not modify anything + verbose.<br><br=
>### use vgck with caution and also checkout /etc/lvm/lvm.conf
<br><br>U may try in init 1 mode also but more caution requested.<br><br>go=
od luck &amp; Pl post if U get it right this way or anyway.<br><br>--<br>An=
il Kumar Shrama<br>-------------- next part --------------<br>An HTML attac=
hment was scrubbed...
<br>URL: <a href=3D"https://www.redhat.com/archives/linux-lvm/attachments/2=
0051207/ca4d210f/attachment.html">https://www.redhat.com/archives/linux-lvm=
/attachments/20051207/ca4d210f/attachment.html</a><br><br>-----------------=
-------------
<br><br>_______________________________________________<br>linux-lvm mailin=
g list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><=
br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://ww=
w.redhat.com/mailman/listinfo/linux-lvm
</a><br><br>End of linux-lvm Digest, Vol 22, Issue 5<br>*******************=
*********************<br></blockquote></div><br>

------=_Part_24566_8061488.1133945679499--
