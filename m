Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2JDnBJR022693
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 09:49:11 -0400
Received: from mail125.messagelabs.com (mail125.messagelabs.com
	[85.158.136.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2JDmaow027406
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 09:48:37 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Characters allowed for vg name
Date: Wed, 19 Mar 2008 13:47:57 -0000
Message-ID: <A78DB34D00374344A0AB65B6523C05DC02CDCF80@marsden.win.datacash.com>
In-Reply-To: <20080319133847.GF12007@agk.fab.redhat.com>
References: <A78DB34D00374344A0AB65B6523C05DC02CDCF5D@marsden.win.datacash.com>
	<20080319133847.GF12007@agk.fab.redhat.com>
From: "Gerrard Geldenhuis" <Gerrard.Geldenhuis@datacash.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks,
I did report it as a bug via Redhat support. I have ended up pasting the
mailinglist response in the support ticket after a week of no positive
response.

Would you aggree that a short note about allowable names should be added
to man lvm? If yes, then I don't mind creating a patch.

Regards

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alasdair G Kergon
> Sent: 19 March 2008 13:39
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Characters allowed for vg name
> 
> On Wed, Mar 19, 2008 at 01:19:19PM -0000, Gerrard Geldenhuis wrote:
> > I have a kickstart file which fails if I use an - character in the
> > vgname. Using a _ works fine.
> 
> Report a bug?
> 
> Hyphens are permitted *inside* VG and LV names, but not as the first
> character.  There are also some reserved names you cannot use
> because of existing /dev entries.  (E.g. a VG name of 'null' would
clash
> with '/dev/null' and '.' and '..' are also banned of course).
> 
> > Does anybody know what the allowable characters are for vg, pv and
lv
> > names?
> 
> VG/LV:
>   a-zA-Z0-9+_.-
> 
> (PV names are simply filenames)
> 
> Alasdair
> --
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
