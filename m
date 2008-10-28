Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9SKvYsu002683
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 16:57:35 -0400
Message-Id: <08781647-26E4-46F3-B148-A64933B84363@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <490678BE.1070700@hidden.domain.name>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] mirror and snapshot incompatible
Date: Tue, 28 Oct 2008 15:56:46 -0500
References: <490678BE.1070700@hidden.domain.name>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

It is possible to do all the things you are asking through device- 
mapper... but there is no easy way to do it.  (and LVM does not yet  
have the capabilities to manage this yet either.)

  brassow

On Oct 27, 2008, at 9:28 PM, Yoav wrote:

> According to lvcreate, a snapshot of a mirrored volume cannot be  
> created ("Snapshots and mirrors may not yet be mixed").  However,  
> devmapper does not seem to have the same limitation when used  
> directly (not through lvm).
>
> Is there a current reason for lvcreate to enforce this rather harsh  
> limitation?
>
> What are the risks I'm taking by manually creating a dm-snapshot  
> from a dm-mirror device?  (of course I'm also replacing the dm- 
> mirror device with a snapshot-origin of the actual dm-mirror device).
>
> If there is an actual reason for preventing this, what is the  
> suggested way to consistently backup a mirror volume?  Is there a  
> way to temporarily take one of the mirror "legs" (mimage devices)   
> offline in order to back it up, and resync it later?
>
>   Yoav
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
