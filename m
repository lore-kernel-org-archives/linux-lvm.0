Subject: Re: [linux-lvm] How well tested is the snapshot feature?
Message-ID: <20020608091022.GA1070@fib011235813.fsnet.co.uk>
References: <2D0AFEFEE711D611923E009027D39F2B02F18C@nasexs1.meridian-data.com> <20020608085931.GA915@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020608085931.GA915@fib011235813.fsnet.co.uk>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Sat Jun  8 04:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>

On Sat, Jun 08, 2002 at 09:59:31AM +0100, Joe Thornber wrote:
> exceptions LVM1 and EVMS will perform the following steps:
> 
> 1) Issue read of original chunk
> 2) wait
> 3) issue write
> 4) wait

I forgot about the metadata update:

6) issue metadata write
7) wait

device-mapper batches the metadata updates, under load this amortises
the cost away (well, to a point where I can't measure it).

- Joe
