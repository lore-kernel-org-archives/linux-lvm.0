Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2102EK03102
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 19:02:15 -0500
Received: from cloud.atmos.ucla.edu (cloud.atmos.ucla.edu [128.97.77.46])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j21028Kv013168
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 19:02:09 -0500
Received: from [128.97.36.177] (taux.igpp.ucla.edu [128.97.36.177])
	by cloud.atmos.ucla.edu (8.9.3/8.9.3) with ESMTP id QAA20997
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 16:01:53 -0800 (PST)
Message-ID: <4223B0FE.9050103@gmx.net>
Date: Mon, 28 Feb 2005 16:02:06 -0800
From: langelino <langelino@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM1 Bad harddisk. How do I het data off the Volume?
References: <421E3614.5010107@gozar.dynu.com>	<20050228083636.GA18006@tykepenguin.com>	<a3558a980502280319499f1d6b@mail.gmail.com>	<422351F0.5010005@gozar.dynu.com>
	<a58063aa050228100359ab919@mail.gmail.com>
In-Reply-To: <a58063aa050228100359ab919@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


Maybe the Maxtor's "Powermax" can get your disk to remember its correct
specs. See

http://www.maxtor.com/portal/site/maxtor/menuitem.3c67e325e0a6b1f6294198b091346068/?channelpath=/en_us/Support/Software%20Downloads/ATA%20Hard%20Drives&downloadID=22&displayEULA=true

Annoyingly, you need a Windows box to create this utility disk.

Good luck


M. Matt Colgin wrote:

>Hello Heine,
>
>It sounds like you're in a bad spot. I've been having issues with
>Maxtor drives as of late myself. In the past 2 months, I've had 4 die
>and 2 WD. Be prepared. I haven't worked with LVM1, but you're probably
>sounds independant of the LVM version at this point.
>
>This bad spot... It's because the BIOS won't recognize the drive. The
>only way to get anything off the disk is to get it recognized by the
>computer, only then can you do some magical recovery stuff, like
>dd_rescue.
>
>Since you've already tried multiple controllers, the only thing I can
>suggest is to try a different computer. The key is going to be
>fiddling with the BIOS, only once you get the BIOS to recognize the
>drive, will you be able to proceed. Pull everything out of of the
>computer that isn't needed for running, that includes extra HD's,
>controller cards, sounds cards, everything. Try the Auto-Detect in the
>BIOS, if that doesn't work, try giving it the exact CHS parameters,
>try different computers (some BIOS will detect it). Try the PowerMax
>util from Maxtor, even if you can't get BIOS to quite recognize the
>drive, just a quick test as you don't want to strain the drive much
>more.
>
>If you can get it to POST with the correct drive, use the dd_rescue
>util and another drive. This will copy the old drive to a new one, at
>a sector by sector level. It'll take a *very* long time, but you might
>be able to get some data off the drive. But prepared for the worst and
>you'll be excited if you get anything off.
>
>As I said, I've had this happen quite a lot lately, with these crappy
>Maxtor drives and their 1 year warranty. DD_rescue took 5 days on a
>200 GB drive and was able to get 80% of the data off of the drive,
>enough that I could bring up the VG in paritial mode and get a lot of
>the data off, but alas a lot was lost too.
>
>http://www.garloff.de/kurt/linux/ddrescue/
>
>On Mon, 28 Feb 2005 18:16:32 +0100, Heine Laursen
><maillist@gozar.dynu.com> wrote:
>  
>
>>go0ogl3 wrote:
>>    
>>
>>>Did you check the ATA/ide cable? Did you try to replace that cable or
>>>to verify if the drive has one or more ide pins bent or shorted?
>>>      
>>>
>>Yes, I have tryed with 2 differnt controlers (onboard, and promse
>>controler) and 2 different ide cables. There are no pins who are bent.
>>
>>Sincerley
>>Heine Laursen
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>    
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>  
>
