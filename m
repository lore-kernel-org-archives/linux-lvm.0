Message-ID: <20031231182801.4983.qmail@web13509.mail.yahoo.com>
From: Stuart Felenstein <stuart4m@yahoo.com>
Subject: Re: [linux-lvm] Totally confused
In-Reply-To: <Pine.LNX.4.44.0312311102580.32046-100000@www.sk-tech.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1458096933-1072895281=:4072"
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
Date: Thu Jan  1 11:29:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-1458096933-1072895281=:4072
Content-Type: text/plain; charset=us-ascii

Worked like a charm! Thank you.  
Originally I had it mounted off /opt , but somehow mucked it up when I recreated it.
 
Stuart

Lance Dillon <ldillon@sk-tech.com> wrote:
On Wed, 31 Dec 2003, Stuart Felenstein wrote:

> I thought I understood LVM and set it up correctly on
> my /dev/hda3. Somethings is wrong though. Here is
> the output from lvdisplay:
> 
> LV Name /dev/Volume00/videos
> VG Name Volume00
> LV Write Access read/write
> LV Status available
> LV# 1
> #open 1
> LV Size 68.67 GB
> Current LE 17579
> Allocated LE 17579
> Allocation next free
> Read ahead sectors 1024
> Block device 58:0 
> 
> After the LV was created I did
> mkfs ext3 -m 0 -T largefile /dev/Volume00/videos
> 
> Oddities (to me), I try to cd /dev/Volume00/videos - I
> get a no directory. cd to /dev/Volume00 is
> acccessible and can be written to. 
> I assumed that i was going to have a videos partition
> with 68.67 GB available. It looks like I have about
> 10 megs or something like that as 5 minutes of mpgeg
> gave me a "device out of space".
> 
> This is lvm 1.08 , straight from kernel 2.4.23
> builtin.
> 
> Am I just not doing something correct here?
> 
> Thanks
> Stuart
> 

The problem is that /dev/Volume00/videos is not the directory, but the 
device that you mount onto a directory. Try this instead:

mke2fs -j -T largefile -m 0 /dev/Volume000/videos
mkdir /videos
mount -t ext3 /dev/Volume00/videos /videos

This mounts the /dev/Volume00/videos lv onto the location /videos. You 
can mount it anywhere you like, of course.

Now you can write your files under /videos.

l



_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--0-1458096933-1072895281=:4072
Content-Type: text/html; charset=us-ascii

<DIV>Worked like a charm! Thank you.&nbsp; </DIV>
<DIV>Originally I had it mounted off /opt , but somehow mucked it up when I recreated it.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Stuart<BR><BR><B><I>Lance Dillon &lt;ldillon@sk-tech.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">On Wed, 31 Dec 2003, Stuart Felenstein wrote:<BR><BR>&gt; I thought I understood LVM and set it up correctly on<BR>&gt; my /dev/hda3. Somethings is wrong though. Here is<BR>&gt; the output from lvdisplay:<BR>&gt; <BR>&gt; LV Name /dev/Volume00/videos<BR>&gt; VG Name Volume00<BR>&gt; LV Write Access read/write<BR>&gt; LV Status available<BR>&gt; LV# 1<BR>&gt; #open 1<BR>&gt; LV Size 68.67 GB<BR>&gt; Current LE 17579<BR>&gt; Allocated LE 17579<BR>&gt; Allocation next free<BR>&gt; Read ahead sectors 1024<BR>&gt; Block device 58:0 <BR>&gt; <BR>&gt; After the LV was created I did<BR>&gt; mkfs ext3 -m 0 -T largefile /dev/Volume00/videos<BR>&gt; <BR>&gt; Oddities (to me), I try to cd /dev/Volume00/videos - I<BR>&gt; get a no directory. cd to /dev/Volume00 is<BR>&gt; acccessible and can be written to. <BR>&gt; I assumed that i was going to have a videos partition<BR>&gt; with 68.67 GB
 available. It looks like I have about<BR>&gt; 10 megs or something like that as 5 minutes of mpgeg<BR>&gt; gave me a "device out of space".<BR>&gt; <BR>&gt; This is lvm 1.08 , straight from kernel 2.4.23<BR>&gt; builtin.<BR>&gt; <BR>&gt; Am I just not doing something correct here?<BR>&gt; <BR>&gt; Thanks<BR>&gt; Stuart<BR>&gt; <BR><BR>The problem is that /dev/Volume00/videos is not the directory, but the <BR>device that you mount onto a directory. Try this instead:<BR><BR>mke2fs -j -T largefile -m 0 /dev/Volume000/videos<BR>mkdir /videos<BR>mount -t ext3 /dev/Volume00/videos /videos<BR><BR>This mounts the /dev/Volume00/videos lv onto the location /videos. You <BR>can mount it anywhere you like, of course.<BR><BR>Now you can write your files under /videos.<BR><BR>l<BR><BR><BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@sistina.com<BR>http://lists.sistina.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at
 http://tldp.org/HOWTO/LVM-HOWTO/</BLOCKQUOTE>
--0-1458096933-1072895281=:4072--
