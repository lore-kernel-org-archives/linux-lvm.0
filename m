Message-ID: <3D9ADFF2.4080606@lingbrae.com>
From: Dick Middleton <dick@lingbrae.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Upgrade Linux 2.2 to 2.4 problems
References: <3D9A201E.8070108@lingbrae.com> <20021002122716.B1955@sistina.com>
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
Date: Wed Oct  2 07:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

  Heinz,

>this can't be the exact LVM 0.9-Beta7 error message.
>
It sure is (except error is written ERROR and the message is on 2 lines 
:-) )

>Is /proc really mounted, *before* vgchange runs in /linuxrc?
>
Hmm - I'm not sure how I can tell.  The mount command certainly comes first
and there are no visible error messages.  I'm just using 
lvmcreate_initrd. If the
mount command fails then it gives an error message and vgchange gives me
different error messages so I assume it's working.

>BTW: why do you use such an old kernel and LVM version?
>     Please give a recent one and LVM 1.0.5 a try.
>
That's what I was trying to do (for a while)  until I discovered this 
kernel only has beta7 in it.

Curiously I had more success with 1.0.5 tools on this kernel.   

I think I'll take your advice and start again.

Many thanks for your support.

Dick

>>
>>vgscan appears to work ok but vgchange fails with:
>>
>>Error- can't get names of physical volumes - please check if /proc is 
>>mounted.
>>
>>Well, /proc is mounted - in fact if it isn't mounted I don't this error.
>>
>>What does this error message mean and what's likely to be wrong to cause it?
>>    
>>
>
>  
>
