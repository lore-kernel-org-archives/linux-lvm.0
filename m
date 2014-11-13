Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sADK4e7E028925
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 15:04:40 -0500
Received: from golfcontact.eu (golfcontact.eu [62.210.207.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sADK4cvF028689
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 15:04:39 -0500
Received: from [10.0.0.140] (143.141.broadband17.iol.cz [109.80.141.143])
	by golfcontact.eu (Postfix) with ESMTPSA id 9102F28807EB
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 21:04:37 +0100 (CET)
Message-ID: <54650ED4.7030409@ttux.net>
Date: Thu, 13 Nov 2014 21:04:36 +0100
From: Marc des Garets <marc@ttux.net>
MIME-Version: 1.0
References: <1415908098.760.YahooMailBasic@web181504.mail.ne1.yahoo.com>
In-Reply-To: <1415908098.760.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] broken fs after removing disk from group
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Yes, it's human readable. It's the one I sent in my previous email.

lvdisplay gives the following:
   --- Logical volume ---
   LV Path                /dev/VolGroup00/lvolmedia
   LV Name                lvolmedia
   VG Name                VolGroup00
   LV UUID                aidfLk-hjlx-Znrp-I0Pb-JtfS-9Fcy-OqQ3EW
   LV Write Access        read/write
   LV Creation host, time archiso, 2014-06-09 10:32:20 +0200
   LV Status              suspended
   # open                 0
   LV Size                2.52 TiB
   Current LE             660023
   Segments               3
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:0


On 11/13/2014 08:48 PM, matthew patton wrote:
>> https://www.novell.com/coolsolutions/appnote/19386.html#DiskPermanentlyRemoved
>   
>   >  pvdisplay shows the 3 disks exactly like before I had the one that
>
>> The filesystem size (according to the superblock) is 675863552 blocks
>> The physical size of the device is 597721088 blocks
> what about LVdisplay? Clearly the replacement chunk from the new device isn't the correct size. It's short by 39071232KB or roughly 37GB.
>
> Is the VG configuration restore file human readable?
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
