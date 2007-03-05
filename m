Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25JGw9h016032
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 14:16:58 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l25JGg3e000524
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 14:16:45 -0500
From: "Cisco" <cisco66@gmx.de>
Subject: AW: [linux-lvm] WARNING: Ignoring duplicate config node:
	filter	(seeking filter)
Date: Mon, 5 Mar 2007 20:16:35 +0100
MIME-Version: 1.0
In-Reply-To: <45EC5F32.1060100@davidb.org>
Message-Id: <20070305191635.75F0E7576E@mailer.at.ds9>
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
To: 'David Brown' <lvm@davidb.org>, 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Dave,

thanks a lot !
It worked by consolidating the "filter" lines into one single line
containing all filter statements.
filter = [ "a/.*/", "r|/dev/cdrom|", "r|/dev/hda|", "r|/dev/hdb|",
"r|/cdrom|" ]

Tom
 

> -----Urspr�ngliche Nachricht-----
> Von: David Brown [mailto:lvm@davidb.org] 
> Gesendet: Montag, 5. M�rz 2007 19:20
> An: cisco66@gmx.de; LVM general discussion and development
> Betreff: Re: [linux-lvm] WARNING: Ignoring duplicate config 
> node: filter (seeking filter)
> 
> Cisco wrote:
> >  
> >  Hi all,
> >  
> >  after upgrading (compiling from source)LVM2 and device  mapper, i 
> > always get the warning message "WARNING: Ignoring  duplicate config 
> > node: filter (seeking filter)" when doing  "lvm version" or 
> any other 
> > lvm command.
> >  
> >  Does anyone know what's going on and if i should be  
> concerned about 
> > this, or even better: What is the meaning of  this message 
> and how can 
> > i get rid of it.
> 
> You have multiple "filter = " lines in your lvm config file.  
> Previous versions ignored this (but appeared to only use one 
> of them).  You need to specify all of the filtering you want 
> in one list.
> 
> Dave
> 
