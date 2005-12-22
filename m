Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMChr111637
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 07:43:53 -0500
Received: from web36211.mail.mud.yahoo.com (web36211.mail.mud.yahoo.com
	[209.191.68.237])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jBMChqMt028531
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 07:43:52 -0500
Message-ID: <20051222124346.78978.qmail@web36211.mail.mud.yahoo.com>
Date: Thu, 22 Dec 2005 04:43:46 -0800 (PST)
From: Hale India <hale_india@yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
In-Reply-To: <20051222122513.GP10278@strugglers.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-925150701-1135255426=:78626"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-925150701-1135255426=:78626
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi
 
 I tried to see my data from knoppix, but for what I remember knoppiux does not support LVM.
 From your links I found
 http://dcs.nac.uci.edu/~strombrg/EXT3-filesystem-recovery-in-LVM2.html
 Which seems to give some tricks. I don't know if this is capable to work.
 
 But it seems that LVM project does not take care about that and I find very bad for such a project to give no exit way for such a problem.
 
 It should have some recovery guide documentation in the project.
 
 Thank's to Andy. I hope that your links can be usefull for some people.
 
 Best regards
 
 Andre Legendre
 

Andy Smith <andy@strugglers.net> wrote: On Thu, Dec 22, 2005 at 03:42:39AM -0800, Hale India wrote:
> 
>    Hi Andy :
>    Disks was not broken. Mother board was.
>    I don't remember any hints.

https://www.redhat.com/archives/linux-lvm/2005-December/msg00107.html
https://www.redhat.com/archives/linux-lvm/2005-December/msg00108.html
https://www.redhat.com/archives/linux-lvm/2005-December/msg00111.html

What exact problems do you face once you boot a machine with your
disks in it and do a vgscan?
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--0-925150701-1135255426=:78626
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div id="RTEContent">Hi<br> <br> I tried to see my data from knoppix, but for what I remember knoppiux does not support LVM.<br> From your links I found<br> http://dcs.nac.uci.edu/~strombrg/EXT3-filesystem-recovery-in-LVM2.html<br> Which seems to give some tricks. I don't know if this is capable to work.<br> <br> But it seems that LVM project does not take care about that and I find very bad for such a project to give no exit way for such a problem.<br> <br> It should have some recovery guide documentation in the project.<br> <br> Thank's to Andy. I hope that your links can be usefull for some people.<br> <br> Best regards<br> <br> Andre Legendre<br> <br><br><b><i>Andy Smith &lt;andy@strugglers.net&gt;</i></b> wrote:<blockquote class="replbq" style="border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"> On Thu, Dec 22, 2005 at 03:42:39AM -0800, Hale India wrote:<br>&gt; <br>&gt;    Hi Andy :<br>&gt;    Disks was not broken. Mother board was.<br>&gt; !
   I
 don't remember any hints.<br><br>https://www.redhat.com/archives/linux-lvm/2005-December/msg00107.html<br>https://www.redhat.com/archives/linux-lvm/2005-December/msg00108.html<br>https://www.redhat.com/archives/linux-lvm/2005-December/msg00111.html<br><br>What exact problems do you face once you boot a machine with your<br>disks in it and do a vgscan?<br>_______________________________________________<br>linux-lvm mailing list<br>linux-lvm@redhat.com<br>https://www.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</blockquote><br></div>
--0-925150701-1135255426=:78626--
