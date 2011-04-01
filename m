Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3118VMH017338
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 21:08:31 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3118PS5009405
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 21:08:26 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id 9C2868ED64
	for <linux-lvm@redhat.com>; Fri,  1 Apr 2011 03:08:24 +0200 (CEST)
Message-ID: <F521E9B795974A73AC099D0271E75738@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <DE6049702F6A4634890B18D047C27E03@caramon><20110329124434.3cf62c3e@bettercgi.com><CE3415B4EB40445F8F294A52BC905070@caramon><alpine.LRH.2.00.1103291804330.23827@bmsred.bmsi.com><5A7D1164A7AD4CA292C1E5176D286D23@caramon>	<20110330100423.7a9e3100@bettercgi.com><8D6C975F95144BEBB5084D6B86B210E6@caramon>
	<4D94D3DD.80300@free.fr>
Date: Fri, 1 Apr 2011 03:08:24 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="utf-8"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>


----- Original Message ----- 
From: "Georges Giralt" <georges.giralt@free.fr>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Thursday, March 31, 2011 9:19 PM
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?


Le 31/03/2011 17:06, Fredrik Skog a �crit :
> Hello,
>
> If I ever get all this data back I will definitely try to either RAID
> it or make a backup of the most importatnt stuff on the volume.
>
> I have now run e2fsck -n -t -v /dev/vgftp/lvftp successfully. It gave
> me the following output. I'm not really sure what it means, but I
> think it looks pretty ok. Do you think it's ok to do this for real now?
>
> ################
> # e2fsck -n -t -v /dev/vgftp/lvftp
Snip......
/dev/vgftp/lvftp: ********** WARNING: Filesystem still has errors **********
Snip
> I will try to copy the most important stuff off of the volume before i
> try this though.
Hello Fredrik
You used "-n" option  in the e2fsck command. So  the "WARNING:
Filesystem still has errors" tell all.
You SHOULD run e2fsck without the -n option BEFORE trying to mount it
and back up data or trying to resize it !
Otherwise..... you could well loose all the data !
Just my 2� .....
BTW : it is strange that all multiply allocated blocks are found to
belong only to one file. What was the system doing during the resize ?
What was the file system activity during that time ? And las t but not
least, you once told us that before running the resize, you ran the
fsck. Was it with -n option also ?  This may explain all the subsequent
events.

-- 
If the only tool you have is a hammer, you tend to see every problem as a 
nail.
                Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


Hello,

Sorry I did not tell you that i used the -n option now just to avoid any 
changes to the filesystem before i have copied my most important data from 
the volume. I only wanted to see what kind errors i got.
I'm in the process of copying some stuff right now and will try to e2fsck it 
later when that is done.

I did not use the -n option before the resize2fs earlier.
I have X'd out the filenames in the mail. The errors all where on different 
files.

Sorry for not being clear on this.

/Fredrik Skog
