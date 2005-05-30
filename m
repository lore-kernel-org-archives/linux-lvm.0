Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4U7r6O25393
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 03:53:06 -0400
Received: from mrz.swissptt.ch (outmail3.swisscom.com [138.190.3.30])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4U7qxTj029091
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 03:53:00 -0400
Received: from mwdsp001.swissptt.ch (mwdsp001.swissptt.ch [10.221.40.203])
	by mrz.swissptt.ch with ESMTP id j4U7qoLM009200
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 09:52:50 +0200 (MEST)
Received: from mwdsp001 (localhost [127.0.0.1])
	by mwdsp001.swissptt.ch (8.12.11/8.12.11) with SMTP id j4U7qrRS009437
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 09:52:53 +0200
Date: Mon, 30 May 2005 09:52:53 +0200
From: Chris Osicki <osk@admin.swisscom-mobile.ch>
Subject: Re: [linux-lvm] LVM with Powerpath - incompatibility
Message-ID: <20050530095253.24aa8e53@mwdsp001>
In-Reply-To: <4296C82C.6090502@telecomplus.net>
References: <4296C82C.6090502@telecomplus.net>
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


Hi Hantzley

You should read PowerPath Release Notes (P/N 300-001-969) or at least it's page 15 ;-)
"EMC pseudeo devices are not supported with LVM. Instead, native SCSI devices must be used..."

I think EMC messed up with device names as seeen in /proc/devices under "Block devices" and
LVM doesn't recognize them. They used to be called emcpower in older versions of PP I think,
now they are "emcp".

Regards,
Chris


On Fri, 27 May 2005 11:11:40 +0400
Hantzley Tauckoor <hantzley@telecomplus.net> wrote:

> Hi,
> 
> I have a CX300 Clariion and a x445 IBM (4 processors and 4GB RAM) server 
> equipped with 2 Emulex FibreChannel cards which are directly connected 
> to the cx300's controllers.
> 
> My software config is as follows:
> 
> Redhat ES 3.0 with Kernel 2.4.21-20.ELsmp
> PowerPath 4.3.1
> LPFC 2.4 driver kit 7.2.4-1
> lvm-1.0.3-15
> 
> 
> I created 2LUNs on the cx300, and therefore I can see 4 sd devices on 
> linux (2 on one path and 2 on the other). After installing PowerPath, I 
> am able to access the LUNs via /dev/emcpowera1 and /dev/emcpowerb1 
> respectively.
> 
> But I cannot use LVM on these devices directly. However LVM works with 
> /dev/sd* devices. I wish to use it with the PowerPath devices instead, 
> so as to have dynamic multipathing.
> 
> I also tried to install Veritas Volume Manager; no luck, the eval 
> version was compiled for kernel.2.4.xx-Hugemem - which is not my present 
> kernel. I have incompatibility problems because PowerPath 4.3.1 requires 
> at kernel 2.4.21-15 or 2.4.21-20.
> 
> Is there someone who had the same type of problem? Any tip on how to 
> make LVM run with PowerPath devices?
> 
> Thank you in advance for your replies.
> 
> Rgds,
> 
> Hantzley Tauckoor
> ----------------------------------------------------
> Project Manager
> Telecom Plus Ltd
> www.telecomplus.net
> ----------------------------------------------------
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
