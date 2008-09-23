Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8NLuGKe007776
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 17:56:16 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.225])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8NLu6LN003098
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 17:56:06 -0400
Received: by rv-out-0506.google.com with SMTP id f6so2386196rvb.51
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 14:56:05 -0700 (PDT)
Message-ID: <1c748a490809231456q4a0d2656y48427f57a8bbcb0c@mail.gmail.com>
Date: Tue, 23 Sep 2008 14:56:05 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] LVM label lost on MD RAID5 reshape?
In-Reply-To: <Pine.LNX.4.64.0809231419010.4246@gremlin.fruitbat.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_83530_16220796.1222206965679"
References: <20080923210233.GA32676@newbie.thebellsplace.net>
	<Pine.LNX.4.64.0809231419010.4246@gremlin.fruitbat.org>
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

------=_Part_83530_16220796.1222206965679
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Bob,

Notes interpolated.


On 9/23/08, Peter A. Castro <doctor@fruitbat.org> wrote:
>
> On Tue, 23 Sep 2008, Bob Bell wrote:
>
> Greetings, Bob,
>
> I'm up a creek, and hoping someone out there can help rescue my data, or at
>> least tell me what went wrong so that I don't have a repeat event.  I'm
>> starting with this question on linux-lvm, though let me know if you think
>> the discussion needs to be on linux-raid as well.
>>
>> I'm setting up a new server running Ubuntu's Hardy Heron release.  `lvm
>> version` reports:
>> LVM version:     2.02.26 (2007-06-15)
>> Library version: 1.02.20 (2007-06-15)
>> Driver version:  4.12.0
>> `uname -a` reports:
>> Linux sherwood 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686
>> GNU/Linux
>>
>> I initially created an md RAID5 device with only two components (matching
>> 320 GB SATA HDDs).
>
>
This is puzzling, since by the usual definition, there is no such thing as a
2-disk RAID5. Your description of its virtual size indicates it is a RAID1,
or equivalent.

  I created a single Physical Volume using the entirety of that md device
>> (320 GB), and then created several Logical Volumes for different filesystems
>> (all ext3).  This was done using the Ubuntu installer.  After installing I
>> used lvresize to increase the size of a few of the Logical Volumes, as I was
>> conservative regarding the size during installation.  These filesystems hold
>> data that is not a critical part of the system (mail, music, video, etc.).
>
>
The LVs live atop the virtual md device so this should not have done
anything essentially disturbing.

 (I also have a similar setup with a couple of IDE drives that I use for the
>> system (/home, /var, /boot, /), but I haven't touched those since the
>> install and they continue to work fine.)
>>
>> I then copied data from a third matching 320 GB SATA HDD to one of the
>> Logical Volume filesystems on the md device.  After freeing up that drive
>> (by relocating its contents to the LVM/MD setup), I added the drive to the
>> md device, which brought the total to 2 active devices and 1 spare device.
>>  I then grew the number of devices to 3 and waited for  the reshape to
>> finish (increasing the capacity to 640 GB).
>
>
If this is a reshape in md, then LVM should have seen nothing (since the 320
GB it knew about should still be there).

   I bumped the values in /proc/sys/dev/raid/ so that I wouldn't have to
>> wait as long.
>>
>
> My understanding of RAID5 is that once you configure the set of disks to
> the array, you can't just add an additional disk to it.  Attempting to do
> so does more than just "reshape" the array, it changes the logical layout
> of the sectors completely.  It's no wonder that LVM can't find anything,
> since it's data (if it survived the reorg) is no longer where it should
> be.  And, once you've done this, there's really no going back to recover.
> This is assuming my understanding of RAID5 is correct.


I disagree, because assuming the md reshape operates intuitively, the old
320 GB of data should still be visible as the first 320 GB of data on the
new VIRTUAL 640GB device. And LVM should know nothing about the underlying
RAIDing, so it should be happy to look there. However, I have no idea what
"bumped the values in /proc/sys/dev/raid/" means, or if it causes LVM to
look in the wrong places for things.

Larry Dickson
Cutting Edge Networked Storage

 Now that the reshaping is completed, LVM can't find the physical volume on
>> that device anymore.  I tried rebooting the system, but the problem
>> remained. Checking /proc/mdstat shows that the md device is up and healthy.
>>  The pvdisplay command only shows my other Physical Volume (for the IDE
>> drives). I found the pvck command and ran that on the md device, and it
>> states that there is no LVM label on the device.
>>
>> It is my understanding that the steps I outlined should have worked.  I
>> planned to follow them with pvresize, then lvresize, then umount, resize2fs,
>> and mount again.  I've seen this procedure outlined a few different places,
>> including at http://gentoo-wiki.com/Resize_LVM2_on_RAID5.
>>
>> Did I do something wrong?  Is there anyway to rescue my data?  I saved the
>> contents of /etc/lvm/backup/ when I noticed the problem -- perhaps that
>> might help?  If there's no way of saving the data, I'd at least like to
>> figure out what happened in the first place.
>>
>> Thank you.  Your thoughtfulness and help is appreciated.
>>
>
> --
> Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
>        "Cats are just autistic Dogs" -- Dr. Tony Attwood
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_83530_16220796.1222206965679
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi Bob,</div>
<div>&nbsp;</div>
<div>Notes interpolated.<br><br>&nbsp;</div>
<div><span class="gmail_quote">On 9/23/08, <b class="gmail_sendername">Peter A. Castro</b> &lt;<a href="mailto:doctor@fruitbat.org">doctor@fruitbat.org</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Tue, 23 Sep 2008, Bob Bell wrote:<br><br>Greetings, Bob,<span class="q"><br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">I&#39;m up a creek, and hoping someone out there can help rescue my data, or at least tell me what went wrong so that I don&#39;t have a repeat event. &nbsp;I&#39;m starting with this question on linux-lvm, though let me know if you think the discussion needs to be on linux-raid as well.<br>
<br>I&#39;m setting up a new server running Ubuntu&#39;s Hardy Heron release. &nbsp;`lvm version` reports:<br>LVM version: &nbsp; &nbsp; 2.02.26 (2007-06-15)<br>Library version: 1.02.20 (2007-06-15)<br>Driver version: &nbsp;4.12.0<br>`uname -a` reports:<br>
Linux sherwood 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686 GNU/Linux<br><br>I initially created an md RAID5 device with only two components (matching 320 GB SATA HDDs).</blockquote></span></blockquote>
<div>&nbsp;</div>
<div>This is puzzling, since by the usual definition, there is no such thing as a 2-disk RAID5. Your description of its virtual size indicates it is a RAID1, or equivalent.</div><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&nbsp;I created a single Physical Volume using the entirety of that md device (320 GB), and then created several Logical Volumes for different filesystems (all ext3). &nbsp;This was done using the Ubuntu installer. &nbsp;After installing I used lvresize to increase the size of a few of the Logical Volumes, as I was conservative regarding the size during installation. &nbsp;These filesystems hold data that is not a critical part of the system (mail, music, video, etc.).</blockquote>
</span></blockquote>
<div>&nbsp;</div>
<div>The LVs live atop the virtual md device so this should not have done anything essentially disturbing.</div><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">(I also have a similar setup with a couple of IDE drives that I use for the system (/home, /var, /boot, /), but I haven&#39;t touched those since the install and they continue to work fine.)<br>
<br>I then copied data from a third matching 320 GB SATA HDD to one of the Logical Volume filesystems on the md device. &nbsp;After freeing up that drive (by relocating its contents to the LVM/MD setup), I added the drive to the md device, which brought the total to 2 active devices and 1 spare device. &nbsp;I then grew the number of devices to 3 and waited for &nbsp;the reshape to finish (increasing the capacity to 640 GB).</blockquote>
</span></blockquote>
<div>&nbsp;</div>
<div>If this is a reshape in md, then LVM should have seen nothing (since the 320 GB it knew about should still be there).</div><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&nbsp;&nbsp;I bumped the values in /proc/sys/dev/raid/ so that I wouldn&#39;t have to wait as long.<br></blockquote>
<br></span>My understanding of RAID5 is that once you configure the set of disks to<br>the array, you can&#39;t just add an additional disk to it. &nbsp;Attempting to do<br>so does more than just &quot;reshape&quot; the array, it changes the logical layout<br>
of the sectors completely. &nbsp;It&#39;s no wonder that LVM can&#39;t find anything,<br>since it&#39;s data (if it survived the reorg) is no longer where it should<br>be. &nbsp;And, once you&#39;ve done this, there&#39;s really no going back to recover. This is assuming my understanding of RAID5 is correct.</blockquote>

<div>&nbsp;</div>
<div>I disagree, because assuming the md reshape operates intuitively, the old 320 GB of data should still be visible as the first 320 GB of data on the new VIRTUAL 640GB device. And LVM should know nothing about the underlying RAIDing, so it should be happy to look there. However, I have no idea what &quot;bumped the values in /proc/sys/dev/raid/&quot; means, or if it causes LVM to look in the wrong places for things.</div>

<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage</div><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Now that the reshaping is completed, LVM can&#39;t find the physical volume on that device anymore. &nbsp;I tried rebooting the system, but the problem remained. Checking /proc/mdstat shows that the md device is up and healthy. &nbsp;The pvdisplay command only shows my other Physical Volume (for the IDE drives). I found the pvck command and ran that on the md device, and it states that there is no LVM label on the device.<br>
<br>It is my understanding that the steps I outlined should have worked. &nbsp;I planned to follow them with pvresize, then lvresize, then umount, resize2fs, and mount again. &nbsp;I&#39;ve seen this procedure outlined a few different places, including at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://gentoo-wiki.com/Resize_LVM2_on_RAID5" target="_blank">http://gentoo-wiki.com/Resize_LVM2_on_RAID5</a>.<br>
<br>Did I do something wrong? &nbsp;Is there anyway to rescue my data? &nbsp;I saved the contents of /etc/lvm/backup/ when I noticed the problem -- perhaps that might help? &nbsp;If there&#39;s no way of saving the data, I&#39;d at least like to figure out what happened in the first place.<br>
<br>Thank you. &nbsp;Your thoughtfulness and help is appreciated.<br></blockquote><br>-- <br></span><span class="sg">Peter A. Castro &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:doctor@fruitbat.org" target="_blank">doctor@fruitbat.org</a>&gt; or &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:Peter.Castro@oracle.com" target="_blank">Peter.Castro@oracle.com</a>&gt;<br>
&nbsp; &nbsp; &nbsp; &nbsp;&quot;Cats are just autistic Dogs&quot; -- Dr. Tony Attwood</span> 
<div><span class="e" id="q_11c911ce8bb9bc32_5"><br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</span></div></blockquote></div><br>

------=_Part_83530_16220796.1222206965679--
