Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3B03CA11.4161B13F@ednet.ns.ca>
Date: Thu, 17 May 2001 09:54:41 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] main drive fail
References: <31470A1D25F5D311940A0020182B88D319F972@mail.n-ary.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thomas,

Did you restore the lvm related entries in /etc ?


Thomas Inglis wrote:

> I am running lvm-0.9.1.beta1 on redhat 7.0 with a 2.4.4 kernel.
>
> I have four drives, one main 'boot' drive and three drives which were used
> with LVM. All was fine and dandy until the main boot drive failed. Ouch.
>
> I have reinstalled Redhat, and lvm-0.9.1.beta1 (thought id go with what it
> had before) and built the kernel again, then rebooted.
>
> Now the problem.
> lvscan, vgdiaplay & vgscan tells me there are no voulume groups defined.
>
> vgcreate lvmGroup /dev/hdb1 /dev/hdc1 /dev/hdd1
> informs me the drive(s) are already part of the lvmGroup
>
> pvcreate lvmGroup /dev/hdb1 /dev/hdc1 /dev/hdd1
> with the -ff switch want to initialise the drive, so I thought it prudent to
> tell it no.
>
> How can I renistate my volumes? It appears they are still valid on the
> drive, but I cant seem to create or reinstate the group.
>
> Thomas
>
> __________________________________________________
> n-ary .. .. .. functionality through creativity
> http://www.n-ary.com/ +44 (1387) 242800
>
> tagServlet ... a java alternative to ColdFusion!
> http://www.tagServlet.com/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
