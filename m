Return-Path: <neilm@foobarhouse.com>
Message-ID: <00a901c1268d$7092d600$6601a8c0@foobarhouse.com>
From: "Neil Macvicar" <neilm@foobarhouse.com>
References: <3B7C24BD.9DDAE700@xapnet.com>
Subject: Re: [linux-lvm] lvm-mod PLEASE HELP!!!
Date: Thu, 16 Aug 2001 20:55:46 +0100
MIME-Version: 1.0
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

Try 'depmod -a' as root.

--Neil.

----- Original Message ----- 
From: "Chris Bourne" <cbourne@xapnet.com>
To: "lvm" <linux-lvm@sistina.com>
Sent: Thursday, August 16, 2001 8:53 PM
Subject: [linux-lvm] lvm-mod PLEASE HELP!!!


> Hello !!!
>            I really need help with this install concerning the module
> lvm-mod. I am running redaht 7.1 with kernel 2.4.2-2. I have know
> installed lvm-1.0 and applied the patch. I have basically read and
> followed the directions over and over and still when I insmod lvm-mod It
> tells me no module to be found and I cannot figure it out. 1) I ran the
> configure script 2) ran make to create the patch and applied it 3)  ran
> make and make install.  Thanks, Chris.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
