Message-ID: <000701c2f58c$7b11dcf0$0400a8c0@venkat>
From: "abbireddy venkatram reddy" <venkat@storageone.co.kr>
References: <1048865232.7751.52.camel@mosix>
Subject: Re: [linux-lvm] snapshots on shared fibre
MIME-Version: 1.0
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
Date: Fri Mar 28 18:44:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I think it will not work?..by the way which is file system your using..?
----- Original Message ----- 
From: "Matt Schillinger" <mschilli@vss.fsi.com>
To: <linux-lvm@sistina.com>
Sent: Saturday, March 29, 2003 12:27 AM
Subject: [linux-lvm] snapshots on shared fibre


> I have a Xiotech Magnitude raid, that uses fibre ports to connect to
> multiple servers. 
> 
> We do NOT use a SAN filesystem. What I am wondering is, can I use
> snapshots that are mounted on 1 machine, where the original filesystem
> is mounted on another machine. both machines are connected to the raid
> via fibre.
> 
> My hope is that, since it is a second filesystem, and is readonly, this
> operation will not cause problems..
> 
> Is this correct?
> 
> 
> -- 
> Matt Schillinger
> 
> mschilli@vss.fsi.com
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
