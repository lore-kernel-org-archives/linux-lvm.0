Message-ID: <3DE173E4.5030200@machturtle.com>
From: David Corbin <dcorbin@machturtle.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RAID+LVM
References: <3DE0CCBB.3010405@machturtle.com> <20021125003014.GA21338@localhost>
In-Reply-To: <20021125003014.GA21338@localhost>
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
Date: Sun Nov 24 18:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


Jose Luis Domingo Lopez wrote:

>On Sunday, 24 November 2002, at 07:57:31 -0500,
>David Corbin wrote:
>
>  
>
>>I have a debian system with LVM on top of a RAID.  Once up and running, 
>>it seems to work OK.  It's the getting it up and running that's a 
>>problem.  At boot, the raid drive is started, and then
>>
>>               /sbin/vgscan --verbose >/root/vg.start
>>               /sbin/vgchange -a y --verbose >>/root/vg.start
>>
>>Now, after the system finishes booting, if login as root and run those 
>>two commands again, I get.
>>
>>    
>>
>I suppose your problem is the boot scritps trying to initialize LVM and
>software RAID in the wrong order (at least for your setup). To make a
>LVM on top of software RAID work, you first need to activate software
>RAID and then LVM.
>
>Maybe in the boot sequence LVM is initialized first, and it fails. Then
>it activates software RAID, which succeedes. After system startup you
>just need to "vgchange -ay", and everything works ok.
>
>Check /etc/rc2.d (runlevel 2 is typical for Debian), and see if
>rearranging boot scripts helps.
>  
>
I found the problem.  I had re-arrange the scripts in rc0.d to be 
correct, but not rcS.d.  Once they were in the correct order it works fine.

>Regards,
>
>  
>
