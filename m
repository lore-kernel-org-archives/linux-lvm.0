Message-ID: <20031215182639.89303.qmail@web13503.mail.yahoo.com>
From: Stuart Felenstein <stuart4m@yahoo.com>
Subject: Re: [linux-lvm] LVM and devfs
In-Reply-To: <1071510487.3227.4.camel@gecko.indygecko.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-604653494-1071512799=:89228"
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
Date: Mon Dec 15 15:22:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-604653494-1071512799=:89228
Content-Type: text/plain; charset=us-ascii

Thank you.  I solved part of my problem by getting the devfs daemon loaded. Now working through the rest of the doc.  I realized after some time that LVM can coexist with devfs and they are not going to bump heads.
 
Stuart

Jord Tanner <jord@indygecko.com> wrote:
I believe your problem is that you need an initrd that includes LVM
stuff. Try the command "lvmcreate_initrd", then ensure that the new
lvm_initrd file is loaded with lilo (I use grub so I can't help you with
lilo). RH uses their own initrd, so you should be able to use the
existing lilo.conf as a guide. If you have an unusual setup you may have
to mount the initrd file, and edit it yourself. 

Jord Tanner



On Sun, 2003-12-14 at 03:33, Stuart Felenstein wrote:
> I didn't see a search option in the archives and I apologize if this
> is more appropriate to the devfs list. I installed RedHat9 , and
> partitioned with DiskDruid using LVM. The only partition that is not
> LVM is /boot.
> However I have now compiled kernel 2.4.23 with LVM and devfs and
> running into a problem with kernel panics. I'm not sure if having LVM
> is causing the issue. Even though I've tried many different append
> roots, looking at the working kernel in lilo.conf I see root =
> /dev/Volume00/LogVol01. So I'm' wondering how I translate that to
> /dev/ide/host0..... .
> 
> Here is my current /etc/fstab: 
> /dev/Volume00/LogVol01 / ext3
> LABEL =/boot /boot ext3
> /dev/Volume00/LogVol02 /cache ext3
> /dev/Volume00/LogVol03 /myth ext3
> none /proc proc
> none /dev/shm tmpfs
> /dev/Volume00/LogVol00 /swap swap
> /dev/cdrom
> 
> Greatly appreciate some help, pointers and / or links.
> Thank you,
> Stuart
-- 
Jord Tanner 


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--0-604653494-1071512799=:89228
Content-Type: text/html; charset=us-ascii

<DIV>Thank you.&nbsp; I solved part of my problem by getting the devfs daemon loaded. Now working through the rest of the doc.&nbsp; I realized after some time that LVM can coexist with devfs and they are not going to bump heads.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Stuart<BR><BR><B><I>Jord Tanner &lt;jord@indygecko.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">I believe your problem is that you need an initrd that includes LVM<BR>stuff. Try the command "lvmcreate_initrd", then ensure that the new<BR>lvm_initrd file is loaded with lilo (I use grub so I can't help you with<BR>lilo). RH uses their own initrd, so you should be able to use the<BR>existing lilo.conf as a guide. If you have an unusual setup you may have<BR>to mount the initrd file, and edit it yourself. <BR><BR>Jord Tanner<BR><BR><BR><BR>On Sun, 2003-12-14 at 03:33, Stuart Felenstein wrote:<BR>&gt; I didn't see a search option in the archives and I apologize if this<BR>&gt; is more appropriate to the devfs list. I installed RedHat9 , and<BR>&gt; partitioned with DiskDruid using LVM. The only partition that is not<BR>&gt; LVM is /boot.<BR>&gt; However I have now compiled kernel 2.4.23 with LVM and devfs and<BR>&gt; running into a problem with kernel panics. I'm not sure if having
 LVM<BR>&gt; is causing the issue. Even though I've tried many different append<BR>&gt; roots, looking at the working kernel in lilo.conf I see root =<BR>&gt; /dev/Volume00/LogVol01. So I'm' wondering how I translate that to<BR>&gt; /dev/ide/host0..... .<BR>&gt; <BR>&gt; Here is my current /etc/fstab: <BR>&gt; /dev/Volume00/LogVol01 / ext3<BR>&gt; LABEL =/boot /boot ext3<BR>&gt; /dev/Volume00/LogVol02 /cache ext3<BR>&gt; /dev/Volume00/LogVol03 /myth ext3<BR>&gt; none /proc proc<BR>&gt; none /dev/shm tmpfs<BR>&gt; /dev/Volume00/LogVol00 /swap swap<BR>&gt; /dev/cdrom<BR>&gt; <BR>&gt; Greatly appreciate some help, pointers and / or links.<BR>&gt; Thank you,<BR>&gt; Stuart<BR>-- <BR>Jord Tanner <JORD@INDYGECKO.COM><BR><BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@sistina.com<BR>http://lists.sistina.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</BLOCKQUOTE>
--0-604653494-1071512799=:89228--
