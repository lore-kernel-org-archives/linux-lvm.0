Subject: Re: [linux-lvm] Re: vgcreate problem
From: qv6 <sundiatah1@comcast.net>
In-Reply-To: <3F70473A.5090006@webhackande.se>
References: <1064318752.23712.5.camel@localhost>
	 <3F70473A.5090006@webhackande.se>
Message-Id: <1064320516.23712.15.camel@localhost>
Mime-Version: 1.0
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
Date: Tue Sep 23 08:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

 
On Tue, 2003-09-23 at 09:14, Rickard Olsson wrote:
> What does pvscan have to say?
> 
> And what does
> 
>   vgcreate -v  /dev/genis /dev/ide/host0/bus0/target1/lun0/disc
> 
> give as output?


This is weird, but I tried this command a zillion times yesterday and it
did not work. Just tried it now and it worked.

vgcreate -v genis /dev/ide/host0/bus0/target0/lun0/disc

Thanks to all for the tip.

Qv6
