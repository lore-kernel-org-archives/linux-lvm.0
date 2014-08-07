Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s776pxSD021739
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 02:51:59 -0400
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s776pvv2009621
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 02:51:57 -0400
Received: by mail-oi0-f42.google.com with SMTP id a3so2406145oib.29
	for <linux-lvm@redhat.com>; Wed, 06 Aug 2014 23:51:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKtQ4UkDfuxfMMGLjJv9=aNQv4gm6TEqEDr3Hbbo=GVOk-Q6pQ@mail.gmail.com>
References: <CAKtQ4UkDfuxfMMGLjJv9=aNQv4gm6TEqEDr3Hbbo=GVOk-Q6pQ@mail.gmail.com>
Date: Thu, 7 Aug 2014 08:51:56 +0200
Message-ID: <CAE7pJ3D-vwGSzgCO8RNMJj2-K8KjK_O1Qn=Up46mu4+XN-XVJg@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Subject: Re: [linux-lvm] can't deactive VG in cluster
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

no config and no log

2014-08-07 3:07 GMT+02:00 Dong Ding <dyd281@gmail.com>:
> Dear all,
> I have two servers as active/standby function.   I  used the lvm in two
> servers but not use the 'exclusive' for VG.      I  tried  umount the volume
> in active server, then  vgchange -an VG,  but  the deactive failed . From
> lvs output that shows the lv's attr still has a 'o' at 6th place, but  the
> volume not mounted.
>
> There are 6 cluster groups,   when I  tried to  migrate to standby servers
> that all the active servers have same issuse.
>
> Normally  if the volume umounted,  the lvs output show the  'attr' without
> 'o' at 6th place,  but I have it.
>
> pls help me find  the  reason.  thx
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
esta es mi vida e me la vivo hasta que dios quiera
