Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i274iK823510
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 23:44:20 -0500
Received: from tomhollins.com (nameservices.net [208.234.23.178] (may be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i274iHST029490
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 23:44:17 -0500
Received: from linux1 (h179.220.40.162.ip.alltel.net [162.40.220.179])
	by tomhollins.com (8.12.10/8.12.10) with SMTP id i274i7L9025005
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 23:44:07 -0500
From: Tom Hollins <tom@tomhollins.com>
Subject: Re: [linux-lvm] Help : vg not accessible
Message-Id: <20040306234249.518deda5.tom@tomhollins.com>
In-Reply-To: <2291972.1078616753747.JavaMail.www@wwinf0402>
References: <2291972.1078616753747.JavaMail.www@wwinf0402>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Mar  6 23:42:21 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Did you boot to a rescue CD or floppy with the LVM tools?

if so read on. If not stop and be able to boot to one then read below.

I believe what will be requested by the people in the know (Heinz and Joe) is what were the LVM commands that you used to do this? Example pvcreate on the drive then vgextend (or whatever).

After you did this did you back up the VGDA that was created? This means back it up to a floppy or CD or some other storage device or medium (USB drive)?

Heinz normally asks you to post a pvdata or pvdisplay which shows everyone how the system currently "sees" the drive.

-T-



On Sun,  7 Mar 2004 00:45:53 +0100 (CET)
dld.pascal.garcia@wanadoo.fr wrote:

> Hello, 
> I introduce myself because that is the first time I use this mailing list.  
> 43, french, engenieer. I am using Linux since 3 years now. 
>  
> My problem is the following : 
> If use lvm on my laptop for ages. 
>  
> By lack of space I decided to add a pv to the vg, and extend the lv /. 
>  
> It worked, but obviously the tool I used (diskdrake) did not write the partition table, and 
> may be did other things stranges, so that after rebbot nothing works any longer (fatal). 
>  
> I made some tests and changes but probably made the situation even worse, by losing 
> the MSB, so I cant even start booting. 
>  
> You probably understand that my / partition is on the vg, so that I do not have acces to 
> the previous /etc/lvmcon/* and others files. 
>  
> could somebody give me the informatoipn where I can find the data structure I could 
> eventually modify, so that, mounting this disk in an other system where linuw is installed 
> the vg could be scaned? 
>  
> If not could somebody help me on this analisys and modification ? I know it will be hard, 
> but my data is important. 
>  
> thank you  
>  
> Pascal Garcia 
>  
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
