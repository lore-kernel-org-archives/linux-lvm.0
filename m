Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMB9u125334
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 06:09:56 -0500
Received: from web36215.mail.mud.yahoo.com (web36215.mail.mud.yahoo.com
	[209.191.68.241])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id jBMB9nGg021008
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 06:09:49 -0500
Message-ID: <20051222110943.12271.qmail@web36215.mail.mud.yahoo.com>
Date: Thu, 22 Dec 2005 03:09:43 -0800 (PST)
From: Hale India <hale_india@yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
In-Reply-To: <20051222103631.GJ10278@strugglers.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-166569394-1135249783=:7048"
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

--0-166569394-1135249783=:7048
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi Andy
 
 Nice news. Last time when I post my problems I got no answers.
 
 If you can describe how to proceed when you need to move your hardisks to another machine (In my case the cause when hardware failure of mother board) and when boot disk doesnot accept to boot on the new machine (in my case it was fedora 4 and probably some difference of hardware. The only way I solved was to install disks in the exactly same machine)

 If you can give to us some guideline it would probably save some situations.
 If you can point us to documentation in LVM project usefull for such case it would even be better.
 
 Best regards
 
 Andre Legendre
Andy Smith <andy@strugglers.net> wrote: On Wed, Dec 21, 2005 at 11:27:35PM -0800, Hale India wrote:
>    What I was talking about is a problem for recovery specific to LVM :
>    If you machine crash, (not your disk) with ext2, ext3, reiserfs, JFS
>    you can put your disk in any other machine as second or third disk
>    etc.. and access your data's.

If my machines crash often enough that I am regularly juggling disks
I consider this a problem beyond the scope of LVM (unless they're
crashing in LVM).

Anytime I *have* had to move LVM setups to other machines I have had
no issues.

I'm confused why you continually compare LVM to various filesystems
when it isn't a filesystem.  It has different challenges and use
cases.

>    I consider that a good disk system should allow to get back data if
>    disk is good working. Not only if the whole machine is good working.
>    If any people has a good solution they are welcome and I would
>    appologize.

If you could go into more detail regarding incidents where you have
lost data on otherwise working disks then perhaps you could get more
help.
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--0-166569394-1135249783=:7048
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div id="RTEContent">Hi Andy<br> <br> Nice news. Last time when I post my problems I got no answers.<br> <br> If you can describe how to proceed when you need to move your hardisks to another machine (In my case the cause when hardware failure of mother board) and when boot disk doesnot accept to boot on the new machine (in my case it was fedora 4 and probably some difference of hardware. The only way I solved was to install disks in the exactly same machine)<br><br> If you can give to us some guideline it would probably save some situations.<br> If you can point us to documentation in LVM project usefull for such case it would even be better.<br> <br> Best regards<br> <br> Andre Legendre<br><b><i>Andy Smith &lt;andy@strugglers.net&gt;</i></b> wrote:<blockquote class="replbq" style="border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"> On Wed, Dec 21, 2005 at 11:27:35PM -0800, Hale India wrote:<br>&gt;    What I was talking about is a problem for re!
covery
 specific to LVM :<br>&gt;    If you machine crash, (not your disk) with ext2, ext3, reiserfs, JFS<br>&gt;    you can put your disk in any other machine as second or third disk<br>&gt;    etc.. and access your data's.<br><br>If my machines crash often enough that I am regularly juggling disks<br>I consider this a problem beyond the scope of LVM (unless they're<br>crashing in LVM).<br><br>Anytime I *have* had to move LVM setups to other machines I have had<br>no issues.<br><br>I'm confused why you continually compare LVM to various filesystems<br>when it isn't a filesystem.  It has different challenges and use<br>cases.<br><br>&gt;    I consider that a good disk system should allow to get back data if<br>&gt;    disk is good working. Not only if the whole machine is good working.<br>&gt;    If any people has a good solution they are welcome and I would<br>&gt;    appologize.<br><br>If you could go into more detail regarding incidents where you have<br>lost data on otherwise w!
orking
 disks then perhaps you could get more<br>help.<br>_______________________________________________<br>linux-lvm mailing list<br>linux-lvm@redhat.com<br>https://www.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</blockquote><br></div>
--0-166569394-1135249783=:7048--
