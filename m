Subject: Re: [linux-lvm] question about LVM kernel module - mirroring
Message-ID: <20021011114841.GA2613@fib011235813.fsnet.co.uk>
References: <3DA6B710.6060304@dedalus.com.br>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DA6B710.6060304@dedalus.com.br>
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
Date: Fri Oct 11 07:09:55 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 11, 2002 at 08:33:36AM -0300, Luca Lavorante wrote:
> Hi everybody, I am new to the list and hope you will excuse my (perhaps) 
> silly questions.
> 
> 1) I have seen in the LVM documentation that the program is divided into:
> 
>   - A kernel module
>   - a set o binaries (commands etc.)
> 
> I?d like to know whether it is possible to use LVM WITHOUT a kernel 
> module.

No.

> 2) How can I perform mirroring using LVM? I know the kernel can do that 
> on local disks. Is it possible for the kernel of  two clustered machines 
> to mirror two disks on an external storage?

LVM doesn't support mirroring ATM.  Try the software raid driver (md).

- Joe
