From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [Bug#189650: lvcreate segfaults (possibly after renames)]
Message-ID: <20030422101703.C30960@sistina.com>
References: <20030419093127.GA1217@tykepenguin.com>
Mime-Version: 1.0
In-Reply-To: <20030419093127.GA1217@tykepenguin.com>; from caulfield@sistina.com on Sat, Apr 19, 2003 at 10:31:27AM +0100
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
Date: Tue Apr 22 03:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Looks like the kernel doesn't have recent patches and that the
devfs entry isn't updated properly on lvrename.
Marcelo has those patches and they hopefully show up in 2.4.21 so that there's
no need to patch the kernel any longer.

Make sure that the kernel gets patched following README/INSTALL instructions
contained in the 1.0.7 source tarball.

Regards,
Heinz    -- The LVM Guy --

On Sat, Apr 19, 2003 at 10:31:27AM +0100, Patrick Caulfield wrote:
> 
> -- 
> 
> patrick
> 

> X-Mail-Format-Warning: Bad RFC2822 header formatting in >From patrick  Sat Apr 19 09:51:19 2003
> Return-path: <debbugs@master.debian.org>
> Envelope-to: patrick@localhost
> Delivery-date: Sat, 19 Apr 2003 09:51:19 +0100
> Received: from localhost.pjc.net ([127.0.0.1] helo=localhost)
> 	by arthur.pjc.net with esmtp (Exim 3.36 #1 (Debian))
> 	id 196o47-0000ff-00
> 	for <patrick@localhost>; Sat, 19 Apr 2003 09:51:19 +0100
> Received: from mail.cix.co.uk
> 	by localhost with POP3 (fetchmail-5.9.11)
> 	for patrick@localhost (single-drop); Sat, 19 Apr 2003 09:51:19 +0100 (BST)
> Received: from master.debian.org (master.debian.org [65.125.64.135])
> 	by sulphur.cix.co.uk (8.11.3/CIX/8.11.3) with ESMTP id h3J8jpM26061
> 	for <patrick@tykepenguin.cix.co.uk>; Sat, 19 Apr 2003 09:45:51 +0100 (BST)
> X-Envelope-From: debbugs@master.debian.org
> Received: from debbugs by master.debian.org with local (Exim 3.12 1 (Debian))
> 	id 196nXv-00067Z-00; Sat, 19 Apr 2003 03:18:03 -0500
> X-Loop: owner@bugs.debian.org
> Subject: Bug#189650: lvcreate segfaults (possibly after renames)
> Reply-To: Alan Chandler <alan@chandlerfamily.org.uk>, 189650@bugs.debian.org
> Resent-From: Alan Chandler <alan@chandlerfamily.org.uk>
> Resent-To: debian-bugs-dist@lists.debian.org
> Resent-CC: Patrick Caulfield <patrick@debian.org>,
>    lvm10@packages.qa.debian.org
> Resent-Date: Sat, 19 Apr 2003 08:18:01 GMT
> Resent-Message-ID: <handler.189650.B.105073973922472@bugs.debian.org>
> X-Debian-PR-Message: report 189650
> X-Debian-PR-Package: lvm10
> X-Debian-PR-Keywords: 
> Received: via spool by submit@bugs.debian.org id=B.105073973922472
>           (code B ref -1); Sat, 19 Apr 2003 08:18:01 GMT
> Received: (at submit) by bugs.debian.org; 19 Apr 2003 08:08:59 +0000
> Received: from pcow053o.blueyonder.co.uk (blueyonder.co.uk) [195.188.53.96] 
> 	by master.debian.org with esmtp (Exim 3.12 1 (Debian))
> 	id 196nP9-0005qA-00; Sat, 19 Apr 2003 03:08:59 -0500
> Received: from home.chandlerfamily.org.uk ([82.43.75.142]) by blueyonder.co.uk  with Microsoft SMTPSVC(5.5.1877.757.75);
> 	 Sat, 19 Apr 2003 09:11:30 +0100
> Received: from kanger.home ([10.0.10.1] ident=alan)
> 	by home.chandlerfamily.org.uk with esmtp (Exim 3.36 #1 (Debian))
> 	id 196nP6-0000iz-00
> 	for <submit@bugs.debian.org>; Sat, 19 Apr 2003 09:08:56 +0100
> From: Alan Chandler <alan@chandlerfamily.org.uk>
> To: submit@bugs.debian.org
> Date: Sat, 19 Apr 2003 09:08:52 +0100
> User-Agent: KMail/1.5.1
> MIME-Version: 1.0
> Content-Type: Text/Plain;
>   charset="us-ascii"
> Content-Transfer-Encoding: quoted-printable
> Content-Description: clearsigned data
> Content-Disposition: inline
> Message-Id: <200304190908.56366.alan@chandlerfamily.org.uk>
> Delivered-To: submit@bugs.debian.org
> Resent-Sender: Debian BTS <debbugs@master.debian.org>
> X-Envelope-To: patrick@tykepenguin.cix.co.uk
> X-Spam-Status: No, hits=-18.7 required=5.0
> 	tests=DEBIAN_BTS_BUG,PGP_SIGNATURE,RESENT_TO,USER_AGENT_KMAIL,
> 	      X_LOOP
> 	autolearn=ham version=2.53
> X-Spam-Level: 
> X-Spam-Checker-Version: SpamAssassin 2.53 (1.174.2.15-2003-03-30-exp)
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Package: lvm10
> Version: 1:1.0.7-3
> 
> I have been methodically going through my system converting each filesystem to 
> reiserfs.  This entails the following sort of sequence for /dev/vg/foo
> 
> lvcreate -L <size> -n newfoo vg
> mkreiserfs /dev/vg/newfoo
> mount /dev/vg/newfoo /mnt
> rsync -aHxq /where foo mounted/ /mnt
> umount /mnt
> umount /where foo mounted
> edit fstab to change filesystem type to reiserfs
> lvremove /dev/vg/roo
> lvrename vg newroo roo
> mount /where foo mounted
> 
> After a while (varies, but could be when I start to reuse the PEs? ) the 
> initial lvcreate seems to get to a stage where it segfaults repeatedly until 
> I deactivate and reactivate the vg (vgchange -a n vg ; vgchange -a y vg).
> 
> I have done this on my (only) two systems at home (each with two vg and 
> between 2 and 5 lv on each vg).  One is running sid, the other sarge.
> - -- 
> Alan Chandler
> alan@chandlerfamily.org.uk
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
> 
> iD8DBQE+oQQYuFHxcV2FFoIRAv/cAJ9AMwENJGSSewVbfyr9XvVkHRtsrwCfbLmM
> jLMyGxR7uWB1mJP+Mo4IpO0=
> =cU9e
> -----END PGP SIGNATURE-----
> 
> 

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
