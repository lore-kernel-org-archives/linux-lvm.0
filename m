Message-ID: <3DF15385.2020102@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering from a disaster...
References: <Pine.LNX.4.44.0212061842370.13951-100000@dragon.inside.ntisys.com>
Content-Transfer-Encoding: 7bit
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
Date: Fri Dec  6 19:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


>  
>
>>Someday we'll even see PC-class machines without a BIOS.
>>    
>>
>
>  Perhaps I misunderstand, but how does one boot without a BIOS?
>  
>
You could boot a PC class machine using EFI (which is really just a BIOS 
on steroids).  The nice thing about EFI is it isn't 16 bit, it can be 
developed easily in C, and its much faster then all that legacy 16 bit 
expansion rom PCI bootstrapping technique that really sucks.

-steve

>  
>
