Subject: Re: [linux-lvm] XFS crash on lvm
References: <1017872898.18631.8.camel@dumbo.zwecker.de>
    <1017874608.931.1426.camel@jen.americas.sgi.com>
    <1017908119.5373.3.camel@fry.sysctl-office.de>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <1017908119.5373.3.camel@fry.sysctl-office.de>
Message-Id: <wxx66374vlt.fsf@nommo.uio.no>
MIME-Version: 1.0
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
Date: Thu Apr  4 04:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Steve Lord <lord@sgi.com>

Christophe Zwecker <doc@zwecker.de> writes:

> the 200gb volume was made of a 160gb and a 40 gb partition. I order
> for the kernel to see the whole 160gb I had applied the ide patch to
> the kernel, which I forgot to apply to 2.4.18!!

  welcome to the club.  I had to go fetch 400GB over the wire last
  time I did that, and zapped the data because I thought there was
  some other error.
 
> so now Im rebuilding 2.4.18-xfs with new ide driver, pretty sure
> everything be back after reboot, I alrady had used the xfs patch
> from below.

  it will be, at least it was with reiserfs.
 
> damn, Im stupid :-)

  we're both stupid then.  =)

-- 
Terje
