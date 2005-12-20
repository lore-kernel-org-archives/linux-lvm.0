Received: from hydrogen.msp.redhat.com (hydrogen.msp.redhat.com [10.15.80.1])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id jBKLi1s5016801
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 16:44:02 -0500
Subject: Re: [linux-lvm] meaning of -L for snapshots ?
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <43A75529.10809@tsss.org>
References: <Pine.LNX.4.63.0512191419400.23209@s1.ckr-solutions.com>
	<43A75529.10809@tsss.org>
Date: Tue, 20 Dec 2005 15:43:59 -0600
Message-Id: <1135115039.6756.14.camel@hydrogen.msp.redhat.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Note, that if you guess wrong and create a snapshot that is too small,
you can always grow the volume (lvextend).

 brassow

On Mon, 2005-12-19 at 16:49 -0800, kelsey hudson wrote:
> 
> Olivier Kaloudoff wrote:
> 
> >     Who can explain the usage of -L10M for my snapshot ?
> 
> LVM snapshots have a limitation to how much data can change before the 
> snapshot becomes invalid. So, by using -L10M, you're saying to keep the 
> snapshot around until 10M of data has changed, then the snapshot becomes 
> invalid.
> 
> Because of the way LVM snapshots work, they require extra space on a 
> volume. So, the size of your snapshot volume dictates how long it will 
> remain valid. A good rule of thumb is between 10% and 20% of your 
> primary volume's size. That way, 10 to 20% of the filesystem's contents 
> can change and your snapshot will remain valid.
> 
> Hope this clears some things up for you.
> 
> -Kelsey
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
