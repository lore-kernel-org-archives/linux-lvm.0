Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22HwNK30418
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 12:58:23 -0500
Received: from pastinakel.tue.nl (pastinakel.tue.nl [131.155.2.7])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j22HwLQs004540
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 12:58:21 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by pastinakel.tue.nl (Postfix) with ESMTP id A842D14BB63
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 18:58:20 +0100 (CET)
Received: from [131.155.224.41] (t-26-41.athome.tue.nl [131.155.224.41])
	by iris.tue.nl (Postfix) with ESMTP id A2A1610C0F4
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 18:58:20 +0100 (CET)
Message-ID: <4225FEBC.2060505@are-b.org>
Date: Wed, 02 Mar 2005 18:58:20 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
References: <4225FBC8.9020904@are-b.org> <20050302174819.GN17589@lug-owl.de>
In-Reply-To: <20050302174819.GN17589@lug-owl.de>
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

When i do a less -f /dev/hde I can see a lot of data.

E.g. I see a string looking a lot like ReiserFS and scrolling down 
further I see /dev/vg00/<nameofparts created> so I'm sure a LOT is still 
there. I'll give it a shot. Any other ideas are still welcome!

Jan-Benedict Glaw wrote:

>On Wed, 2005-03-02 18:45:44 +0100, oliver <oliver@are-b.org>
>wrote in message <4225FBC8.9020904@are-b.org>:
>  
>
>>The raid controller complained about a corrupt volume and destroyed it. 
>>It was done within a blink of an eye. (So i don't think everything is wiped.
>>
>>However LVM can't find my VG anymore. fdisk -l /dev/hde shows me that 
>>there simply isn't anything on it. Where as fdisk -l /dev/hdg tells me 
>>"Disk /dev/hdg doesn't contain a valid partition table" as I would have 
>>expected.
>>    
>>
>
>gpart could possibly help by guessing a partition table. This helped me
>several times getting some friend's broken Windoze machines to work
>again. (@gpart author: if we ever meet IRL, I owe you a beer!)
>
>MfG, JBG
>
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
