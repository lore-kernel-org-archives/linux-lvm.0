Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBM7Rn116513
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 02:27:49 -0500
Received: from web36208.mail.mud.yahoo.com (web36208.mail.mud.yahoo.com
	[209.191.68.234])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id jBM7Re6q008054
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 02:27:40 -0500
Message-ID: <20051222072735.85108.qmail@web36208.mail.mud.yahoo.com>
Date: Wed, 21 Dec 2005 23:27:35 -0800 (PST)
From: Hale India <hale_india@yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
In-Reply-To: <1135190468.1122.394.camel@seki.nac.uci.edu>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1665323638-1135236455=:84889"
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

--0-1665323638-1135236455=:84889
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi Dan
 
 Very nice to you to give us this link.
 
 What I was talking about is a problem for recovery specific to LVM :
 If you machine crash, (not your disk) with ext2, ext3, reiserfs, JFS you can put your disk in any other machine as second or third disk etc.. and access your data's.
 If you have a LVM : you are in the trap. With reiserfs you have many good way to recover. With JFS you can even take advantage of the situation to switch to a raid mode.
 
 For my concern I have now my solution : I start Linux in an USB key using ext3 (using SLAX) and if the machine crash I can start  in very short term using any else machine. I loose less than 30 mn and no data's and for my job 30mn is already a lot.
 
 LVM is suppose to give better function than ext2 or ext3 etc.
 Sucurity ofd data's is the first priority of disk system and should be the very first one for LVM.
 
 I have personaly daily backup. But many people have not what must we say ?
 For me I just advice them to not use LVM, because they would not have a good exit way. (even if you loose only one day it can be a problem).
 I consider that a good disk system should allow to get back data if disk is good working. Not only if the whole machine is good working.
 
 If any people has a good solution they are welcome and I would appologize.
 
 Best regards
 
 Andre
 
 

Dan Stromberg <strombrg@dcs.nac.uci.edu> wrote: 
Please see http://dcs.nac.uci.edu/~strombrg/data-recovery.html -
especially the link about ext3 and LVM2.

On Tue, 2005-12-20 at 23:30 -0800, Hale India wrote:
> Hi 
> 
> I had a recovery problem with LVM before : I failed. I
> got no real help from this mailing list.
> I finaly succeed to start the disk for a short term on
> another machine and I will never use LVM before to see
> succeful recovery process.
> Nobody at redhat take care about such problem........
> In the future take ext2, ext3, reiserfs and you will
> have plenty good recovcery solutions.
> 
> Sorry to not be able to help you more.
> Good luke.
> 
> Best regards
> 
> Andre Legendre
> 
> --- mymail mymail  wrote:
> 
> > 
> > 
> > Michael Loftis  wrote: 
> > LVM is not a filesystem, it's a block device layer. 
> > If you're 
> > running/using LVM on the existing system it's vgscan
> > and vgchange on 
> > startup should have activated all the old LVs/VGs
> > and mapped them to 
> > /dev/VGNAME/LVNAME -- those are the devices you
> > mount.
> > Thanks.
> > 
> > I realise this. But the disk I'm trying to mount is
> > built the same way as the new disk I've built. So
> > the both have a VolGroup00. What I would like to do
> > is to either understand how I can change the volume
> > group info so it will become a distinct volume
> > group, and then I can 'import' this into my new
> > environment, or how I can get into the block system
> > so I can access the filesystem structure it embeds.
> > 
> > This is where I'm struggling. I would like to create
> > a VolGroup01 device file, rename the volume group
> > within the physical volume, and then mount that. Is
> > it possible to 'hack' the old drive like this?
> > 
> > 
> > __________________________________________________
> > Do You Yahoo!?
> > Tired of spam?  Yahoo! Mail has the best spam
> > protection around 
> > http://mail.yahoo.com >
> _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--0-1665323638-1135236455=:84889
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div id="RTEContent">Hi Dan<br> <br> Very nice to you to give us this link.<br> <br> What I was talking about is a problem for recovery specific to LVM :<br> If you machine crash, (not your disk) with ext2, ext3, reiserfs, JFS you can put your disk in any other machine as second or third disk etc.. and access your data's.<br> If you have a LVM : you are in the trap. With reiserfs you have many good way to recover. With JFS you can even take advantage of the situation to switch to a raid mode.<br> <br> For my concern I have now my solution : I start Linux in an USB key using ext3 (using SLAX) and if the machine crash I can start&nbsp; in very short term using any else machine. I loose less than 30 mn and no data's and for my job 30mn is already a lot.<br> <br> LVM is suppose to give better function than ext2 or ext3 etc.<br> Sucurity ofd data's is the first priority of disk system and should be the very first one for LVM.<br> <br> I have personaly daily backup. But many peopl!
e have
 not what must we say ?<br> For me I just advice them to not use LVM, because they would not have a good exit way. (even if you loose only one day it can be a problem).<br> I consider that a good disk system should allow to get back data if disk is good working. Not only if the whole machine is good working.<br> <br> If any people has a good solution they are welcome and I would appologize.<br> <br> Best regards<br> <br> Andre<br> <br> <br><br><b><i>Dan Stromberg &lt;strombrg@dcs.nac.uci.edu&gt;</i></b> wrote:<blockquote class="replbq" style="border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"> <br>Please see http://dcs.nac.uci.edu/~strombrg/data-recovery.html -<br>especially the link about ext3 and LVM2.<br><br>On Tue, 2005-12-20 at 23:30 -0800, Hale India wrote:<br>&gt; Hi <br>&gt; <br>&gt; I had a recovery problem with LVM before : I failed. I<br>&gt; got no real help from this mailing list.<br>&gt; I finaly succeed to start the disk for a short!
 term
 on<br>&gt; another machine and I will never use LVM before to see<br>&gt; succeful recovery process.<br>&gt; Nobody at redhat take care about such problem........<br>&gt; In the future take ext2, ext3, reiserfs and you will<br>&gt; have plenty good recovcery solutions.<br>&gt; <br>&gt; Sorry to not be able to help you more.<br>&gt; Good luke.<br>&gt; <br>&gt; Best regards<br>&gt; <br>&gt; Andre Legendre<br>&gt; <br>&gt; --- mymail mymail <internetbizmail @yahoo.com=""> wrote:<br>&gt; <br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; Michael Loftis <mloftis @wgops.com=""> wrote: <br>&gt; &gt; LVM is not a filesystem, it's a block device layer. <br>&gt; &gt; If you're <br>&gt; &gt; running/using LVM on the existing system it's vgscan<br>&gt; &gt; and vgchange on <br>&gt; &gt; startup should have activated all the old LVs/VGs<br>&gt; &gt; and mapped them to <br>&gt; &gt; /dev/VGNAME/LVNAME -- those are the devices you<br>&gt; &gt; mount.<br>&gt; &gt; Thanks.<br>&gt; &gt; <br>&gt; &gt;!
 I
 realise this. But the disk I'm trying to mount is<br>&gt; &gt; built the same way as the new disk I've built. So<br>&gt; &gt; the both have a VolGroup00. What I would like to do<br>&gt; &gt; is to either understand how I can change the volume<br>&gt; &gt; group info so it will become a distinct volume<br>&gt; &gt; group, and then I can 'import' this into my new<br>&gt; &gt; environment, or how I can get into the block system<br>&gt; &gt; so I can access the filesystem structure it embeds.<br>&gt; &gt; <br>&gt; &gt; This is where I'm struggling. I would like to create<br>&gt; &gt; a VolGroup01 device file, rename the volume group<br>&gt; &gt; within the physical volume, and then mount that. Is<br>&gt; &gt; it possible to 'hack' the old drive like this?<br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; __________________________________________________<br>&gt; &gt; Do You Yahoo!?<br>&gt; &gt; Tired of spam?  Yahoo! Mail has the best spam<br>&gt; &gt; protection around <br>&gt; &gt;
 http://mail.yahoo.com &gt;<br>&gt; _______________________________________________<br>&gt; &gt; linux-lvm mailing list<br>&gt; &gt; linux-lvm@redhat.com<br>&gt; &gt; https://www.redhat.com/mailman/listinfo/linux-lvm<br>&gt; &gt; read the LVM HOW-TO at<br>&gt; http://tldp.org/HOWTO/LVM-HOWTO/<br>&gt; <br>&gt; _______________________________________________<br>&gt; linux-lvm mailing list<br>&gt; linux-lvm@redhat.com<br>&gt; https://www.redhat.com/mailman/listinfo/linux-lvm<br>&gt; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>&gt; <br><br>_______________________________________________<br>linux-lvm mailing list<br>linux-lvm@redhat.com<br>https://www.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br></mloftis></internetbizmail></blockquote><br></div>
--0-1665323638-1135236455=:84889--
