Message-ID: <20031215195720.84933.qmail@web13505.mail.yahoo.com>
From: Stuart Felenstein <stuart4m@yahoo.com>
Subject: Re: [linux-lvm] LVM and devfs
In-Reply-To: <20031215194252.GA30671@percy.comedia.it>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-202673445-1071518240=:84439"
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
Date: Mon Dec 15 15:22:05 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-202673445-1071518240=:84439
Content-Type: text/plain; charset=us-ascii

Luca, 
 
I think you may be off here.  It was RedHat9 that gave me the option of using LVM.  
I've gone to the 2.4.23 kernel with devfs and lvm support.  I know there is alot or a good amount of controvery around devfs but I think I'll ride it out and see how it works for me.
Thank you for your response.
 
Stuart 

Luca Berra <bluca@comedia.it> wrote:
- devfs in not supported on redhat 9
- lvm created on a non devfs system do not work on a devfs system
without tinkering and vice versa. devfs=nomount yelds even worse
results
remove devfs from your kernel

L.

-- 
Luca Berra -- bluca@comedia.it
Communication Media & Services S.r.l.
/"\
\ / ASCII RIBBON CAMPAIGN
X AGAINST HTML MAIL
/ \

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--0-202673445-1071518240=:84439
Content-Type: text/html; charset=us-ascii

<DIV>Luca, </DIV>
<DIV>&nbsp;</DIV>
<DIV>I think you may be off here.&nbsp; It was RedHat9 that gave me the option of using LVM.&nbsp; </DIV>
<DIV>I've gone to the 2.4.23 kernel with devfs and lvm support.&nbsp;&nbsp;I know there is alot&nbsp;or a good amount of controvery around devfs but I think I'll ride it out and see how it works for me.</DIV>
<DIV>Thank you for your response.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Stuart&nbsp;<BR><BR><B><I>Luca Berra &lt;bluca@comedia.it&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">- devfs in not supported on redhat 9<BR>- lvm created on a non devfs system do not work on a devfs system<BR>without tinkering and vice versa. devfs=nomount yelds even worse<BR>results<BR>remove devfs from your kernel<BR><BR>L.<BR><BR>-- <BR>Luca Berra -- bluca@comedia.it<BR>Communication Media &amp; Services S.r.l.<BR>/"\<BR>\ / ASCII RIBBON CAMPAIGN<BR>X AGAINST HTML MAIL<BR>/ \<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@sistina.com<BR>http://lists.sistina.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</BLOCKQUOTE>
--0-202673445-1071518240=:84439--
