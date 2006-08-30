Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7U2H54Q029421
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 22:17:05 -0400
Received: from web30301.mail.mud.yahoo.com (web30301.mail.mud.yahoo.com
	[209.191.69.63])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k7U2H2Oq020335
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 22:17:03 -0400
Message-ID: <20060830021657.28641.qmail@web30301.mail.mud.yahoo.com>
Date: Tue, 29 Aug 2006 19:16:57 -0700 (PDT)
From: Tom+Dale <tdmyth@yahoo.com>
Subject: RE: [linux-lvm] Ran vgreduce --missing to remove broken disk,
	am I screwed?
In-Reply-To: <001f01c6cbae$74be1480$0a00000a@thomas>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-107115712-1156904217=:28286"
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

--0-107115712-1156904217=:28286
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Thomas Novin <thnov@xyz.pp.se> wrote:  > I had a disk that stopped working. After booting I could see with
> pvdisplay
> that the disk was missing. After reading everything I could find via
> google
> I thought that you were supposed to run 'vgreduce --remove-missing
> volgrp0'
> to remove the missing disk from the group.
> 
> After this the volume group looks OK but the entire logical volume got
> removed! Am I screwed now or is there any way to salvage the data which is
> on the remaining three disks?

Please someone answer this, is there any solution to this problem? To
clarify:

- Disk failure
- Ran 'vgreduce --remove-missing volgrp0' (probably not such a good idea)
- /dev/volgrp0/ emtpy. 'lvdisplay' doesn't show anything.

So, can I somehow restore my logical volume? The three other physical
disks/partitions are intact.

Thanks in advance,

Thomas Novin  I wish I could help you...
The answer to this question is VERY important to me, too.  I sent out a question to this mailing list on Saturday that described my nearly identical problem (although I included lots of details).  Nobody responded at all.  Perhaps I overwhelmed everyone with TMI???
   
  If there is no one here who can answer these questions, where can we go for help?
   
  Could someone please suggest a forum or reference document that can help Mr. Novin and me?  I have spent 3 weeks searching for help on the 'net; and I have read the LVM HowTo several times.  This mailing list was my best hope for assistance.
   
  Thanks again in advance for any help you might be able to provide, folks!
   
  -Tom-

 		
---------------------------------
 All-new Yahoo! Mail - Fire up a more powerful email and get things done faster.
--0-107115712-1156904217=:28286
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<B><I>Thomas Novin &lt;thnov@xyz.pp.se&gt;</I></B> wrote:  <BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">&gt; I had a disk that stopped working. After booting I could see with<BR>&gt; pvdisplay<BR>&gt; that the disk was missing. After reading everything I could find via<BR>&gt; google<BR>&gt; I thought that you were supposed to run 'vgreduce --remove-missing<BR>&gt; volgrp0'<BR>&gt; to remove the missing disk from the group.<BR>&gt; <BR>&gt; After this the volume group looks OK but the entire logical volume got<BR>&gt; removed! Am I screwed now or is there any way to salvage the data which is<BR>&gt; on the remaining three disks?<BR><BR>Please someone answer this, is there any solution to this problem? To<BR>clarify:<BR><BR>- Disk failure<BR>- Ran 'vgreduce --remove-missing volgrp0' (probably not such a good idea)<BR>- /dev/volgrp0/ emtpy. 'lvdisplay' doesn't show anything.<BR><BR>So, can I somehow restore my logical
 volume? The three other physical<BR>disks/partitions are intact.<BR><BR>Thanks in advance,<BR><BR>Thomas Novin</BLOCKQUOTE>  <div>I wish I could help you...<BR>The answer to this question is VERY important to me, too.&nbsp; I sent out a question to this mailing list on Saturday that described my nearly identical problem (although I included lots of details).&nbsp; Nobody responded at all.&nbsp; Perhaps I overwhelmed everyone with TMI???</div>  <div>&nbsp;</div>  <div>If there is no one here who can answer these questions, where can we go for help?</div>  <div>&nbsp;</div>  <div>Could someone please suggest a forum or reference document that can help Mr. Novin and me?&nbsp; I have spent 3 weeks searching for help on the 'net; and I have read the LVM HowTo several times.&nbsp; This mailing list was my best hope for assistance.</div>  <div>&nbsp;</div>  <div>Thanks again in advance for any help you might be able to provide, folks!</div>  <div>&nbsp;</div> 
 <div>-Tom-</div><p>&#32;
		<hr size=1><a href="http://us.rd.yahoo.com/evt=43256/*http://advision.webevents.yahoo.com/mailbeta"> All-new Yahoo! Mail </a>- Fire up a more powerful email and get things done faster.
--0-107115712-1156904217=:28286--
