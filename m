Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9K9LbV05068
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 05:21:37 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.177])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9K9LZNN020712
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 05:21:35 -0400
Message-ID: <4357619A.50903@gmx.net>
Date: Thu, 20 Oct 2005 11:21:30 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 problems!!
References: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA523@E2KMBX20VS.intranet.tim.it>
In-Reply-To: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA523@E2KMBX20VS.intranet.tim.it>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Caligiuri, Marco Ernesto schrieb:
> Hi to all....,
> pvcreate /dev/sdc or pvcreate /dev/sdc1 and any other command of lvm (vgcreate...lvcreate....) i receive always the same error:
>  
> connect() failed on local socket: Connection refused
>  Locking type 2 initialisation failed.
> 
> why?? Anyone can help me?
Is your root or var read-only ( this message usually happens in that case )?

Ciao
Klaus

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
