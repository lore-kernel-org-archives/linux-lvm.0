From: Micah Anderson <micah@riseup.net>
Subject: Re: [linux-lvm] lvm fault tolerance
Message-ID: <20040105160449.GC2849@riseup.net>
References: <20040105044435.GA25651@daemonB>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040105044435.GA25651@daemonB>
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
Date: Mon Jan  5 10:06:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You have some hope, but not much. You would have a lot of hope if you
created a RAID mirror (I suggest software raid) and then used those
resultant devices to create your giggers.

micah

On Sun, 04 Jan 2004, Dmitry wrote:

> Hey guys, I have a quick question I haven't been able to find an aswer
> to online.
> 
> Lets say I have a 3giger and and a 60giger.
> I join them using LVM into one logical partition. Lets say the 3 giger
> fails, do I have any hope recovering what resides on the 60 giger part
> of the logical partition?
> 
> Thanks in advance.
> 
> -D
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
