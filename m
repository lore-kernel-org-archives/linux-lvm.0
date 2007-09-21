Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8LHQOF0023402
	for <linux-lvm@redhat.com>; Fri, 21 Sep 2007 13:26:24 -0400
Received: from web33614.mail.mud.yahoo.com (web33614.mail.mud.yahoo.com
	[68.142.199.246])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l8LHQHEs007463
	for <linux-lvm@redhat.com>; Fri, 21 Sep 2007 13:26:17 -0400
Date: Fri, 21 Sep 2007 10:26:11 -0700 (PDT)
From: Sagar Borikar <borikar_sagar@yahoo.com>
Subject: Re: [linux-lvm] exception when snapshot size is less than the volume
	size
In-Reply-To: <46F2D78F.5020705@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1328842134-1190395571=:71432"
Content-Transfer-Encoding: 8bit
Message-ID: <440173.71432.qm@web33614.mail.mud.yahoo.com>
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

--0-1328842134-1190395571=:71432
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi Milan,
   
  Thanks a lot!
  It worked very nice!
   
  Cheers
  Sagar

Milan Broz <mbroz@redhat.com> wrote:
  Hi,

this is an old snapshot bug, already fixed in all
recent kernels - see http://bugzilla.kernel.org/show_bug.cgi?id=7040

Plese could you try to apply patch mentioned in this bugzilla ?
also here
http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.18.y.git;a=commitdiff;h=2b64e22fdbc35b4a0e7c1cbda590daaced401c35;hp=6e28fa8b0390dcbb883994f3c634c1f56fe4f93a

(or simply use latest stable 2.6.18.8 kernel)

Milan
--
mbroz@redhat.com

Sagar Borikar wrote:
> In my NAS box, I observed strange thing yesterday. I had the snapshot
> size (32MB) less than volume size was (10 GB) You can say I was trying
> to do failure analysis of my box. The LVM HOwto for snapshot says
> "
> **
> 
> 
> If the snapshot logical volume becomes full it will be dropped (become
> unusable) so it is vitally important to allocate enough space. The
> amount of space necessary is dependent on the usage of the snapshot, so
> there is no set recipe to follow for this. If the snapshot size equals
> the origin size, it will never overflow.
> 
> "
> But my box was crashed in this scenario.
> Was wondering why didn't it disable the snapshots. 
> The underlying processor is MIPS and linux kernel version is 2.6.18.
> After delving little bit in the sources I found that break is occurring
> while blowing away the snapshot facility -- so it`s not surprising that
> snapshots do not work anymore. Just before the error,
> kcopyd_client_destroy is called -- so that`s it for kcopyd jobs -- hence
> snapshots. The snapshot faciltiy is gone at that point, with or without
> the BUG_ON. The error actually occurs while freeing the exception tables
> in the slab cache.
> 
> Any pointers if this has been resolved?
> I am working with lvm version 2.02.28. and device mapper version 1.02.22

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


       
---------------------------------
Shape Yahoo! in your own image.  Join our Network Research Panel today!
--0-1328842134-1190395571=:71432
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div>Hi Milan,</div>  <div>&nbsp;</div>  <div>Thanks a lot!</div>  <div>It worked very nice!</div>  <div>&nbsp;</div>  <div>Cheers</div>  <div>Sagar<BR><BR><B><I>Milan Broz &lt;mbroz@redhat.com&gt;</I></B> wrote:</div>  <BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">Hi,<BR><BR>this is an old snapshot bug, already fixed in all<BR>recent kernels - see http://bugzilla.kernel.org/show_bug.cgi?id=7040<BR><BR>Plese could you try to apply patch mentioned in this bugzilla ?<BR>also here<BR>http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.18.y.git;a=commitdiff;h=2b64e22fdbc35b4a0e7c1cbda590daaced401c35;hp=6e28fa8b0390dcbb883994f3c634c1f56fe4f93a<BR><BR>(or simply use latest stable 2.6.18.8 kernel)<BR><BR>Milan<BR>--<BR>mbroz@redhat.com<BR><BR>Sagar Borikar wrote:<BR>&gt; In my NAS box, I observed strange thing yesterday. I had the snapshot<BR>&gt; size (32MB) less than volume size was (10 GB) You can say I was
 trying<BR>&gt; to do failure analysis of my box. The LVM HOwto for snapshot says<BR>&gt; "<BR>&gt; **<BR>&gt; <BR>&gt; <BR>&gt; If the snapshot logical volume becomes full it will be dropped (become<BR>&gt; unusable) so it is vitally important to allocate enough space. The<BR>&gt; amount of space necessary is dependent on the usage of the snapshot, so<BR>&gt; there is no set recipe to follow for this. If the snapshot size equals<BR>&gt; the origin size, it will never overflow.<BR>&gt; <BR>&gt; "<BR>&gt; But my box was crashed in this scenario.<BR>&gt; Was wondering why didn't it disable the snapshots. <BR>&gt; The underlying processor is MIPS and linux kernel version is 2.6.18.<BR>&gt; After delving little bit in the sources I found that break is occurring<BR>&gt; while blowing away the snapshot facility -- so it`s not surprising that<BR>&gt; snapshots do not work anymore. Just before the error,<BR>&gt; kcopyd_client_destroy is called -- so that`s it for kcopyd jobs --
 hence<BR>&gt; snapshots. The snapshot faciltiy is gone at that point, with or without<BR>&gt; the BUG_ON. The error actually occurs while freeing the exception tables<BR>&gt; in the slab cache.<BR>&gt; <BR>&gt; Any pointers if this has been resolved?<BR>&gt; I am working with lvm version 2.02.28. and device mapper version 1.02.22<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com<BR>https://www.redhat.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<BR></BLOCKQUOTE><BR><p>&#32;
      <hr size=1>Shape Yahoo! in your own image.  
<a href="http://us.rd.yahoo.com/evt=48517/*http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7">Join our Network Research Panel today!</a>

--0-1328842134-1190395571=:71432--
