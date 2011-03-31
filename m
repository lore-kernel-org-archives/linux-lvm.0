Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2VJKEHT011472
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 15:20:14 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2VJK21j006708
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 15:20:07 -0400
Received: from [192.168.1.4] (unknown [82.66.78.161])
	by smtp4-g21.free.fr (Postfix) with ESMTP id C75D04C81D7
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 21:19:58 +0200 (CEST)
Message-ID: <4D94D3DD.80300@free.fr>
Date: Thu, 31 Mar 2011 21:19:57 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <DE6049702F6A4634890B18D047C27E03@caramon><20110329124434.3cf62c3e@bettercgi.com><CE3415B4EB40445F8F294A52BC905070@caramon><alpine.LRH.2.00.1103291804330.23827@bmsred.bmsi.com><5A7D1164A7AD4CA292C1E5176D286D23@caramon>	<20110330100423.7a9e3100@bettercgi.com>
	<8D6C975F95144BEBB5084D6B86B210E6@caramon>
In-Reply-To: <8D6C975F95144BEBB5084D6B86B210E6@caramon>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

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
If the only tool you have is a hammer, you tend to see every problem as a nail.
                Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel. 
