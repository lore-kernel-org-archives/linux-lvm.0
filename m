Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NKNHj05591
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 15:23:17 -0500
Received: from hoemail2.firewall.lucent.com (hoemail2.lucent.com
	[192.11.226.163])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NKNGWA002269
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 15:23:16 -0500
Received: from alpo.inse.lucent.com (h152-148-10-6.lucent.com [152.148.10.6])
	by hoemail2.firewall.lucent.com (Switch-2.2.8/Switch-2.2.8) with
	ESMTP id i2NKN7c19171
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 14:23:08 -0600 (CST)
Received: from sekrit.inse.lucent.com (sekrit.inse.lucent.com [152.148.90.85])
	by alpo.inse.lucent.com (8.9.1a/8.9.1) with ESMTP id PAA22417
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 15:20:35 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16480.39954.171211.309361@gargle.gargle.HOWL>
Date: Tue, 23 Mar 2004 15:20:34 -0500
From: "John Stoffel" <stoffel@lucent.com>
Subject: Re: [linux-lvm] root on lvm
In-Reply-To: <1079729272.2126.12.camel@pascal>
References: <1079478024.2432.9.camel@rich>
	<1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
	<1079729272.2126.12.camel@pascal>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

CCCCContent-Length: 2035
Received: from ma8117exch002u.wins.lucent.com [152.148.8.136]
	by localhost with IMAP (fetchmail-6.2.0)
	for stoffel@localhost (single-drop); Fri, 19 Mar 2004 15:49:24 -0500 (EST)
Received: from horh1.emsr.lucent.com ([135.17.1.40]) by nj7460exch002h.wins.lucent.com with SMTP (Microsoft Exchange Internet Mail Service Version 5.5.2657.72)
	id 15S1BF21; Fri, 19 Mar 2004 15:48:07 -0500
Received: from hoemail1.firewall.lucent.com (hoemail1.firewall.lucent.com [192.11.226.161]) by horh1.emsr.lucent.com (8.11.7+Sun/EMS-1.5 Solaris/emsr)
	id i2JKm7J02568 for ; Fri, 19 Mar 2004 14:48:07 -0600 (CST)
Received: from hormel.redhat.com (hormel.redhat.com [209.132.177.30])
	by hoemail1.firewall.lucent.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id i2JKlw219595
	for <stoffel@lucent.com>; Fri, 19 Mar 2004 14:47:59 -0600 (CST)
Received: from listman.util.phx.redhat.com (listman.util.phx.redhat.com [10.8.4.110])
	by hormel.redhat.com (Postfix) with ESMTP
	id B069E72F0C; Fri, 19 Mar 2004 15:47:55 -0500 (EST)
Received: from int-mx1.corp.redhat.com (int-mx1.corp.redhat.com
	[172.16.52.254])
	by listman.util.phx.redhat.com (8.12.10/8.12.10) with ESMTP id
	i2JKlrRV031002 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2004 15:47:53 -0500
Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2JKlrj26151
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 15:47:53 -0500
Received: from mwinf0801.wanadoo.fr (smtp8.wanadoo.fr [193.252.22.23])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2JKlpWA009561
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 15:47:52 -0500
Received: from [192.168.0.34] (AVelizy-117-1-11-104.w81-251.abo.wanadoo.fr
	[81.251.9.104]) by mwinf0801.wanadoo.fr (SMTP Server) with ESMTP
	id EB23218000A2; Fri, 19 Mar 2004 21:47:45 +0100 (CET)
In-Reply-To: <1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
References: <1079478024.2432.9.camel@rich>
	<1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
Content-Type: text/plain; charset=ISO-8859-15
Message-Id: <1079729272.2126.12.camel@pascal>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.5 
X-RedHat-Spam-Score: 0 
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.4
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Errors-To: linux-lvm-bounces@redhat.com
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by horh1.emsr.lucent.com id i2JKm7J02568
X-Spam-Status: No, hits=-8.9 required=5.0
	tests=BAYES_01,IN_REP_TO,QUOTED_EMAIL_TEXT,REFERENCES,
	      REPLY_WITH_QUOTES,USER_AGENT_XIMIAN
	autolearn=ham version=2.55
X-Spam-Level: 
X-Spam-Checker-Version: SpamAssassin 2.55 (1.174.2.19-2003-05-19-exp)
From: Garcia Pascal <dld.pascal.garcia@wanadoo.fr>
Sender: linux-lvm-bounces@redhat.com
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] root on lvm
Date: Fri, 19 Mar 2004 21:47:52 +0100

Hello,
I experienced also difficulties with / and lvm2.
configuration:=20
   MANDRAKE 10.0,=20
   kernel 2.6.3,=20
   lilo 22.5.8,=20
   reiserfs 3.6.11 ?
   lvm 2.00.08
=20
The message I have got is something like lilo does not handle device
type 0x1f00=20

Can not ensure that it is the exact message and type.

I understood that the version of lilo I use can not handle lvm2 and
reiserfs partition for / during boot ! And especially can not get boot
image in /boot.

Shame :(

regards

Pascal Garcia

Le ven 19/03/2004 =E0 15:19, Jeffrey Layton a =E9crit :
> On Tue, 2004-03-16 at 18:00, Rich Turner wrote:
> > i am trying to mount / on a logical volume with reiserfs. my initrd
> > appears to be loading all of the appropriate modules (lvm-mod, =
dm-mod,
> > reiserfs) but i get the following error when the initrd exits and =
tries
> > to mount /.
> >=20
> > device-mapper: unknown block ioctl 0x5310
> > sh-2021: reiserfs_read_super: can not find reiserfs on device =
mapper
> > (254,1)
> >=20
> > is this related to reiserfs or lvm? or my initrd?
> > using:
> > lvm-2.00.07
> > reiserfs-3.6.9-37
> > suse-9.0
> > kernel-2.4.21-144-athlon
> >=20
>=20
> You likely are hitting a problem with the device numbering for DM
> devices. The kernel dynamically allocates major and minor numbers for
> the DM, so booting to a different kernel can renumber your DM =
devices.
> Have a look at the lvm2create_initrd script that's been posted on =
this
> list several times to see how I (and others) have handled this
> situation. It's also available here:
>=20
> http://poochiereds.net/svn/lvm2create_initrd
>=20
> -- Jeff
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
