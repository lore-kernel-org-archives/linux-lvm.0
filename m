Subject: Re: [linux-lvm] vgcfgrestore ouput
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20021021071750.GA838@tykepenguin.com>
References: <20021021071750.GA838@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1035187149.2789.5.camel@localhost.localdomain>
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
Date: Mon Oct 21 02:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> 
> It'll be fine :-) just
> 
> # pvcreate /dev/sdb
> # pvcreate /dev/sdc
> 
> and then issue the vgcfgrestore commands you have above.

My only worry about this, is that the configuration I have, is from
smaller disks. I don't know if that will screw my FS or not. :(
> then 
> 
> vgscan && vgchange -ay
> -- 
> 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
