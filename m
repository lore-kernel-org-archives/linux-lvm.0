Return-Path: <root@lewis.abi.tconline.net>
From: Lewis Bergman <lbergman@abi.tconline.net>
Subject: Re: [linux-lvm] lvm-mod PLEASE HELP!!!
Date: Thu, 16 Aug 2001 14:58:16 -0500
References: <3B7C24BD.9DDAE700@xapnet.com>
In-Reply-To: <3B7C24BD.9DDAE700@xapnet.com>
MIME-Version: 1.0
Message-Id: <0108161458160H.01966@lewis.abi.tconline.net>
Content-Transfer-Encoding: 8bit
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

On Thursday 16 August 2001 02:53 pm, you wrote:
> Hello !!!
>            I really need help with this install concerning the module
> lvm-mod. I am running redaht 7.1 with kernel 2.4.2-2. I have know
> installed lvm-1.0 and applied the patch. I have basically read and
> followed the directions over and over and still when I insmod lvm-mod It
> tells me no module to be found and I cannot figure it out. 1) I ran the
> configure script 2) ran make to create the patch and applied it 3)  ran
> make and make install.  Thanks, Chris.
>
After you applied the patch to the kernel did you then
make dep clean bzlilo modules modules_install   ?
You can substitute bzlilo for bzimage and then do the copying by hand to be 
safe. If you haven't done the last two then there would be no modules 
installed. Did you check under /lib/modules/kernelversion/ for the lvm 
modules?
-- 
Lewis Bergman
Texas Communications
4309 Maple St.
Abilene, TX 79602-8044
915-695-6962
