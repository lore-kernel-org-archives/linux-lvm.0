Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8OEE9Tc030740
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 10:14:10 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.228])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8OEDtpA013116
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 10:13:55 -0400
Received: by rv-out-0506.google.com with SMTP id f6so2743604rvb.51
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 07:13:54 -0700 (PDT)
Message-ID: <1c748a490809240713q16820093s37fabe97a17d680f@mail.gmail.com>
Date: Wed, 24 Sep 2008 07:13:54 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] LVM label lost on MD RAID5 reshape?
In-Reply-To: <Pine.LNX.4.64.0809231711250.4246@gremlin.fruitbat.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_91138_24552022.1222265634847"
References: <20080923210233.GA32676@newbie.thebellsplace.net>
	<Pine.LNX.4.64.0809231419010.4246@gremlin.fruitbat.org>
	<1c748a490809231456q4a0d2656y48427f57a8bbcb0c@mail.gmail.com>
	<Pine.LNX.4.64.0809231711250.4246@gremlin.fruitbat.org>
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

------=_Part_91138_24552022.1222265634847
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/23/08, Peter A. Castro <doctor@fruitbat.org> wrote:
>
> On Tue, 23 Sep 2008, Larry Dickson wrote:
>
> Hi Bob,
>>
>> Notes interpolated.
>>
>> On 9/23/08, Peter A. Castro <doctor@fruitbat.org> wrote:
>>
>>>
>>> On Tue, 23 Sep 2008, Bob Bell wrote:
>>>
>>> Greetings, Bob,
>>>
>>> I'm up a creek, and hoping someone out there can help rescue my data, or
>>> at
>>>
>>>> least tell me what went wrong so that I don't have a repeat event.  I'm
>>>> starting with this question on linux-lvm, though let me know if you
>>>> think
>>>> the discussion needs to be on linux-raid as well.
>>>>
>>>> I'm setting up a new server running Ubuntu's Hardy Heron release.  `lvm
>>>> version` reports:
>>>> LVM version:     2.02.26 (2007-06-15)
>>>> Library version: 1.02.20 (2007-06-15)
>>>> Driver version:  4.12.0
>>>> `uname -a` reports:
>>>> Linux sherwood 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686
>>>> GNU/Linux
>>>>
>>>> I initially created an md RAID5 device with only two components
>>>> (matching
>>>> 320 GB SATA HDDs).
>>>>
>>>
>>>
>>> This is puzzling, since by the usual definition, there is no such thing
>> as a
>> 2-disk RAID5. Your description of its virtual size indicates it is a
>> RAID1,
>> or equivalent.
>>
>
> While it's unusual to have only 2 disks in a "RAID5" (usally you want 3
> drives min), it is possible, if unreliable (can you say
> "half-of-a-mirror" ?)


If you are meaning a degraded 3-disk RAID5, then he should have had a
virtual size of 640GB. He reported 320GB which would be the value expected
of a RAID1. You can apply the RAID5 algorithm to 2 disks, but then you just
get the equivalent of a RAID1, since a parity sector made so the XOR sum of
it and ++ one ++ data sector is zero must equal that data sector.

Larry

  I created a single Physical Volume using the entirety of that md device
>>
>>> (320 GB), and then created several Logical Volumes for different
>>>> filesystems
>>>> (all ext3).  This was done using the Ubuntu installer.  After installing
>>>> I
>>>> used lvresize to increase the size of a few of the Logical Volumes, as I
>>>> was
>>>> conservative regarding the size during installation.  These filesystems
>>>> hold
>>>> data that is not a critical part of the system (mail, music, video,
>>>> etc.).
>>>>
>>>
>>>
>>> The LVs live atop the virtual md device so this should not have done
>> anything essentially disturbing.
>>
>
> Yep, I have several VG's with LV's on top a several MDs without any
> trouble.
>
>
>> (I also have a similar setup with a couple of IDE drives that I use for
>> the
>>
>>> system (/home, /var, /boot, /), but I haven't touched those since the
>>>> install and they continue to work fine.)
>>>>
>>>> I then copied data from a third matching 320 GB SATA HDD to one of the
>>>> Logical Volume filesystems on the md device.  After freeing up that
>>>> drive
>>>> (by relocating its contents to the LVM/MD setup), I added the drive to
>>>> the
>>>> md device, which brought the total to 2 active devices and 1 spare
>>>> device.
>>>>  I then grew the number of devices to 3 and waited for  the reshape to
>>>> finish (increasing the capacity to 640 GB).
>>>>
>>>
>>>
>>> If this is a reshape in md, then LVM should have seen nothing (since the
>> 320
>> GB it knew about should still be there).
>>
>>  I bumped the values in /proc/sys/dev/raid/ so that I wouldn't have to
>>
>>> wait as long.
>>>>
>>>>
>>> My understanding of RAID5 is that once you configure the set of disks to
>>> the array, you can't just add an additional disk to it.  Attempting to do
>>> so does more than just "reshape" the array, it changes the logical layout
>>> of the sectors completely.  It's no wonder that LVM can't find anything,
>>> since it's data (if it survived the reorg) is no longer where it should
>>> be.  And, once you've done this, there's really no going back to recover.
>>> This is assuming my understanding of RAID5 is correct.
>>>
>>
>> I disagree, because assuming the md reshape operates intuitively, the old
>> 320 GB of data should still be visible as the first 320 GB of data on the
>> new VIRTUAL 640GB device. And LVM should know nothing about the underlying
>> RAIDing, so it should be happy to look there. However, I have no idea what
>> "bumped the values in /proc/sys/dev/raid/" means, or if it causes LVM to
>> look in the wrong places for things.
>>
>
> I don't believe the MD/RAID5 operates in this way.  He started with a
> 2-disk RAID5 (effectively having the data logically interleaved between
> the two drives), then he added an additional disk.  The way RAID works,
> it doesn't just add the disk space to the end of the array (that would
> not create a recoverable scenario should it or one of the others fail),
> it re-integrates and effectively re-interleaves the logical sectors to
> re-spread the data across all three drives.  The trouble is, I don't
> think you can actually do this with current MD tech (I could be wrong).
>
> Perhaps a better question would be to ask how, exactly, Bob create his
> array initially (what commands) and what steps he took to add the new
> drive (again, what commands did he issue).  That would give us a better
> idea of how the array looked before and after.
>
> All of this is orthogonal to LVM, however.  I suspect a RAID/MD email
> list would be a better forum to discuss this.
>
> Larry Dickson
>> Cutting Edge Networked Storage
>>
>> Now that the reshaping is completed, LVM can't find the physical volume on
>>
>>> that device anymore.  I tried rebooting the system, but the problem
>>>> remained. Checking /proc/mdstat shows that the md device is up and
>>>> healthy.
>>>>  The pvdisplay command only shows my other Physical Volume (for the IDE
>>>> drives). I found the pvck command and ran that on the md device, and it
>>>> states that there is no LVM label on the device.
>>>>
>>>> It is my understanding that the steps I outlined should have worked.  I
>>>> planned to follow them with pvresize, then lvresize, then umount,
>>>> resize2fs,
>>>> and mount again.  I've seen this procedure outlined a few different
>>>> places,
>>>> including at http://gentoo-wiki.com/Resize_LVM2_on_RAID5.
>>>>
>>>> Did I do something wrong?  Is there anyway to rescue my data?  I saved
>>>> the
>>>> contents of /etc/lvm/backup/ when I noticed the problem -- perhaps that
>>>> might help?  If there's no way of saving the data, I'd at least like to
>>>> figure out what happened in the first place.
>>>>
>>>> Thank you.  Your thoughtfulness and help is appreciated.
>>>>
>>>>
>>> --
>>> Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
>>>       "Cats are just autistic Dogs" -- Dr. Tony Attwood
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>>
>>
> --
> Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
>        "Cats are just autistic Dogs" -- Dr. Tony Attwood
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_91138_24552022.1222265634847
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br>
<div><span class="gmail_quote">On 9/23/08, <b class="gmail_sendername">Peter A. Castro</b> &lt;<a href="mailto:doctor@fruitbat.org">doctor@fruitbat.org</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">On Tue, 23 Sep 2008, Larry Dickson wrote:<br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi Bob,<br><br>Notes interpolated.<br><br>On 9/23/08, Peter A. Castro &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:doctor@fruitbat.org" target="_blank">doctor@fruitbat.org</a>&gt; wrote:<br>

<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>On Tue, 23 Sep 2008, Bob Bell wrote:<br><br>Greetings, Bob,<br><br>I&#39;m up a creek, and hoping someone out there can help rescue my data, or at<br>

<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">least tell me what went wrong so that I don&#39;t have a repeat event. &nbsp;I&#39;m<br>starting with this question on linux-lvm, though let me know if you think<br>
the discussion needs to be on linux-raid as well.<br><br>I&#39;m setting up a new server running Ubuntu&#39;s Hardy Heron release. &nbsp;`lvm<br>version` reports:<br>LVM version: &nbsp; &nbsp; 2.02.26 (2007-06-15)<br>Library version: 1.02.20 (2007-06-15)<br>
Driver version: &nbsp;4.12.0<br>`uname -a` reports:<br>Linux sherwood 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686<br>GNU/Linux<br><br>I initially created an md RAID5 device with only two components (matching<br>320 GB SATA HDDs).<br>
</blockquote><br><br></blockquote>This is puzzling, since by the usual definition, there is no such thing as a<br>2-disk RAID5. Your description of its virtual size indicates it is a RAID1,<br>or equivalent.<br></blockquote>
<br></span>While it&#39;s unusual to have only 2 disks in a &quot;RAID5&quot; (usally you want 3<br>drives min), it is possible, if unreliable (can you say<br>&quot;half-of-a-mirror&quot; ?)</blockquote>
<div>&nbsp;</div>
<div>If you are meaning a degraded 3-disk RAID5, then he should have had a virtual size of 640GB. He reported 320GB which would be the value expected of a RAID1. You can apply the RAID5 algorithm to 2 disks, but then you just get the equivalent of a RAID1, since a parity sector made so the&nbsp;XOR sum of it and ++ one ++ data sector is zero must equal that data sector.</div>

<div>&nbsp;</div>
<div>Larry</div><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&nbsp;I created a single Physical Volume using the entirety of that md device<br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">(320 GB), and then created several Logical Volumes for different filesystems<br>(all ext3). &nbsp;This was done using the Ubuntu installer. &nbsp;After installing I<br>
used lvresize to increase the size of a few of the Logical Volumes, as I was<br>conservative regarding the size during installation. &nbsp;These filesystems hold<br>data that is not a critical part of the system (mail, music, video, etc.).<br>
</blockquote><br><br></blockquote>The LVs live atop the virtual md device so this should not have done<br>anything essentially disturbing.<br></blockquote><br></span>Yep, I have several VG&#39;s with LV&#39;s on top a several MDs without any trouble. 
<div><span class="e" id="q_11c91bc796a97e2a_4"><br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>(I also have a similar setup with a couple of IDE drives that I use for the<br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">system (/home, /var, /boot, /), but I haven&#39;t touched those since the<br>install and they continue to work fine.)<br>
<br>I then copied data from a third matching 320 GB SATA HDD to one of the<br>Logical Volume filesystems on the md device. &nbsp;After freeing up that drive<br>(by relocating its contents to the LVM/MD setup), I added the drive to the<br>
md device, which brought the total to 2 active devices and 1 spare device.<br>&nbsp;I then grew the number of devices to 3 and waited for &nbsp;the reshape to<br>finish (increasing the capacity to 640 GB).<br></blockquote><br><br></blockquote>
If this is a reshape in md, then LVM should have seen nothing (since the 320<br>GB it knew about should still be there).<br><br>&nbsp;I bumped the values in /proc/sys/dev/raid/ so that I wouldn&#39;t have to<br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">wait as long.<br><br></blockquote><br>My understanding of RAID5 is that once you configure the set of disks to<br>
the array, you can&#39;t just add an additional disk to it. &nbsp;Attempting to do<br>so does more than just &quot;reshape&quot; the array, it changes the logical layout<br>of the sectors completely. &nbsp;It&#39;s no wonder that LVM can&#39;t find anything,<br>
since it&#39;s data (if it survived the reorg) is no longer where it should<br>be. &nbsp;And, once you&#39;ve done this, there&#39;s really no going back to recover.<br>This is assuming my understanding of RAID5 is correct.<br>
</blockquote><br>I disagree, because assuming the md reshape operates intuitively, the old<br>320 GB of data should still be visible as the first 320 GB of data on the<br>new VIRTUAL 640GB device. And LVM should know nothing about the underlying<br>
RAIDing, so it should be happy to look there. However, I have no idea what<br>&quot;bumped the values in /proc/sys/dev/raid/&quot; means, or if it causes LVM to<br>look in the wrong places for things.<br></blockquote><br>
</span></div>I don&#39;t believe the MD/RAID5 operates in this way. &nbsp;He started with a<br>2-disk RAID5 (effectively having the data logically interleaved between<br>the two drives), then he added an additional disk. &nbsp;The way RAID works,<br>
it doesn&#39;t just add the disk space to the end of the array (that would<br>not create a recoverable scenario should it or one of the others fail),<br>it re-integrates and effectively re-interleaves the logical sectors to<br>
re-spread the data across all three drives. &nbsp;The trouble is, I don&#39;t<br>think you can actually do this with current MD tech (I could be wrong).<br><br>Perhaps a better question would be to ask how, exactly, Bob create his<br>
array initially (what commands) and what steps he took to add the new<br>drive (again, what commands did he issue). &nbsp;That would give us a better<br>idea of how the array looked before and after.<br><br>All of this is orthogonal to LVM, however. &nbsp;I suspect a RAID/MD email<br>
list would be a better forum to discuss this. 
<div><span class="e" id="q_11c91bc796a97e2a_6"><br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Larry Dickson<br>Cutting Edge Networked Storage<br><br>Now that the reshaping is completed, LVM can&#39;t find the physical volume on<br>

<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">that device anymore. &nbsp;I tried rebooting the system, but the problem<br>remained. Checking /proc/mdstat shows that the md device is up and healthy.<br>
&nbsp;The pvdisplay command only shows my other Physical Volume (for the IDE<br>drives). I found the pvck command and ran that on the md device, and it<br>states that there is no LVM label on the device.<br><br>It is my understanding that the steps I outlined should have worked. &nbsp;I<br>
planned to follow them with pvresize, then lvresize, then umount, resize2fs,<br>and mount again. &nbsp;I&#39;ve seen this procedure outlined a few different places,<br>including at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://gentoo-wiki.com/Resize_LVM2_on_RAID5" target="_blank">http://gentoo-wiki.com/Resize_LVM2_on_RAID5</a>.<br>
<br>Did I do something wrong? &nbsp;Is there anyway to rescue my data? &nbsp;I saved the<br>contents of /etc/lvm/backup/ when I noticed the problem -- perhaps that<br>might help? &nbsp;If there&#39;s no way of saving the data, I&#39;d at least like to<br>
figure out what happened in the first place.<br><br>Thank you. &nbsp;Your thoughtfulness and help is appreciated.<br><br></blockquote><br>--<br>Peter A. Castro &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:doctor@fruitbat.org" target="_blank">doctor@fruitbat.org</a>&gt; or &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:Peter.Castro@oracle.com" target="_blank">Peter.Castro@oracle.com</a>&gt;<br>
&nbsp; &nbsp; &nbsp; &quot;Cats are just autistic Dogs&quot; -- Dr. Tony Attwood<br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br></blockquote><br></blockquote><br>-- <br>Peter A. Castro &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:doctor@fruitbat.org" target="_blank">doctor@fruitbat.org</a>&gt; or &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:Peter.Castro@oracle.com" target="_blank">Peter.Castro@oracle.com</a>&gt;<br>
&nbsp; &nbsp; &nbsp; &nbsp;&quot;Cats are just autistic Dogs&quot; -- Dr. Tony Attwood</span></div><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_91138_24552022.1222265634847--
