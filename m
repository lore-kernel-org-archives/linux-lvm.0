Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i38Eebj08112
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 10:40:37 -0400
Received: from imf22aec.mail.bellsouth.net (imf22aec.mail.bellsouth.net
	[205.152.59.70])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i38EeZGl006109
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 10:40:36 -0400
Subject: Re: [linux-lvm] GFS + LVM ?
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <01d401c41cd0$06477c60$0204a8c0@tec02>
References: <01d401c41cd0$06477c60$0204a8c0@tec02>
Message-Id: <1081435161.25991.3.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Date: Thu, 08 Apr 2004 10:39:22 -0400
Content-Transfer-Encoding: 8bit
Reply-To: freemyer-ml@NorcrossGroup.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com, =?ISO-8859-1?Q?Jo=E3o?= Assad <jfassad@parperfeito.com.br>


Lustre?  It is for tying together lots of back-end storage servers into
a single large file-system I think.

I think the consolidated filesystem is available for internal use of the
storage servers as well as for exporting to other servers in the
network.

HTH
Greg
-- 
Greg Freemyer

On Wed, 2004-04-07 at 14:42, Jo�o Assad wrote: 
> Hello,
> 
> I'd like to know if there is a way to concatenate multiple shared file
> systems from multiple storage devices into one single file system to be
> accessed by multiple hosts.
> 
> maybe using lvm on top of gfs?
> 
> please cc to my e-mail as I am not subscribed to linux-lvm.
> 
> Thanks in advance.
> 
> --
> - Jo�o Assad
> - ParPerfeito Comunica��o LTDA
> - http://www.parperfeito.com.br/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
