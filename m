Subject: Re: [linux-lvm] Availabality of LVM on IA64???
From: Andrew Patterson <andrew@fc.hp.com>
In-Reply-To: <A11077E28200D51182EA00D0B7755253482045@xin02.india.hp.com>
References: <A11077E28200D51182EA00D0B7755253482045@xin02.india.hp.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1023121905.2955.27.camel@lvadp.fc.hp.com>
Mime-Version: 1.0
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
Date: Mon Jun  3 11:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, 2002-06-03 at 07:16, LAKSHMIPATHY,ARUN (HP-India,ex2) wrote:
> Hi,
> 
> Wanted to check out if 1.1-rc2 supports IA64 platform or not. When I try and
> build the lvm lib from the 1.1-rc2 sources i get a lot of integer to pointer
> type cast warnings, hence I have this doubt could not find any release
> notes/docs which mention anything about IA64 support.  Need  to know if IA64
> support is available on 1.1 or not, else is there any beta that I can try
> out?? 
> 
> Also when i build 1.1-rc1 sources i get a shared lib as well as a arcghive
> lib whereas building 1.1-rc2 builds only an archive lib, i need a shared
> lib, am i missing something here?  
> 
> Regards
> Arun
> 


Hi Arun,

We had talked to Sistina about porting LVM to IA64 earlier this year. 
They told us that they did not have the equipment to do the port.  I
suggested to our management that it might be a good idea to send them a
system, but the issue was dropped.

Andrew

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Andrew Patterson                          Voice:  (970) 898-3261
   Hewlett-Packard Company                   Email:  andrew@fc.hp.com
