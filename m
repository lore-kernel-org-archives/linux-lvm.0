Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB34Trr30232
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 23:29:53 -0500
Received: from ms-smtp-05-eri0.texas.rr.com (ms-smtp-05.texas.rr.com
	[24.93.47.44])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB34Tqdg032667
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 23:29:53 -0500
Received: from tor.tx.mcbf.net (cs68203212-84.rgv.rr.com [68.203.212.84])
	by ms-smtp-05-eri0.texas.rr.com (8.12.10/8.12.7) with ESMTP id
	iB34TiPa000318
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 22:29:45 -0600 (CST)
Received: from adler.tx.mcbf.net ([10.10.10.11])
	by tor.tx.mcbf.net with esmtp (Exim 4.34) id 1Ca54g-0005q7-Na
	for linux-lvm@redhat.com; Thu, 02 Dec 2004 22:29:42 -0600
Subject: Re: [linux-lvm] Newbie questions about LVM
From: David Mohr <damailings@mcbf.net>
In-Reply-To: <20041203021207.72667.qmail@web54408.mail.yahoo.com>
References: <20041203021207.72667.qmail@web54408.mail.yahoo.com>
Date: Thu, 02 Dec 2004 22:30:12 -0600
Message-Id: <1102048212.4836.112.camel@adler>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
while I'm not able to really answer your question (I'm not that LVM
knowledgeable), but you are lacking some bit of crucial information:

On Thu, 2004-12-02 at 18:12 -0800, Gwen Morse wrote:
> However, that looks like it mostly deals with a single
> hard drive being copied to another single hard drive.
> We have a raid array, which looks like it's covered
> more under this:
> http://www.tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html

There is a big difference if this array is hardware or software based.
If you can provide that piece of information, people will be able to
help you better.

~David
