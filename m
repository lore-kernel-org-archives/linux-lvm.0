Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4OLhWhB001761
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 17:43:32 -0400
Received: from web18610.mail.tpe.yahoo.com (web18610.mail.tpe.yahoo.com
	[203.84.195.107])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k4OLhTJq007809
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 17:43:30 -0400
Message-ID: <20060524213643.16484.qmail@web18610.mail.tpe.yahoo.com>
Date: Thu, 25 May 2006 05:36:43 +0800 (CST)
From: mcclnx mcc <mcclnx@yahoo.com.tw>
Subject: =?big5?q?=A6^=C2=D0:=20Re:=20[linux-lvm]=20booting=20from=20an=20LV?=
In-Reply-To: <4474B6E8.9010106@neuroweave.nl>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

But Redhat AS 4 ONLY support grub.


--- Joep Blom <jlblom@neuroweave.nl> ���G

> Francis SOUYRI wrote:
> 
> > If you need to boot from a logical partition you
> can use lilo.
> >
> > Best regards.
> >
> > Francis
> >
> > Joep Blom wrote:
> >
> >> Luca Berra wrote:
> >>
> >>> On Tue, May 23, 2006 at 12:21:41PM +0200, Joep
> Blom wrote:
> >>>
> >>>> I have one question.
> >>>> Is it possible with grub to use a logical
> volume as boot partition?
> >>>> (e.g.:partition: /dev/VG01/lvol0.
> >>>
> >>>
> >>>
> >>> No.
> >>>
> >>> L.
> >>>
> >> Thanks
> >> Joep
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> >>
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> >
> Francis,
> Thanks. I've read that. But after 7 or 8 years using
> LILO with all the 
> problems around it, I switched 2 years ago to grub
> and decided to stick 
> to it. So my solution is to make a small (100 Mb)
> primary partition for 
> grub and do the rest with LVM as I have discovered
> the ease and 
> advantage of it after years of struggling with fdisk
> (DOS, W98, Linux) 
> and with the ntfsprogs suite it's easy to create XP
> partitions in an LV 
> for backups.
> Joep
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 


___________________________________________________  �̷s�� Yahoo!�_���Y�ɳq�T 7.0�A�K�O�����q�ܥ��A���I  http://messenger.yahoo.com.tw/
