Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25KugGk024271
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 15:56:43 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l25KudqK000359
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 15:56:40 -0500
Received: from pavian (pavian.at.ds9 [192.168.0.104])
	by mailer.at.ds9 (Postfix) with ESMTP id D40E17576E
	for <linux-lvm@redhat.com>; Mon,  5 Mar 2007 21:56:33 +0100 (CET)
From: "Cisco" <cisco66@gmx.de>
Subject: AW: [linux-lvm] WARNING: Ignoring duplicate config
	node:filter	(seeking filter)
Date: Mon, 5 Mar 2007 21:56:33 +0100
MIME-Version: 1.0
In-Reply-To: <20070305193551.GL3319@agk.surrey.redhat.com>
Message-Id: <20070305205633.D40E17576E@mailer.at.ds9>
Content-Transfer-Encoding: 8bit
Reply-To: cisco66@gmx.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

*g*, yes, you're (of course) right!
I just made a fast attempt without thinking... 

> -----Urspr�ngliche Nachricht-----
> Von: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] Im Auftrag von Alasdair G Kergon
> Gesendet: Montag, 5. M�rz 2007 20:36
> An: LVM general discussion and development
> Betreff: Re: [linux-lvm] WARNING: Ignoring duplicate config 
> node:filter (seeking filter)
> 
> On Mon, Mar 05, 2007 at 08:16:35PM +0100, Cisco wrote:
> > filter = [ "a/.*/", "r|/dev/cdrom|", "r|/dev/hda|", "r|/dev/hdb|", 
> > "r|/cdrom|" ]
>  
> Oops - the first pattern matches everything so the rest will 
> have no effect:-)
> 
> The man page says:
>               filter  -- List of patterns to apply to devices 
> found by a scan.
>               Patterns are regular expressions delimited by 
> any character  and
>               preceded  by a (for accept) or r (for reject).  
> The list is tra-
>               versed in order, and the first regex that 
> matches determines  if
>               the device will be accepted or rejected 
> (ignored).  Devices that
>               don't match any patterns are accepted. If  you  
> want  to  reject
>               patterns  that don't match, end the list with 
> "r/.*/".  If there
>               are several names for the same device (e.g.  
> symbolic  links  in
>               /dev),  if  any  name  matches  any  a  
> pattern,  the  device is
>               accepted; otherwise if any name matches  any  r 
>  pattern  it  is
>               rejected;  otherwise  it  is accepted.  As an 
> example, to ignore
>               /dev/cdrom you could use: devices { 
> filter=["r|cdrom|"] }
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
> 
